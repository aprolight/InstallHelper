using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Runtime.InteropServices;
using SundanceInstallHelper.Common;
using SundanceInstallHelper.OEMImages.ABUDHABIMCC;
using SundanceInstallHelper.OEMImages.Common;
using SundanceInstallHelper.OEMImages.TMAIRPORT;
using System.Drawing;
using System.ServiceProcess;
using System.Management;
using Microsoft.Win32;

namespace SundanceInstallHelper
{
    public enum VMSType
    {
        /// <summary>
        /// INCON or TRIUM i
        /// </summary>
        INCON,
        WatzEyeVMS
    }

    public partial class MainWorker
    {
        private enum ServiceCommandType { Start, Stop, Restart }
        private string _InstallSundanceName = "InstallSundance.exe";
        private string _VMSType = String.Empty;
        private string _VMSOem = String.Empty;

        public MainWorker()
        {
            ReadServiceData();
        }

        #region Properties

        #endregion

        #region Private Methods

        private void Setting()
        {
            if (File.Exists(Path.Combine(Utilities.CurrentFolder, "Service_Data.ini")))
            {
                ProcessStartInfo psi = new ProcessStartInfo(Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));
                Process p = Process.Start(psi);
            }
            else Console.WriteLine("Service_Data.ini Not Found");

            LogWriter.WriteLogEntry("Setting");

            RequestCommand();
        }

        private void Manual()
        {
            if (File.Exists(Path.Combine(Utilities.CurrentFolder, "Manual.txt")))
            {
                ProcessStartInfo psi = new ProcessStartInfo(Path.Combine(Utilities.CurrentFolder, "Manual.txt"));
                Process p = Process.Start(psi);
            }
            else Console.WriteLine("Manual.txt Not Found");

            LogWriter.WriteLogEntry("Manual");

            RequestCommand();
        }

        private void Info()
        {
            ReadServiceData();

            Console.ForegroundColor = ConsoleColor.White;
            Console.BackgroundColor = ConsoleColor.DarkBlue;
            Console.Clear();

            Console.WriteLine(" ========================== [COMMAND] ========================");
            Console.WriteLine("∥ ?                          : Command Information          ∥");
            Console.WriteLine("∥ INFO                       : System Information           ∥");
            Console.WriteLine("∥ SETTING                    : Setting Information          ∥");
            Console.WriteLine("∥ MANUAL                     : Show Manual                  ∥");
            Console.WriteLine("∥ INSTALL                    : VMS Install                  ∥");
            Console.WriteLine("∥ UNINSTALL                  : VMS UnInstall                ∥");
            Console.WriteLine("∥ SERVICE START/STOP/RESTART : VMS Service Command          ∥");
            Console.WriteLine("∥ REG                        : VMS Registered               ∥");
            Console.WriteLine("∥ UNREG                      : VMS Unregister               ∥");
            Console.WriteLine("∥ TASKKILL                   : Kill All Program of VMS      ∥");
            Console.WriteLine("∥ SHORCUTSERVER              : Create VMS Server Shorcut    ∥");
            Console.WriteLine("∥ GETSKIN                    : Current Skin Information     ∥");
            Console.WriteLine("∥ SETSKIN 1~5                : Change VMS Skin              ∥");
            Console.WriteLine("∥ (1: Metropolis Dark_Black,   2: Metropolis Dark_Default)  ∥");
            Console.WriteLine("∥ (3: Metropolis Dark_Gray,    4: Metropolis Dark_Green)    ∥");
            Console.WriteLine("∥ (5: Metropolis Dark_NVR)                                  ∥");
            Console.WriteLine(" ========================== [COMMAND] ========================");
            //Console.WriteLine("");
            Console.WriteLine(" ========================== [INFO...] ========================");
            Console.WriteLine(String.Format(" VMSType = {0}, VMSOem = {0}                     ", _VMSType, _VMSOem));
            //Console.WriteLine(String.Format(" Update Ver. = {0}                      ", new DateTime(2016, 09, 05, 09, 56, 00).ToString()));
            Console.WriteLine(" ========================== [INFO...] ========================");
            Console.WriteLine("");
            Console.WriteLine("");
            //Console.ResetColor();

            RequestCommand();
        }

        private void ReadServiceData()
        {
            if (!File.Exists(Path.Combine(Utilities.CurrentFolder, "Service_Data.ini")))
            {
                Utilities.SetIniValue("DEFAULT", "VMS Type","WatzEyeVMS", Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));
                Utilities.SetIniValue("DEFAULT", "VMS OEM", "TURKMENISTAN", Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));

                Utilities.SetIniValue("OEM INFO", "- TRIUM i", "INCON, EMBASSY", Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));
                Utilities.SetIniValue("OEM INFO", "- WatzEyeVMS", "SKCC, TMSAFECITY, TURKMENISTAN, TMOLYMPIC, TMAIRPORT, ABUDHABIMCC", Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));
            }

            _VMSType = Utilities.GetIniValue("DEFAULT", "VMS Type", Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));
            _VMSOem = Utilities.GetIniValue("DEFAULT", "VMS OEM", Path.Combine(Utilities.CurrentFolder, "Service_Data.ini"));
        }

        private void MakeProductFile()
        {
            if (File.Exists(Path.Combine(Utilities.CurrentFolder, "Product.ini"))) File.Delete((Path.Combine(Utilities.CurrentFolder, "Product.ini")));

            Utilities.SetIniValue("Product", "Name", _VMSType.ToUpper() == VMSType.WatzEyeVMS.ToString().ToUpper() ? "WatzEyeVMS" : "TRIUM i", Path.Combine(Utilities.CurrentFolder, "Product.ini"));
            Utilities.SetIniValue("Product", "Copyright", String.Format("Copyright (c) 2010-{0} All rights reserved.", DateTime.Now.Year), Path.Combine(Utilities.CurrentFolder, "Product.ini"));
            Utilities.SetIniValue("Product", "Company", _VMSType.ToUpper() == VMSType.WatzEyeVMS.ToString().ToUpper() ? "SK Holdings Co., Ltd." : "INCON Co., Ltd. (Win4NET)", Path.Combine(Utilities.CurrentFolder, "Product.ini"));
        }

        private void ServiceCommand(ServiceCommandType commandType)
        {
            Console.WriteLine(String.Format("ServiceCommand: {0}", commandType.ToString()));
            LogWriter.WriteLogEntry(String.Format("ServiceCommand: {0}", commandType.ToString()));

            if (commandType == ServiceCommandType.Start)
            {
                StartService();
            }
            else if (commandType == ServiceCommandType.Stop)
            {
                StopService();
            }
            else if (commandType == ServiceCommandType.Restart)
            {
                StopService();
                StartService();
            }
        }

        private void StartService()
        {
            ServiceCommand(Utilities.SERVICE_WD, ServiceCommandType.Start);
            ServiceCommand(Utilities.SERVICE_MCS, ServiceCommandType.Start);
            ServiceCommand(Utilities.SERVICE_SS, ServiceCommandType.Start);
            ServiceCommand(Utilities.SERVICE_TIMESERVER, ServiceCommandType.Start);
            ServiceCommand(Utilities.SERVICE_IS, ServiceCommandType.Start);
            ServiceCommand(Utilities.SERVICE_LS, ServiceCommandType.Start);
        }

        private void StopService()
        {
            ServiceCommand(Utilities.SERVICE_WD, ServiceCommandType.Stop);
            ServiceCommand(Utilities.SERVICE_MCS, ServiceCommandType.Stop);
            ServiceCommand(Utilities.SERVICE_SS, ServiceCommandType.Stop);
            ServiceCommand(Utilities.SERVICE_TIMESERVER, ServiceCommandType.Stop);
            ServiceCommand(Utilities.SERVICE_IS, ServiceCommandType.Stop);
            ServiceCommand(Utilities.SERVICE_LS, ServiceCommandType.Stop);
        }

        private void ServiceCommand(string serviceName, ServiceCommandType commandType)
        {
            Console.WriteLine(String.Format("ServiceCommand: {0}, CommandType: {1}", serviceName, commandType.ToString()));

            if (Utilities.IsInstalledWindowsService(serviceName))
            {
                ServiceController service = new ServiceController(serviceName);
                ServiceControllerStatus stat = ServiceControllerStatus.Running;
                try
                {
                    stat = service.Status;
                }
                catch (Exception ex)
                {
                    LogWriter.WriteLogEntry(ex);
                }

                if (commandType == ServiceCommandType.Stop)
                {
                    if (stat != ServiceControllerStatus.Stopped)
                    {
                        try
                        {
                            if(service.CanStop) service.Stop();
                        }
                        catch (Exception ex)
                        {
                            LogWriter.WriteLogEntry(ex);
                        }
                    }
                }
                else if (commandType == ServiceCommandType.Start)
                {
                    if (stat != ServiceControllerStatus.Running)
                    {
                        try
                        {
                            service.Start();
                        }
                        catch (Exception ex)
                        {
                            LogWriter.WriteLogEntry(ex);
                        }
                    }
                }
            }
        }

        private void SystemInformations()
        {
            try
            {
                Console.Clear();
                Console.WriteLine("==================== SYSTEM INFORMATION ===================");
                //OS
                Console.WriteLine(String.Format("OS Name: {0}", Environment.OSVersion.VersionString));
                Console.WriteLine(String.Format("Machine Name: {0}", Environment.MachineName));

                //RAM
                string Query = "SELECT Capacity FROM Win32_PhysicalMemory";
                ManagementObjectSearcher searcher1 = new ManagementObjectSearcher(Query);

                UInt64 capacity = 0;
                foreach (ManagementObject WniPART in searcher1.Get())
                {
                    capacity += Convert.ToUInt64(WniPART.Properties["Capacity"].Value);
                }
                Console.WriteLine(String.Format("Memory: {0}GB", (capacity / 1024 / 1024).ToString()));
                searcher1.Dispose();
                searcher1 = null;

                //Get CPU
                Console.WriteLine(String.Format("processor Name: {0}", Registry.LocalMachine.CreateSubKey(@"HARDWARE\DESCRIPTION\System\CentralProcessor\0").GetValue("ProcessorNameString").ToString()));

                //Get Graphic Card
                ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT * FROM Win32_DisplayConfiguration");
                foreach (ManagementObject mo in searcher.Get())
                {
                    foreach (PropertyData property in mo.Properties)
                    {
                        if (property.Name == "Description")
                        {
                            Console.WriteLine(String.Format("Graphics Card: {0}", property.Value.ToString()));
                        }
                    }
                }
                searcher.Dispose();
                searcher = null;

                Console.WriteLine("==================== SYSTEM INFORMATION ===================");
                Console.WriteLine("");
            }
            catch (Exception ex)
            {
                LogWriter.WriteLogEntry(ex);
            }

            RequestCommand();
        }

        private void RemoveAllFiles()
        {
            foreach (string removeFile in ObjectItems.RemoveItems)
            {
                Utilities.FileDelete(removeFile);
            }

            DirectoryInfo childDir = null;

            if (Directory.Exists(String.Format(@"{0}\Resources", Utilities.CurrentFolder)))
            {
                childDir = new DirectoryInfo(String.Format(@"{0}\Resources", Utilities.CurrentFolder));
                foreach (FileInfo f in childDir.GetFiles("*")) Utilities.FileDelete(f.FullName);
            }

            if (Directory.Exists(String.Format(@"{0}\Resources\Images", Utilities.CurrentFolder)))
            {
                childDir = new DirectoryInfo(String.Format(@"{0}\Resources\Images", Utilities.CurrentFolder));
                foreach (FileInfo f in childDir.GetFiles("*")) Utilities.FileDelete(f.FullName);
            }

            if (Directory.Exists(String.Format(@"{0}\DSI", Utilities.CurrentFolder)))
            {
                childDir = new DirectoryInfo(String.Format(@"{0}\DSI", Utilities.CurrentFolder));
                foreach (FileInfo f in childDir.GetFiles("*")) Utilities.FileDelete(f.FullName);
            }

            if (Directory.Exists(String.Format(@"{0}\__SimpleLog__", Utilities.CurrentFolder)))
            {
                childDir = new DirectoryInfo(String.Format(@"{0}\__SimpleLog__", Utilities.CurrentFolder));
                foreach (FileInfo f in childDir.GetFiles("*")) Utilities.FileDelete(f.FullName);
            }

            if (Directory.Exists(String.Format(@"{0}\Resources\Images", Utilities.CurrentFolder)))
                Utilities.DirectoryDelete(String.Format(@"{0}\Resources\Images", Utilities.CurrentFolder));
            if (Directory.Exists(String.Format(@"{0}\Resources", Utilities.CurrentFolder))) 
                Utilities.DirectoryDelete(String.Format(@"{0}\Resources", Utilities.CurrentFolder));

            if (Directory.Exists(String.Format(@"{0}\__SimpleLog__", Utilities.CurrentFolder)))
                Utilities.DirectoryDelete(String.Format(@"{0}\__SimpleLog__", Utilities.CurrentFolder));
            if (Directory.Exists(String.Format(@"{0}\DSI", Utilities.CurrentFolder)))
                Utilities.DirectoryDelete(String.Format(@"{0}\DSI", Utilities.CurrentFolder));
        }

        #endregion

        #region Public Methods

        public void StartInstallSundance()
        {
            ReadServiceData();

            MakeProductFile();

            //CreateSkinImages();

            if (File.Exists(String.Format(@"{0}\{1}", Utilities.CurrentFolder, _InstallSundanceName)))
            {
                ProcessStartInfo psi = new ProcessStartInfo(String.Format(@"{0}\{1}", Utilities.CurrentFolder, _InstallSundanceName));
                psi.Arguments = "SERVERONLY";
                Process p = Process.Start(psi);

                Win32.SetForegroundWindow(p.MainWindowHandle);

                LogWriter.WriteLogEntry(String.Format("Start {0}", _InstallSundanceName));
                Console.WriteLine(String.Format("Start {0}", _InstallSundanceName));
            }
            else
            {
                LogWriter.WriteLogEntry(String.Format("{0} not found.", _InstallSundanceName));
                Console.WriteLine(String.Format("{0} not found.", _InstallSundanceName));
            }
        }

        public void ShorCutServer()
        {
            if (!File.Exists(Path.Combine(Utilities.CurrentFolder, "Service.exe"))) return;

            ShellLink link = new ShellLink();
            link.Target = Path.Combine(Utilities.CurrentFolder, "Service.exe");
            link.WorkingDirectory = Utilities.CurrentFolder;
            link.ShortCutFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "Service - Restart.lnk");
            link.Arguments = "/RESTART";
            link.Save();

            Console.WriteLine("Create Service Restart.lnk");

            link = new ShellLink();
            link.Target = Path.Combine(Utilities.CurrentFolder, "Service.exe");
            link.WorkingDirectory = Utilities.CurrentFolder;
            link.ShortCutFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "Service - Stop.lnk");
            link.Arguments = "/STOP";
            link.Save();

            Console.WriteLine("Create Service Stop.lnk");

            link = new ShellLink();
            link.Target = Path.Combine(Utilities.CurrentFolder, "Service.exe");
            link.WorkingDirectory = Utilities.CurrentFolder;
            link.ShortCutFile = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.Desktop), "Stop - All Process.lnk");
            link.Arguments = "/ALLSTOP";
            link.Save();

            Console.WriteLine("Create All Process Stop.lnk");
        }

        public void TaskKill()
        {
            foreach (string name in ObjectItems.TaskItems)
            {
                Process[] processes = System.Diagnostics.Process.GetProcessesByName(name);

                if (processes.Length > 0)
                {
                    foreach (Process p in processes) p.Kill();
                }
            }
        }

        public void Reg()
        {
            foreach (string fileName in ObjectItems.RegItems)
            {
                if (File.Exists(fileName))
                {
                    Process proc = Process.Start("regsvr32.exe", " /s \"" + fileName + "\"");
                    proc.WaitForExit();
                }
            }
        }

        public void UnReg()
        {
            foreach (string fileName in ObjectItems.RegItems)
            {
                if (File.Exists(fileName))
                {
                    Process proc = Process.Start("regsvr32.exe", " /u \"" + fileName + "\"");
                    proc.WaitForExit();
                }
            }
        }

        #endregion
    }
}
