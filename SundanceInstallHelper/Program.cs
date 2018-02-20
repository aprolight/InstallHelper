using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Runtime.InteropServices;
using SundanceInstallHelper.Common;

namespace SundanceInstallHelper
{
    /// <summary>
    /// ######################################### 명령어 ##########################################
    /// SundanceInstallHelper ?                          :   명령어 정보
    /// SundanceInstallHelper INFO                       :   PC 정보
    /// SundanceInstallHelper SETTING                    :   프로그램 설정
    /// SundanceInstallHelper INSTALL                    :   프로그램 설치
    /// SundanceInstallHelper MANUAL                     :   프로그램 설명
    /// SundanceInstallHelper UNINSTALL                  :   프로그램 제거
    /// SundanceInstallHelper SERVICE START/STOP/RESTART :   프로그램 제거
    /// SundanceInstallHelper REG                        :   레지스트리 등록
    /// SundanceInstallHelper UNREG                      :   레지스트리 등록 해제
    /// SundanceInstallHelper TASKKILL                   :   VMS 관련된 모든 프로그램 종료
    /// SundanceInstallHelper SHORCUTSERVER              :   VMS 서비스 바로가기 바탕화면에 생성
    /// SundanceInstallHelper GETSKIN                    :   현재 Skin 정보 확인
    /// SundanceInstallHelper SETSKIN 1~5                :   VMS Skin 변경
    /// ######################################### 명령어 ##########################################
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            //Win32.ShowWindow(System.Diagnostics.Process.GetCurrentProcess().MainWindowHandle, 0);

            MainWorker mainWorker = new MainWorker();
            if (args.Length == 0)
            {
                Console.WriteLine("StartInstallSundance");
                LogWriter.WriteLogEntry("StartInstallSundance");
                mainWorker.StartInstallSundance();
            }
            else
            {
                mainWorker.CommandArgs(args);
            }
        }
    }
}
