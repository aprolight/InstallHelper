using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Diagnostics;
using System.IO;
using System.Threading;
using System.Reflection;
using System.Runtime.InteropServices;

namespace SundanceInstallHelper.Common
{
    public enum LogKinds
    {
        /// <summary>
        /// Debug
        /// </summary>
        Debug,
        /// <summary>
        /// Information
        /// </summary>
        Info,
        /// <summary>
        /// Error
        /// </summary>
        Error,
        /// <summary>
        /// Warning
        /// </summary>
        Warn
    }

    /// <summary>
    /// Enumeration of the various logging types
    /// </summary>
    public enum LogType
    {
        File,
        Event,
        All,
        DebugOnly
    }

    [IgnoreStackTrace()]
    public class GenericLogger : IDisposable
    {
        #region Fields

        protected object lockObj = new object();

        protected string appName;
        protected LogFilterOption filterOption = new LogFilterOption();

        protected string logFolderPath;
        protected string loggerName = "Logger";

        protected bool useAutoRemove = true;
        protected int autoRemovePeriod = 60;
        protected bool forceDebugOutput = false;
        protected DateTime lastRemovedTime = DateTime.MinValue;
        protected bool enableDebugWrite = false;

        #endregion


        #region Constructors

        /// <summary>
        /// Constructor
        /// </summary>
        public GenericLogger()
        {
            LoadFilterOption();
            Assembly assembly = (Assembly.GetEntryAssembly() != null) ? Assembly.GetEntryAssembly() : Assembly.GetExecutingAssembly();
            appName = "SundanceInstallHelper";

            logFolderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), Path.Combine(appName, "Log"));

            AppConfigurationHelper appConfig = new AppConfigurationHelper(assembly);

            try
            {
                if (appConfig.ContainsKey("LogPeriodDay"))
                    autoRemovePeriod = Convert.ToInt32(appConfig["LogPeriodDay"]);

                if (appConfig.ContainsKey("AutoRemoveLog"))
                    useAutoRemove = Convert.ToBoolean(appConfig["AutoRemoveLog"]);

                if (appConfig.ContainsKey("LogDebugOutput"))
                    forceDebugOutput = Convert.ToBoolean(appConfig["LogDebugOutput"]);

            }
            catch (Exception ex)
            {
                WriteLogEntry(ex);
            }
        }

        ~GenericLogger()
        {
            Dispose();
        }

        #endregion

        #region Properties

        public string AppName
        {
            get { return appName; }
            set { appName = value; }
        }


        public LogFilterOption FilterOption
        {
            get { return filterOption; }
            set
            {
                if (value == null)
                {
                    return;
                }

                filterOption.CopyValues(value);
            }
        }

        public string LogFolderPath
        {
            get { return logFolderPath; }
            set
            {
                logFolderPath = value;
                if (!String.IsNullOrEmpty(logFolderPath) && !Directory.Exists(logFolderPath))
                {
                    Directory.CreateDirectory(logFolderPath);
                }
            }
        }

        public string CurrentLogFolder
        {
            get
            {
                string currentLogFolder = Path.Combine(logFolderPath, DateTime.Now.ToString("yyyy-MM-dd") + "\\");

                if (Directory.Exists(currentLogFolder) == false)
                {
                    Directory.CreateDirectory(currentLogFolder);
                }

                return currentLogFolder;
            }
        }

        public string CurrentLogFile
        {
            get
            {
                string logFileName = GetLogFileNameForApp(AppName);
                return Path.Combine(CurrentLogFolder, logFileName);
            }
        }

        public string LoggerName
        {
            get { return loggerName; }
            set { loggerName = value; }
        }

        public bool UseAutoRemove
        {
            get { return useAutoRemove; }
            set { useAutoRemove = value; }
        }

        public int AutoRemovePeriod
        {
            get { return autoRemovePeriod; }
            set { autoRemovePeriod = value; }
        }

        public bool EnableDebugWrite
        {
            get { return enableDebugWrite; }
            set { enableDebugWrite = value; }
        }

        #endregion

        #region Private / Protected Methods

        struct LogInfo
        {
            public LogType LogType;
            public bool IsDebugOut;
            public string Message;

            public LogInfo(LogType logType, string message, bool isDebugOut)
            {
                LogType = logType;
                Message = message;
                IsDebugOut = isDebugOut;
            }
        }


        protected Assembly GetAssembly()
        {
            return (Assembly.GetEntryAssembly() != null) ? Assembly.GetEntryAssembly() : Assembly.GetExecutingAssembly();
        }

        protected void LoadFilterOption()
        {
            string startFile = GetAssembly().Location;
            LogFilterOption option = LogFilterOption.LoadFromFile(String.Format("{0}\\LogFilterOption_{1}.xml",
                Path.GetDirectoryName(startFile),
                Path.GetFileNameWithoutExtension(startFile)));
            if (option == null)
                return;

            FilterOption = option;
        }

        private Thread _loggingThread;
        private AutoResetEvent _loggingEvent = new AutoResetEvent(false);
        private List<LogInfo> _loggingMessages = new List<LogInfo>();

        private void LogingThreadProc()
        {
            List<LogInfo> tempMessages = new List<LogInfo>();
            while (_loggingThread.IsAlive)
            {
                if (_loggingEvent.WaitOne(Timeout.Infinite, false))
                {
                    lock (_loggingMessages)
                    {
                        tempMessages.AddRange(_loggingMessages);
                        _loggingMessages.Clear();
                    }
                    foreach (LogInfo log in tempMessages)
                    {
                        WriteLogTo(log.LogType, log.Message, log.IsDebugOut);
                        Thread.Sleep(0);
                    }
                    tempMessages.Clear();
                }
            }
        }

        protected virtual void AppendStackTrace(StringBuilder builder)
        {
            // append the calling method location and line number
            StackTrace trace = new StackTrace(true);

            for (int i = 0; i < trace.FrameCount; i++)
            {
                StackFrame frame = trace.GetFrame(i);
                MethodBase method = frame.GetMethod();

                if (method.DeclaringType.GetCustomAttributes(typeof(IgnoreStackTraceAttribute), true).Length <= 0)
                {
                    builder.Append(string.Format(" ({0}.{1}()", method.DeclaringType.Name, method.Name));

                    int lineNumber = frame.GetFileLineNumber();
                    if (lineNumber > 0) builder.Append(" line " + lineNumber.ToString());

                    builder.Append(")");
                    break;
                }
            }
        }

        private string _LastExceptionMessage = String.Empty;
        private DateTime _LastExceptionTime = DateTime.MinValue;
        private bool IsDuplicateLog(string module, string message, Exception ex, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            //짧은 시간 안에 Exception 로그만 중복 체크 함
            if (!String.IsNullOrEmpty(message) || ex == null) return false;
            string currentMessage = ex.Message;

            if (String.IsNullOrEmpty(_LastExceptionMessage))
            {
                _LastExceptionMessage = currentMessage;
                _LastExceptionTime = DateTime.Now;
            }
            else
            {
                if (String.Equals(currentMessage, _LastExceptionMessage))
                {
                    //2분 이내 로그가 중복으로 쌓이면 무시하도록 함.
                    if ((DateTime.Now - _LastExceptionTime).Minutes < 2) return true;
                    else _LastExceptionTime = DateTime.Now;
                }
                else
                {
                    _LastExceptionMessage = currentMessage;
                    _LastExceptionTime = DateTime.Now;
                }
            }

            return false;
        }

        protected virtual void WriteLogEntryCore(string module, string message, Exception ex, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            try
            {
                lock (lockObj)
                {
                    //Checked duplicate log
                    if (IsDuplicateLog(module, message, ex, logType, isDebugOutput, includeCaller)) return;

                    //
                    // build the message to log, regardless of where we are sending it
                    //--------------------------------------------------
                    StringBuilder msg = new StringBuilder();

                    DateTime curTime = DateTime.Now;

                    // date
                    if (TimeZoneInfo.Local.BaseUtcOffset.TotalSeconds > 0)
                    {
                        msg.Append(String.Format("{0} ({1:D6}) - ",
                            curTime.ToString("yyyy/MM/dd HH:mm:ss"),
                            Convert.ToInt32(TimeZoneInfo.Local.BaseUtcOffset.TotalSeconds)));
                    }
                    else
                    {
                        msg.Append(String.Format("{0} ({1:D5}) - ",
                            curTime.ToString("yyyy/MM/dd HH:mm:ss"),
                            Convert.ToInt32(TimeZoneInfo.Local.BaseUtcOffset.TotalSeconds)));
                    }

                    // module, if provided, else use calling method obtained from stack trace
                    if (module != "") msg.Append(module);

                    msg.Append(": ");

                    // append the message, if provided. if not, but there's an exception, write its message
                    if (message != "") msg.Append(message);
                    else if (ex != null) msg.Append("EXCEPTION: " + ex.Message);

                    // if specified, append the calling method and line number
                    if (includeCaller)
                    {
                        AppendStackTrace(msg);
                    }


                    if (ex != null)
                    {
                        // add the default info obtained by ToString(), which includes class, message, stack trace, etc.

                        // indent exception message
                        string pad = "    ";
                        string cleanMessage = CleanException(ex.ToString());
                        msg.Append(Environment.NewLine + pad + "DETAIL:" + cleanMessage.Replace(Environment.NewLine, Environment.NewLine + pad));
                    }


                    // Filter text
                    if ((ex == null) || ((ex != null) && filterOption.FilterException))
                    {
                        if (filterOption.FilterTexts.Count > 0)
                        {
                            char[] temp = new char[msg.Length];
                            msg.CopyTo(0, temp, 0, msg.Length);
                            String sourceString = new String(temp);  // String sourceString = msg.ToString(); (why use a char array for this? - DLH)
                            bool foundFilterText = false;

                            foreach (string filterText in filterOption.FilterTexts)
                            {
                                if (sourceString.IndexOf(filterText, filterOption.FilterIgnoreCase ? StringComparison.CurrentCultureIgnoreCase : StringComparison.CurrentCulture) >= 0)
                                {
                                    foundFilterText = true;
                                    break;
                                }
                            }

                            if ((filterOption.IsInclude && !foundFilterText) ||
                                (!filterOption.IsInclude && foundFilterText))
                            {
                                return;
                            }
                        }
                    }

                    if (_loggingThread != null && _loggingThread.IsAlive)
                    {
                        lock (_loggingMessages)
                        {
                            if (_loggingMessages.Count > 1000)
                            {
                                Trace.WriteLine("LOG QUEUE IS FULL!!!");
                            }
                            else
                            {
                                _loggingMessages.Add(new LogInfo(logType, msg.ToString(), isDebugOutput));
                            }
                            _loggingEvent.Set();
                        }
                    }
                    else
                        WriteLogTo(logType, msg.ToString(), isDebugOutput);

                }

            }
            catch (Exception Ex)
            {
                System.Diagnostics.Debug.WriteLine("Excpeion on WriteLogEntry : {0}", Ex.Message);
            }
        }

        protected void WriteLogTo(LogType logType, string message, bool isDebugOutput)
        {
            try
            {
                //
                // If writing to the output window, write it first
                //--------------------------------------------------
                if (logType == LogType.DebugOnly || isDebugOutput)
                {
                    Debug.WriteLine(message);

                    WriteToLiveDebugger(message);
                }

                //
                // Now log to the file, event log, or both
                //--------------------------------------------------
                switch (logType)
                {
                    case LogType.File:
                        WriteToLogFile(message);
                        break;

                    case LogType.Event:
                        WriteToEventLog(message);
                        break;

                    case LogType.All:
                        WriteToLogFile(message);
                        WriteToEventLog(message);
                        break;
                }
            }
            catch (Exception Ex)
            {
                System.Diagnostics.Debug.WriteLine("Excpeion on WriteLogEntry : {0}", Ex.Message);
            }
        }

        protected void WriteToLogFile(string message)
        {
            int attempt = 1;
            const int maxRetries = 5; // retry up to five times
            const int waitMS = 200; // wait .2 seconds between retries

            if (useAutoRemove)
            {
                RemoveLogFileByPeriod();
            }

            while (true)
            {
                try
                {
                    File.AppendAllText(CurrentLogFile, message + Environment.NewLine);
                    return;
                }
                catch { }

                attempt++;

                if (attempt > maxRetries)
                    break;
                else
                    Thread.Sleep(waitMS);
            }

            // if it still failed, try again with alternate file name
            attempt = 1;
            while (true)
            {
                try
                {
                    string alternateFile = CurrentLogFile;

                    alternateFile = Path.GetFileNameWithoutExtension(alternateFile) + "[2].log";

                    File.AppendAllText(alternateFile, message);

                    return;
                }
                catch { }

                attempt++;

                if (attempt > maxRetries)
                    break;
                else
                    Thread.Sleep(waitMS);
            }

            // if we got here, unable to write to either log file; Throw an exception. 
            throw new Exception("Unable to write to log file.");
        }

        protected DateTime GetDateTimeByLogFileName(string fileName)
        {
            try
            {
                if (String.IsNullOrEmpty(fileName))
                    return DateTime.MinValue;

                string[] splitedNames = fileName.Split('_');
                if (splitedNames.Length < 2)
                    return DateTime.MinValue;

                string[] dateFields = splitedNames[1].Split('-');
                if (dateFields.Length < 3)
                    return DateTime.MinValue;

                return new DateTime(Convert.ToInt32(dateFields[0]), Convert.ToInt32(dateFields[1]), Convert.ToInt32(dateFields[2]));
            }
            catch { }
            return DateTime.MinValue;
        }


        protected DateTime GetDateTimeByFolderName(string folderName)
        {
            if (String.IsNullOrEmpty(folderName))
                return DateTime.MinValue;

            string[] dateFields = folderName.Split('-');
            if (dateFields.Length < 3)
                return DateTime.MinValue;
            try
            {
                return new DateTime(Convert.ToInt32(dateFields[0]), Convert.ToInt32(dateFields[1]), Convert.ToInt32(dateFields[2]));
            }
            catch { }
            return DateTime.MinValue;
        }

        /// <summary>
        /// 지난 날짜의 로그파일 삭제.
        /// </summary>
        protected void RemoveLogFileByPeriod()
        {
            if (autoRemovePeriod <= 0)
            {
                return;
            }

            DateTime curTime = DateTime.Now;

            // 하루에 한번씩만 로그 파일 삭제 루틴을 실해하도록 한다.
            // Host 의 시간 변경으로 인해 Current Time 이 LastRemovedTime 보다 작아지는 경우가 있을 수 있음
            if ((lastRemovedTime != DateTime.MinValue) && (curTime >= lastRemovedTime) &&
                (curTime - lastRemovedTime) < TimeSpan.FromDays(1))
            {
                return;
            }

            lastRemovedTime = curTime;

            DateTime comparison = new DateTime(curTime.Year, curTime.Month, curTime.Day, 0, 0, 0)
                - new TimeSpan(autoRemovePeriod, 0, 0, 0);

            DirectoryInfo logDir = new DirectoryInfo(LogFolderPath);

            if (!Directory.Exists(LogFolderPath)) Utilities.CreateDirectory(LogFolderPath);

            foreach (DirectoryInfo subDir in logDir.GetDirectories())
            {
                DateTime logFolderTime = GetDateTimeByFolderName(subDir.Name);
                if (logFolderTime == DateTime.MinValue)
                    continue;

                if (comparison <= logFolderTime)
                {
                    continue;
                }

                // 1. Application 별 로그파일을 삭제한다.
                foreach (FileInfo subFile in subDir.GetFiles(String.Format("{0}_*.log", AppName)))
                {
                    DateTime fileTime = GetDateTimeByLogFileName(Path.GetFileNameWithoutExtension(subFile.Name));
                    if (fileTime == DateTime.MinValue)
                        continue;

                    if (comparison <= fileTime)
                    {
                        continue;
                    }

                    try
                    {
                        if (Convert.ToBoolean(subFile.Attributes & FileAttributes.ReadOnly))
                        {
                            File.SetAttributes(subFile.FullName, (subFile.Attributes & ~FileAttributes.ReadOnly));
                        }

                        File.Delete(subFile.FullName);
                    }
                    catch (Exception ex)
                    {
                        WriteLogEntry(ex);
                    }
                }

                // 2. 로그 폴더에 파일이 없을 경우 폴더를 삭제한다.
                try
                {
                    if (subDir.GetFiles().Length <= 0)
                        subDir.Delete(true);
                }
                catch (Exception ex)
                {
                    WriteLogEntry(ex);
                }
            }
        }

        protected void WriteToEventLog(string message)
        {
            try
            {
                EventLog eventlog = new EventLog();
                eventlog.Source = AppName;
                eventlog.WriteEntry(message);
                eventlog.Close();
            }
            catch (Exception ex)
            {
                // Failed to write to Event Log, perhaps because it is full. Log this to the file and output window.
                WriteLogEntry(loggerName, "Failed to write to the Event Log with the following exception: \n" + ex.ToString(), null, LogType.File, true, true);
            }
        }

        protected void WriteToLiveDebugger(string message)
        {
            IntPtr loggerHandle = GetLiveLoggerWindow();

            if (loggerHandle != IntPtr.Zero)
            {
                // prepend the sender's id to the message
                message = AppName + ":" + message;
                SendMessage(loggerHandle, message);
            }
        }

        protected void SendMessage(IntPtr targetHWnd, string message)
        {
            Win32.CopyDataStruct cds = new Win32.CopyDataStruct();
            try
            {
                cds.cbData = (message.Length + 1) * 2;
                cds.lpData = Win32.LocalAlloc(0x40, cds.cbData);
                Marshal.Copy(message.ToCharArray(), 0, cds.lpData, message.Length);
                cds.dwData = (IntPtr)1;
                Win32.SendMessage(targetHWnd, Win32.WM_COPYDATA, IntPtr.Zero, ref cds);
            }
            finally
            {
                cds.Dispose();
            }
        }

        protected IntPtr GetLiveLoggerWindow()
        {
            foreach (Process proc in Process.GetProcesses())
            {
                if (proc.ProcessName.StartsWith("LiveLog"))
                {
                    return proc.MainWindowHandle;
                }
            }
            return IntPtr.Zero;
        }

        protected string GenerateMessage(LogKinds kind, string format, params object[] args)
        {
            string result = string.Empty;

            switch (kind)
            {
                case LogKinds.Debug:
                    result = "[DEBUG]";
                    break;
                case LogKinds.Error:
                    result = "[ERROR]";
                    break;
                case LogKinds.Info:
                    result = "[INFO]";
                    break;
                case LogKinds.Warn:
                    result = "[WARN]";
                    break;
            }

            result += (((format.Length > 0) && format[0] == '[') ? "" : " ") + String.Format(format, args);

            return result;
        }

        #endregion

        #region Public Methods for Initialize

        public void StartLoggingWithBackground()
        {
            if (_loggingThread == null || !_loggingThread.IsAlive)
            {
                _loggingThread = new Thread(new ThreadStart(LogingThreadProc));
                _loggingThread.Start();
            }
        }

        public void StopLoggingWithBackground()
        {
            if (_loggingThread != null && _loggingThread.IsAlive)
            {
                _loggingThread.Abort();
                _loggingThread = null;
            }
        }

        #endregion

        #region Public Methods for Write

        public void WriteLogEntry(string message)
        {
            WriteLogEntry("", message, null, LogType.File, true, false);
        }

        public void WriteLogEntry(string message, bool includeCaller)
        {
            WriteLogEntry("", message, null, LogType.All, true, includeCaller);
        }

        public void WriteLogEntry(string module, string message)
        {
            WriteLogEntry(module, message, null, LogType.File, true, false);
        }

        public void WriteLogEntry(string module, string message, bool includeCaller)
        {
            WriteLogEntry(module, message, null, LogType.File, true, includeCaller);
        }

        public void WriteLogEntry(Exception ex)
        {
            WriteLogEntry("", "", ex, LogType.File, true, false);
        }

        public void WriteLogEntry(string message, Exception ex)
        {
            WriteLogEntry("", message, ex, LogType.File, true, false);
        }

        public void WriteLogEntry(Exception ex, LogType logType)
        {
            WriteLogEntry("", "", ex, logType, true, false);
        }

        public void WriteLogEntry(string message, LogType logType)
        {
            WriteLogEntry("", message, null, logType, true, false);
        }

        public void WriteLogEntry(string message, LogType logType, bool isDebugOutput)
        {
            WriteLogEntry("", message, null, logType, isDebugOutput, false);
        }

        public void WriteLogEntry(string message, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            WriteLogEntry("", message, null, logType, isDebugOutput, includeCaller);
        }

        public void WriteLogEntry(string message, Exception ex, LogType logType)
        {
            WriteLogEntry("", message, ex, logType, true, false);
        }

        public void WriteLogEntry(string message, Exception ex, LogType logType, bool isDebugOutput)
        {
            WriteLogEntry("", message, ex, logType, isDebugOutput, false);
        }

        public void WriteLogEntry(string module, string message, LogType logType)
        {
            WriteLogEntry(module, message, null, logType, true, false);
        }

        public void WriteLogEntry(string module, string message, LogType logType, bool isDebugOutput)
        {
            WriteLogEntry(module, message, null, logType, isDebugOutput, false);
        }

        public void WriteLogEntry(string module, string message, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            WriteLogEntry(module, message, null, logType, isDebugOutput, includeCaller);
        }

        public void WriteLogEntry(string module, string message, Exception ex, LogType logType)
        {
            WriteLogEntry(module, message, ex, logType, true, false);
        }

        public void WriteLogEntry(string module, string message, Exception ex, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            WriteLogEntryCore(module, message, ex, logType, isDebugOutput, includeCaller);
        }

        #endregion

        #region Other Public Methods

        public string GetLogFileNameForApp(string appName)
        {
            return GetLogFileNameForAppByDate(appName, DateTime.Now);
        }

        public string GetLogFileNameForAppByDate(string appName, DateTime date)
        {
            return appName + date.ToString("_yyyy-MM-dd") + ".log";
        }

        public string CleanException(string exceptionDetail)
        {
            StringBuilder newMessage = new StringBuilder();

            string[] lines = exceptionDetail.Split('\n');

            foreach (string line in lines)
            {
                string newLine = "   " + line.Trim(new char[] { ' ', '\n', '\r' });

                if (newLine.Length > 3)
                {
                    try
                    {
                        if (newLine.StartsWith("   at"))
                        {
                            int inPos = newLine.IndexOf("in ");

                            if (inPos > 0)
                            {
                                int fileStart = inPos + 3;
                                int fileEnd = newLine.IndexOf(":line");

                                string filePath = newLine.Substring(fileStart, fileEnd - fileStart);

                                filePath = Path.GetFileName(filePath);

                                newLine = newLine.Substring(0, fileStart - 1) + " " + filePath.Trim() + newLine.Substring(fileEnd);
                            }
                        }
                    }
                    catch { }

                    newMessage.AppendLine(newLine);
                }
            }

            return newMessage.ToString();
        }

        #endregion

        #region IDisposable Member

        public void Dispose()
        {
            StopLoggingWithBackground();
        }

        #endregion
    }


    [AttributeUsage(AttributeTargets.Class, Inherited = false)]
    public sealed class IgnoreStackTraceAttribute : Attribute
    {
        public IgnoreStackTraceAttribute()
        {
        }
    }
}
