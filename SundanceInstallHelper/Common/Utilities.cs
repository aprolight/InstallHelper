using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using System.IO;
using System.ServiceProcess;

namespace SundanceInstallHelper.Common
{
    public static class Utilities
    {
        public const string SERVICE_MCS = "Sundance Media Control Server";
        public const string SERVICE_SS = "Sundance Storage Server";
        public const string SERVICE_WD = "Sundance Watchdog";
        public const string SERVICE_TIMESERVER = "Sundance Time Server";
        public const string SERVICE_IS = "Sundance Interop Server";
        public const string SERVICE_LS = "Sundance LPR Server";

        public static bool DeserializeXml<T>(string xmlString, out T target) where T : class
        {
            XmlSerializer xmlFormatter = null;
            StringReader stringReader = null;

            target = null;
            try
            {
                if ((xmlString == null) || (xmlString.Length <= 0))
                {
                    return false;
                }

                xmlFormatter = new XmlSerializer(typeof(T));
                stringReader = new StringReader(xmlString);

                target = (T)xmlFormatter.Deserialize(stringReader);
                stringReader.Close();
                stringReader.Dispose();
            }
            catch (Exception ex)
            {
                //LogWriter.WriteLogEntry(ex);
                return false;
            }

            return true;
        }

        public static bool SerializeXml<T>(T source, out string xmlString) where T : class
        {
            XmlSerializer xmlFormatter = null;
            StringWriter stringWriter = null;

            xmlString = "";
            try
            {
                xmlFormatter = new XmlSerializer(typeof(T));
                stringWriter = new StringWriter();

                xmlFormatter.Serialize(stringWriter, source);
                xmlString = stringWriter.ToString();

                stringWriter.Close();
                stringWriter.Dispose();
            }
            catch (Exception ex)
            {
                LogWriter.WriteLogEntry(ex);
                return false;
            }

            return true;
        }

        public static void CreateDirectory(string path)
        {
            // Updated 2008-12-18 to use framework IO method, which creates all folders in the path if possible.
            if (Path.GetExtension(path) != string.Empty)
                Directory.CreateDirectory(Path.GetDirectoryName(path));
            else
                Directory.CreateDirectory(path);
        }

        public static string ReadAllText(string path)
        {
            string result = string.Empty;

            FileStream stream = File.Open(path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            using (StreamReader reader = new StreamReader(stream))
            {
                result = reader.ReadToEnd();
                reader.Close();
                reader.Dispose();
            }

            return result;
        }

        public static void WriteText(string path, string text)
        {
            FileStream stream = File.Open(path, FileMode.Create, FileAccess.ReadWrite, FileShare.Read);
            using (StreamWriter writer = new StreamWriter(stream))
            {
                writer.Write(text);
            }
        }

        public static void FileDelete(string filePath)
        {
            try
            {
                if (String.IsNullOrEmpty(filePath)) return;

                if (File.Exists(filePath))
                {
                    File.Delete(filePath);
                }
            }
            catch { }
        }

        public static void DirectoryDelete(string directoryPath)
        {
            try
            {
                if (String.IsNullOrEmpty(directoryPath)) return;

                if (Directory.Exists(directoryPath))
                {
                    Directory.Delete(directoryPath);
                }
            }
            catch { }
        }

        public static bool IsInstalledWindowsService(string serviceName)
        {
            foreach (ServiceController sc in ServiceController.GetServices())
            {
                if (sc.ServiceName == serviceName) return true;
            }
            return false;
        }

        public static string GetIniValue(string section, string key, string iniPath)
        {
            StringBuilder temp = new StringBuilder(255);
            int i = Win32.GetPrivateProfileString(section, key, "", temp, 255, iniPath);
            return temp.ToString();
        }

        public static void SetIniValue(string section, string key, string value, string iniPath)
        {
            Win32.WritePrivateProfileString(section, key, value, iniPath);
        }

        #region Properties

        public static string CurrentFolder
        {
            get
            {
                string location = System.Reflection.Assembly.GetEntryAssembly().Location;
                location = location.Substring(0, location.LastIndexOf("\\"));
                return location;
            }
        }

        public static string AppSettingFilePath
        {
            get
            {
                return Path.Combine(UserSettingFolder, "Common_App.dat");
            }
        }

        public static string UserSettingFolder
        {
            get
            {
                string settingFolder = Path.Combine(CommonSundanceDataFolder, "Settings");

                // create when requested
                if (Directory.Exists(settingFolder) == false)
                {
                    Utilities.CreateDirectory(settingFolder);
                }

                return settingFolder;
            }
        }

        public static string CommonSundanceDataFolder
        {
            get
            {
                string appDataFolder = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.CommonApplicationData), "Sundance");

                // create when requested
                if (Directory.Exists(appDataFolder) == false)
                {
                    Utilities.CreateDirectory(appDataFolder);
                }

                return appDataFolder;
            }
        }

        #endregion
    }
}
