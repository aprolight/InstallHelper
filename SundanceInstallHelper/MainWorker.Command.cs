using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SundanceInstallHelper.Common;

namespace SundanceInstallHelper
{
    public partial class MainWorker
    {
        #region Private Methods

        private enum CommandType
        {
            SETTING,
            INFO,
            UNINSTALL,
            INSTALL,
            REG,
            UNREG,
            TASKKILL,
            SHORCUTSERVER,
            GETSKIN,
            SETSKIN,
            HELP,
            SERVICE,
            MANUAL
        }

        private void RequestCommand()
        {
            string readLine = Console.ReadLine();
            if (!String.IsNullOrEmpty(readLine))
            {
                CommandArgs(readLine.Split(' '));
            }
        }

        private void WriteFullLine(string value)
        {
            Console.BackgroundColor = ConsoleColor.Green;
            Console.ForegroundColor = ConsoleColor.DarkGreen;
            Console.WriteLine(value.PadRight(Console.WindowWidth));

            Console.ResetColor();
        }

        #endregion

        #region Public Methods

        public void CommandArgs(string[] args)
        {
            for (int idx = 0; idx < args.Length; idx++)
            {
                if (args[idx].ToUpper().Contains(CommandType.SETTING.ToString()))
                {
                    Setting();
                }
                else if (args[idx].ToUpper().Contains(CommandType.MANUAL.ToString()))
                {
                    Manual();
                }
                else if (args[idx].ToUpper().Contains(CommandType.INFO.ToString()))
                {
                    SystemInformations();
                }
                else if (args[idx].ToUpper().Contains(CommandType.UNINSTALL.ToString()))
                {
                    TaskKill();
                    UnReg();
                    RemoveAllFiles();
                }
                else if (args[idx].ToUpper().Contains(CommandType.INSTALL.ToString()))
                {
                    Reg();

                    if (_VMSType.ToUpper() == VMSType.INCON.ToString() || _VMSType.ToUpper() == ("TRIUM i").ToUpper()) SetSkin("2");
                    else if (_VMSType.ToUpper() == VMSType.WatzEyeVMS.ToString()) SetSkin("4");

                    StartInstallSundance();
                    LogWriter.WriteLogEntry(CommandType.INSTALL.ToString());
                }
                else if (args[idx].ToUpper().Contains(CommandType.REG.ToString()))
                {
                    Reg();
                    LogWriter.WriteLogEntry(CommandType.REG.ToString());
                }
                else if (args[idx].ToUpper().Contains(CommandType.UNREG.ToString()))
                {
                    UnReg();
                    LogWriter.WriteLogEntry(CommandType.UNREG.ToString());
                }
                else if (args[idx].ToUpper().Contains(CommandType.TASKKILL.ToString()))
                {
                    TaskKill();
                    LogWriter.WriteLogEntry(CommandType.TASKKILL.ToString());
                }
                else if (args[idx].ToUpper().Contains(CommandType.SHORCUTSERVER.ToString()))
                {
                    ShorCutServer();
                    LogWriter.WriteLogEntry(CommandType.SHORCUTSERVER.ToString());
                }
                else if (args[idx].ToUpper().Contains(CommandType.GETSKIN.ToString()))
                {
                    GetSkin();
                }
                else if (args[idx].ToUpper().Contains(CommandType.SETSKIN.ToString()))
                {
                    if (idx == 0 && args.Length > 1)
                    {
                        SetSkin(args[1]);
                        LogWriter.WriteLogEntry(CommandType.SETSKIN.ToString());
                    }
                }
                else if (args[idx].ToUpper().Contains(CommandType.HELP.ToString()) || args[idx].ToUpper().Contains("?"))
                {
                    Info();
                }
                else if (args[idx].ToUpper().Contains(CommandType.SERVICE.ToString()))
                {
                    if (idx == 0 && args.Length > 1)
                    {
                        ServiceCommandType commandType = ServiceCommandType.Start;
                        if(args[1].ToUpper() == ServiceCommandType.Restart.ToString().ToUpper()) commandType = ServiceCommandType.Restart;
                        else if(args[1].ToUpper() == ServiceCommandType.Stop.ToString().ToUpper()) commandType = ServiceCommandType.Stop;
                        ServiceCommand(commandType);
                    }
                }
            }
        }

        #endregion
    }
}
