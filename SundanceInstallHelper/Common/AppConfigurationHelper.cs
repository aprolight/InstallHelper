using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml;
using System.IO;
using System.Reflection;

namespace SundanceInstallHelper.Common
{
    public class AppConfigurationHelper : Dictionary<string, string>
    {
        const string appConfigNodeName = "setting";

        public AppConfigurationHelper()
            : this(Assembly.GetEntryAssembly())
        {
        }

        public AppConfigurationHelper(Assembly consumingAssembly)
        {
            ReadConfig(consumingAssembly);
        }

        public void ReadConfig()
        {
            ReadConfig(Assembly.GetEntryAssembly());
        }

        public void ReadConfig(Assembly asm)
        {
            try
            {
                string cfgFile = asm.Location + ".config";

                if (!File.Exists(cfgFile))
                {
                    System.Diagnostics.Debug.WriteLine(String.Format("Can't find configuration file. ({0})", cfgFile));
                    return;
                }

                XmlDocument doc = new XmlDocument();

                doc.Load(new XmlTextReader(cfgFile));

                foreach (XmlNode node in doc.GetElementsByTagName(appConfigNodeName))
                {
                    this.Add(node.Attributes["name"].Value, node.InnerText);
                }
            }
            catch (Exception e)
            {
                System.Diagnostics.Debug.WriteLine(e.Message);
            }
        }
    }
}
