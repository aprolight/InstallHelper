using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;

namespace SundanceInstallHelper.Common
{
    public delegate void LogWriterEventHandler(string module, string message, Exception ex, LogType logType, bool isDebugOutput, bool includeCaller);

    /// <summary>
    /// LogWriter class defines log file and event log handling.
    /// </summary>
    [IgnoreStackTrace]
    public class LogWriter
    {
        #region Fields

        protected static object lockObj = new Object();
        protected static GenericLogger logger;
        protected static LogWriterEventHandler afterLoggingHandler;

        #endregion


        #region Properties

        public static string AppName
        {
            get { return Instance.AppName; }
            set { Instance.AppName = value; }
        }


        public static LogFilterOption FilterOption
        {
            get { return Instance.FilterOption; }
            set
            {
                if (value == null)
                {
                    return;
                }

                Instance.FilterOption.CopyValues(value);
            }
        }

        public static string LogFolderPath
        {
            get { return Instance.LogFolderPath; }
            set { Instance.LogFolderPath = value; }
        }

        public static string CurrentLogFolder
        {
            get { return Instance.CurrentLogFolder; }
        }

        public static string CurrentLogFile
        {
            get { return Instance.CurrentLogFile; }
        }

        public static LogWriterEventHandler AfterLoggingHandler
        {
            set
            {
                afterLoggingHandler = value;
            }
        }

        public static int LogPeriodDay
        {
            get { return Instance.AutoRemovePeriod; }
            set { Instance.AutoRemovePeriod = value; }
        }

        public static bool UseAutoRemoveLog
        {
            get { return Instance.UseAutoRemove; }
            set { Instance.UseAutoRemove = value; }
        }

        public static bool EnableDebugWrite
        {
            get { return Instance.EnableDebugWrite; }
            set { Instance.EnableDebugWrite = value; }
        }


        protected static GenericLogger Instance
        {
            get
            {
                lock (lockObj)
                {
                    if (logger == null)
                    {
                        logger = new GenericLogger();
                        Type type = Assembly.GetExecutingAssembly().GetType("Sundance.Common.Generic.GlobalProperties");
                        if (type != null)
                        {
                            PropertyInfo propInfo = type.GetProperty("LogFolder");
                            if (propInfo != null)
                                logger.LogFolderPath = (string)propInfo.GetValue(null, null);
                        }
                        logger.LoggerName = "LogWriter";
                    }
                }

                return logger;
            }
        }

        #endregion

        #region Private / Protected Methods

        protected virtual void AfterLogWriter(string module, string message, Exception ex, LogType logType, bool isDebugOutput, bool includeCaller)
        {
        }

        #endregion

        #region Public Methods for Initialize

        public static void StartLoggingWithBackground()
        {
            Instance.StartLoggingWithBackground();
        }

        public static void StopLoggingWithBackground()
        {
            Instance.StopLoggingWithBackground();
        }


        #endregion

        #region Public Methods for Write

        public static void WriteLogEntry(string message)
        {
            WriteLogEntry("", message, null, LogType.File, true, false);
        }

        public static void WriteLogEntry(string message, bool includeCaller)
        {
            WriteLogEntry("", message, null, LogType.All, true, includeCaller);
        }

        public static void WriteLogEntry(string module, string message)
        {
            WriteLogEntry(module, message, null, LogType.File, true, false);
        }

        public static void WriteLogEntry(string module, string message, bool includeCaller)
        {
            WriteLogEntry(module, message, null, LogType.File, true, includeCaller);
        }

        public static void WriteLogEntry(Exception ex)
        {
            WriteLogEntry("", "", ex, LogType.File, true, false);
        }

        public static void WriteLogEntry(string message, Exception ex)
        {
            WriteLogEntry("", message, ex, LogType.File, true, false);
        }

        public static void WriteLogEntry(Exception ex, LogType logType)
        {
            WriteLogEntry("", "", ex, logType, true, false);
        }

        public static void WriteLogEntry(string message, LogType logType)
        {
            WriteLogEntry("", message, null, logType, true, false);
        }

        public static void WriteLogEntry(string message, LogType logType, bool isDebugOutput)
        {
            WriteLogEntry("", message, null, logType, isDebugOutput, false);
        }

        public static void WriteLogEntry(string message, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            WriteLogEntry("", message, null, logType, isDebugOutput, includeCaller);
        }

        public static void WriteLogEntry(string message, Exception ex, LogType logType)
        {
            WriteLogEntry("", message, ex, logType, true, false);
        }

        public static void WriteLogEntry(string message, Exception ex, LogType logType, bool isDebugOutput)
        {
            WriteLogEntry("", message, ex, logType, isDebugOutput, false);
        }

        public static void WriteLogEntry(string module, string message, LogType logType)
        {
            WriteLogEntry(module, message, null, logType, true, false);
        }

        public static void WriteLogEntry(string module, string message, LogType logType, bool isDebugOutput)
        {
            WriteLogEntry(module, message, null, logType, isDebugOutput, false);
        }

        public static void WriteLogEntry(string module, string message, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            WriteLogEntry(module, message, null, logType, isDebugOutput, includeCaller);
        }

        public static void WriteLogEntry(string module, string message, Exception ex, LogType logType)
        {
            WriteLogEntry(module, message, ex, logType, true, false);
        }

        public static void WriteLogEntry(string module, string message, Exception ex, LogType logType, bool isDebugOutput, bool includeCaller)
        {
            Instance.WriteLogEntry(module, message, ex, logType, isDebugOutput, includeCaller);
            if (afterLoggingHandler != null)
            {
                afterLoggingHandler.Invoke(module, message, ex, logType, isDebugOutput, includeCaller);
            }
        }

        #endregion
    }
}
