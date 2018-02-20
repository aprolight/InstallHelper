using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using System.IO;

namespace SundanceInstallHelper.Common
{
    [Serializable]
    public class LogFilterOption
    {
        #region Fields

        private bool _filterIgnoreCase = true;
        private bool _filterException = false;
        private bool _isInclude = false;
        private List<string> _filterTexts = new List<string>();

        #endregion

        #region Constructors

        /// <summary>
        /// Constructors
        /// </summary>
        public LogFilterOption()
        {
        }

        #endregion

        #region Properties

        /// <summary>
        /// Ignore case when filter text?
        /// </summary>
        public bool FilterIgnoreCase
        {
            get { return _filterIgnoreCase; }
            set { _filterIgnoreCase = value; }
        }

        /// <summary>
        /// Apply filter to exception log?
        /// </summary>
        public bool FilterException
        {
            get { return _filterException; }
            set { _filterException = value; }
        }

        /// <summary>
        /// Is include text?
        /// </summary>
        public bool IsInclude
        {
            get { return _isInclude; }
            set { _isInclude = value; }
        }

        /// <summary>
        /// Gets or sets filter texts
        /// </summary>
        public List<string> FilterTexts
        {
            get { return _filterTexts; }
            set { _filterTexts = value; }
        }

        #endregion

        #region Public Methods


        /// <summary>
        /// Copy values from source
        /// </summary>
        /// <param name="source"></param>
        public void CopyValues(LogFilterOption source)
        {
            _filterTexts.Clear();
            _filterTexts.AddRange(source.FilterTexts);
            _filterIgnoreCase = source.FilterIgnoreCase;
            _filterException = source.FilterException;
            _isInclude = source.IsInclude;
        }


        /// <summary>
        /// Serialize setup data
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public static string SerializeToXml<T>(T item) where T : class
        {
            XmlSerializer xmlFormatter = null;
            StringWriter stringWriter = null;
            string result = "";

            try
            {
                xmlFormatter = new XmlSerializer(typeof(T));
                stringWriter = new StringWriter();

                xmlFormatter.Serialize(stringWriter, item);
                result = stringWriter.ToString();

                stringWriter.Close();
            }
            catch
            {
                return "";
            }

            return result;
        }


        /// <summary>
        /// Load option from file
        /// </summary>
        /// <param name="filePath"></param>
        /// <returns></returns>
        public static LogFilterOption LoadFromFile(string filePath)
        {
            if (File.Exists(filePath) == false)
            {
                return null;
            }

            FileStream fileStream = null;
            StreamReader streamReader = null;
            string xmlOption = string.Empty;

            try
            {
                fileStream = File.Open(filePath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
                streamReader = new StreamReader(fileStream);
                xmlOption = streamReader.ReadToEnd();
            }
            catch
            {
                xmlOption = string.Empty;
            }

            if (streamReader != null)
            {
                streamReader.Close();
            }

            if (fileStream != null)
            {
                fileStream.Close();
            }

            if (String.IsNullOrEmpty(xmlOption))
            {
                return null;
            }

            LogFilterOption option = DeserializeFromXml<LogFilterOption>(xmlOption);

            return option;
        }


        /// <summary>
        /// Deserialize setup data
        /// </summary>
        /// <param name="xmlString"></param>
        /// <returns></returns>
        public static T DeserializeFromXml<T>(string xmlString) where T : class
        {
            XmlSerializer xmlFormatter = null;
            StringReader stringReader = null;
            T item = null;

            try
            {
                if (xmlString.Length <= 0)
                {
                    return null;
                }

                xmlFormatter = new XmlSerializer(typeof(T));
                stringReader = new StringReader(xmlString);

                item = (T)xmlFormatter.Deserialize(stringReader);
                stringReader.Close();
            }
            catch
            {
                return null;
            }

            return item;
        }


        #endregion

    }
}
