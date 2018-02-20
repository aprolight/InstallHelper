using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace SundanceInstallHelper.Common
{
    public static class ObjectItems
    {
        public static List<string> TaskItems
        {
            get
            {
                List<string> items = new List<string>();

                items.Add("StorageServer");
                items.Add("DPLStub");
                items.Add("EnterpriseServer");
                items.Add("Watz_Eye");
                items.Add("AbsolutePositionTest");
                items.Add("AdminTool");
                items.Add("ConfigExport");
                items.Add("ConfigManager");
                items.Add("DBConfig.exe");
                items.Add("DeployDatabaseUpdate");
                items.Add("DeviceUpdater");
                items.Add("DPLOption");
                items.Add("DSIUpdate");
                items.Add("ExportMonitor");
                items.Add("GISClient");
                items.Add("GISSafetyService");
                items.Add("Installer");
                items.Add("InstallSundance");
                items.Add("InteropServer");
                items.Add("LiveLog");
                items.Add("LPRServer");
                items.Add("LPRServerMonitor");
                items.Add("MediaControlServer");
                items.Add("MediaControlServer.vshost");
                items.Add("mmc");
                items.Add("MSE");
                items.Add("NTPSetting");
                items.Add("perfmon");
                items.Add("ProcessWatcher");
                items.Add("RecognitionAdminTool");
                items.Add("RelayServerMonitor");
                items.Add("RemoteClient");
                items.Add("Service");
                items.Add("Shortcut");
                items.Add("SystemEventMonitor");
                items.Add("TimeClient");
                items.Add("TimeServerService");
                items.Add("TriumRelay");
                items.Add("UpdateClient");
                items.Add("UpdateServer");
                items.Add("UpdateUtility");
                items.Add("UtilityManager");
                items.Add("VNC Viewer");
                items.Add("TcpMon");
                items.Add("Watchdog");
                items.Add("WatchdogSystray");
                items.Add("DelphiStackViewer");
                items.Add("procexp");
                items.Add("StrorageServer");
                items.Add("DPLStub");

                return items;
            }
        }

        public static List<string> RemoveItems
        {
            get
            {
                List<string> items = new List<string>();

                items.Add(String.Format(@"{0}\!Client_Wallpaper.jpg", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\CgiUtil.dll", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\Common_App.dat", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\InstallUtil.InstallLog", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\InteropServer.InstallLog", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\InteropServer.InstallState", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\IPAdminTool.dll", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\KAFG.ini", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\LPRServer.InstallLog", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\LPRServer.InstallState", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\MediaControlServer.InstallLog", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\MediaControlServer.InstallState", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\StorageServer.InstallLog", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\StorageServer.InstallState", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\Watchdog.InstallLog", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\Watchdog.InstallState", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\InstallError.log", Utilities.CurrentFolder));
                items.Add(String.Format(@"{0}\Product.ini", Utilities.CurrentFolder));

                return items;
            }
        }

        public static List<string> RegItems
        {
            get
            {
                List<string> items = new List<string>();

                items.Add(Path.Combine(Utilities.CurrentFolder, "SundanceCoreLibrary.dll"));
                items.Add(Path.Combine(Utilities.CurrentFolder, "ComUtilities.dll"));
                items.Add(Path.Combine(Utilities.CurrentFolder, "NSRDVRCtrlX.ocx"));

                return items;
            }
        }
    }
}
