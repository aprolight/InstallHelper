using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SundanceInstallHelper.Common;
using System.ComponentModel;
using System.IO;

namespace SundanceInstallHelper
{
    public partial class MainWorker
    {
        #region Private Methods

        private void GetSkin()
        {
            GetSkinInfo();
            LogWriter.WriteLogEntry("GETSKIN");

            RequestCommand();
        }
        
        /// <summary>
        /// Set Skin Name
        /// </summary>
        /// <param name="skinName"></param>
        private void SetSkinInfo(string skinName)
        {
            Console.WriteLine("SetSkin: " + skinName);

            string settingFile = Utilities.AppSettingFilePath;

            try
            {
                string xmlText = string.Empty;
                LocalClientSetting settingName = new LocalClientSetting();
                settingName.Category = 1;
                settingName.Attribute = "General.SkinName";
                settingName.Value = skinName;
                settingName.ValueType = SettingValueType.String;
                settingName.LastUpdatedTime = DateTime.Now;

                if (!Utilities.SerializeXml<BindingList<LocalClientSetting>>(new BindingList<LocalClientSetting>() { settingName }, out xmlText))
                {
                    throw new Exception("Can't serialize skin settings.");
                }

                Utilities.WriteText(settingFile, xmlText);
            }
            catch (Exception ex)
            {
                LogWriter.WriteLogEntry(ex);
            }
        }

        private int GetSkinIndex(string skinName)
        {
            switch (skinName)
            {
                case "Metropolis Dark_Black":
                    return 1;
                case "Metropolis Dark_Default":
                    return 2;
                case "Metropolis Dark_Gray":
                    return 3;
                case "Metropolis Dark_Green":
                    return 4;
                case "Metropolis Dark_NVR":
                    return 5;
                default:
                    return 2;
            }
        }

        private string GetSkinName(int skinIndex)
        {
            switch (skinIndex)
            {
                case 1:
                    return "Metropolis Dark_Black";
                case 2:
                    return "Metropolis Dark_Default";
                case 3:
                    return "Metropolis Dark_Gray";
                case 4:
                    return "Metropolis Dark_Green";
                case 5:
                    return "Metropolis Dark_NVR";
                default:
                    return "Metropolis Dark_Default";
            }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// Load Current Skin
        /// </summary>
        public void GetSkinInfo()
        {
            string settingFile = Utilities.AppSettingFilePath;
            BindingList<LocalClientSetting> data = null;
            if (File.Exists(settingFile))
            {
                try
                {
                    string xmlText = string.Empty;
                    xmlText = Utilities.ReadAllText(settingFile);
                    if (!Utilities.DeserializeXml<BindingList<LocalClientSetting>>(xmlText, out data))
                    {
                        throw new Exception(String.Format("Can't deserialize user settings.({0})", settingFile));
                    }

                    Console.WriteLine("========================  SKIN INFO  ========================");
                    Console.WriteLine(String.Format("Skin Name: {0} / {1}", data[0].Value, GetSkinIndex(data[0].Value)));
                    Console.WriteLine("========================  SKIN INFO  ========================");
                    Console.WriteLine("");
                    Console.WriteLine("");
                }
                catch (Exception ex)
                {
                    LogWriter.WriteLogEntry(ex);
                    Console.WriteLine(ex.Message);
                }
            }
        }

        public void SetSkin(string value)
        {
            int conValue = 2;
            if (!Int32.TryParse(value, out conValue)) return;

            MakeProductFile();

            SetSkinInfo(GetSkinName(conValue));

            CreateSkinImages(conValue);
        }

        #endregion
    }
}
