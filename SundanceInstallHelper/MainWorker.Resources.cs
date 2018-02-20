using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SundanceInstallHelper.OEMImages.Common;
using SundanceInstallHelper.OEMImages.TMAIRPORT;
using SundanceInstallHelper.OEMImages.ABUDHABIMCC;
using System.IO;
using SundanceInstallHelper.Common;
using SundanceInstallHelper.OEMImages.TMOLYMPIC;
using SundanceInstallHelper.OEMImages.TURKMENISTAN;
using SundanceInstallHelper.OEMImages.TMSAFECITY;
using SundanceInstallHelper.OEMImages.SKCC;
using SundanceInstallHelper.OEMImages.INCON;
using System.Windows.Forms;

namespace SundanceInstallHelper
{
    public partial class MainWorker
    {
        #region Private Methods

        private void CreateSkinImages(int skinValue)
        {
            string fullDir = Path.Combine(Utilities.CurrentFolder, "Resources\\Images");
            if (!Directory.Exists(Path.Combine(Utilities.CurrentFolder, "Resources"))) Utilities.CreateDirectory(Path.Combine(Utilities.CurrentFolder, "Resources"));
            if (!Directory.Exists(fullDir)) Utilities.CreateDirectory(fullDir);

            if (_VMSType.ToUpper() == "INCON" || _VMSType.ToUpper() == "TRIUM I")
            {
                if (skinValue == 4)
                {
                    INCONResource.AboutLogo_4.Save(fullDir + "\\AboutLogo.png");
                    INCONResource.AdminToolSplashScreen_Bottom_4.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                    INCONResource.AdminToolSplashScreen_Top_4.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                    INCONResource.Config_Top_Extend_4.Save(fullDir + "\\Config_Top_Extend.png");
                    INCONResource.ConfigManagerSplashScreen_Bottom_4.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                    INCONResource.ConfigManagerSplashScreen_Top_4.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                    INCONResource.DisplayControl_NoSignal_4.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                    INCONResource.DisplayControl_RecognitionTile_4.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                    INCONResource.DisplayControl_TileBackground_4.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                    INCONResource.DisplayControl_VideoLoading_4.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                    INCONResource.GISClientSplashScreen_Bottom_4.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                    INCONResource.GISClientSplashScreen_Top_4.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                    INCONResource.GISMapSplahScreen_Bottom_4.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                    INCONResource.GISMapSplahScreen_Top_4.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                    INCONResource.LiveAlarmPlayback_BackgroundImage_4.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                    INCONResource.ProductLogo_4.Save(fullDir + "\\ProductLogo.png");
                    INCONResource.RecognitionAdminToolSplashScreen_Top_4.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                    INCONResource.RemoteClientSplashScreen_Bottom_4.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                    INCONResource.RemoteClientSplashScreen_Top_4.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                    INCONResource.SplashScreen_Bottom_4.Save(fullDir + "\\SplashScreen_Bottom.png");
                    INCONResource.SplashScreen_Top_4.Save(fullDir + "\\SplashScreen_Top.png");
                    INCONResource.Sundance_Logo_4.Save(fullDir + "\\Sundance_Logo.png");
                }
                else
                {
                    INCONResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                    INCONResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                    INCONResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                    INCONResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                    INCONResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                    INCONResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                    INCONResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                    INCONResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                    INCONResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                    INCONResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                    INCONResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                    INCONResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                    INCONResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                    INCONResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                    INCONResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                    INCONResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                    INCONResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                    INCONResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                    INCONResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                    INCONResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                    INCONResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                    INCONResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                }

                INCONResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                INCONResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                INCONResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");

                //INCONResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                //INCONResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                //INCONResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                //INCONResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                //INCONResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            else if (_VMSOem.ToUpper() == "ABUDHABIMCC")
            {
                ABUDHABIMCCResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                ABUDHABIMCCResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                ABUDHABIMCCResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                ABUDHABIMCCResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                ABUDHABIMCCResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                ABUDHABIMCCResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");
                ABUDHABIMCCResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                ABUDHABIMCCResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                ABUDHABIMCCResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                ABUDHABIMCCResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                ABUDHABIMCCResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                ABUDHABIMCCResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                ABUDHABIMCCResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                ABUDHABIMCCResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                ABUDHABIMCCResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                ABUDHABIMCCResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                ABUDHABIMCCResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                ABUDHABIMCCResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                ABUDHABIMCCResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                ABUDHABIMCCResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                ABUDHABIMCCResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                ABUDHABIMCCResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                ABUDHABIMCCResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                ABUDHABIMCCResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                ABUDHABIMCCResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                ABUDHABIMCCResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                ABUDHABIMCCResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                ABUDHABIMCCResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                ABUDHABIMCCResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                ABUDHABIMCCResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            else if (_VMSOem.ToUpper() == "TMAIRPORT")
            {
                TMAIRPORTResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                TMAIRPORTResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                TMAIRPORTResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                TMAIRPORTResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                TMAIRPORTResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                TMAIRPORTResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");
                TMAIRPORTResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                TMAIRPORTResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                TMAIRPORTResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                TMAIRPORTResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                TMAIRPORTResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                TMAIRPORTResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                TMAIRPORTResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                TMAIRPORTResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                TMAIRPORTResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                TMAIRPORTResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                TMAIRPORTResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                TMAIRPORTResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                TMAIRPORTResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                TMAIRPORTResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                TMAIRPORTResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                TMAIRPORTResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                TMAIRPORTResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                TMAIRPORTResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                TMAIRPORTResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                TMAIRPORTResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                TMAIRPORTResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                TMAIRPORTResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                TMAIRPORTResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                TMAIRPORTResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            else if (_VMSOem.ToUpper() == "TMOLYMPIC")
            {
                TMOLYMPICResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                TMOLYMPICResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                TMOLYMPICResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                TMOLYMPICResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                TMOLYMPICResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                TMOLYMPICResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");
                TMOLYMPICResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                TMOLYMPICResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                TMOLYMPICResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                TMOLYMPICResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                TMOLYMPICResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                TMOLYMPICResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                TMOLYMPICResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                TMOLYMPICResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                TMOLYMPICResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                TMOLYMPICResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                TMOLYMPICResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                TMOLYMPICResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                TMOLYMPICResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                TMOLYMPICResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                TMOLYMPICResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                TMOLYMPICResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                TMOLYMPICResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                TMOLYMPICResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                TMOLYMPICResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                TMOLYMPICResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                TMOLYMPICResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                TMOLYMPICResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                TMOLYMPICResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                TMOLYMPICResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            else if (_VMSOem.ToUpper() == "TURKMENISTAN")
            {
                TURKMENISTANResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                TURKMENISTANResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                TURKMENISTANResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                TURKMENISTANResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                TURKMENISTANResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                TURKMENISTANResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");
                TURKMENISTANResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                TURKMENISTANResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                TURKMENISTANResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                TURKMENISTANResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                TURKMENISTANResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                TURKMENISTANResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                TURKMENISTANResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                TURKMENISTANResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                TURKMENISTANResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                TURKMENISTANResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                TURKMENISTANResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                TURKMENISTANResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                TURKMENISTANResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                TURKMENISTANResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                TURKMENISTANResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                TURKMENISTANResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                TURKMENISTANResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                TURKMENISTANResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                TURKMENISTANResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                TURKMENISTANResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                TURKMENISTANResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                TURKMENISTANResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                TURKMENISTANResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                TURKMENISTANResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            else if (_VMSOem.ToUpper() == "TMSAFECITY")
            {
                TMSAFECITYResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                TMSAFECITYResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                TMSAFECITYResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                TMSAFECITYResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                TMSAFECITYResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                TMSAFECITYResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");
                TMSAFECITYResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                TMSAFECITYResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                TMSAFECITYResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                TMSAFECITYResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                TMSAFECITYResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                TMSAFECITYResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                TMSAFECITYResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                TMSAFECITYResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                TMSAFECITYResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                TMSAFECITYResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                TMSAFECITYResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                TMSAFECITYResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                TMSAFECITYResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                TMSAFECITYResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                TMSAFECITYResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                TMSAFECITYResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                TMSAFECITYResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                TMSAFECITYResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                TMSAFECITYResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                TMSAFECITYResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                TMSAFECITYResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                TMSAFECITYResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                TMSAFECITYResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                TMSAFECITYResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            else if (_VMSOem.ToUpper() == "SKCC")
            {
                SKCCResource.AboutLogo.Save(fullDir + "\\AboutLogo.png");
                SKCCResource.AdminToolSplashScreen_Bottom.Save(fullDir + "\\AdminToolSplashScreen_Bottom.png");
                SKCCResource.AdminToolSplashScreen_Top.Save(fullDir + "\\AdminToolSplashScreen_Top.png");
                SKCCResource.ApplicationIcon.Save(fullDir + "\\ApplicationIcon.png");
                SKCCResource.ApplicationIcon_Click.Save(fullDir + "\\ApplicationIcon_Click.png");
                SKCCResource.ApplicationIcon_Hover.Save(fullDir + "\\ApplicationIcon_Hover.png");
                SKCCResource.Config_Top_Extend.Save(fullDir + "\\Config_Top_Extend.png");
                SKCCResource.ConfigManagerSplashScreen_Bottom.Save(fullDir + "\\ConfigManagerSplashScreen_Bottom.png");
                SKCCResource.ConfigManagerSplashScreen_Top.Save(fullDir + "\\ConfigManagerSplashScreen_Top.png");
                SKCCResource.DisplayControl_NoSignal.Save(fullDir + "\\DisplayControl_NoSignal.jpg");
                SKCCResource.DisplayControl_RecognitionTile.Save(fullDir + "\\DisplayControl_RecognitionTile.jpg");
                SKCCResource.DisplayControl_TileBackground.Save(fullDir + "\\DisplayControl_TileBackground.jpg");
                SKCCResource.DisplayControl_VideoLoading.Save(fullDir + "\\DisplayControl_VideoLoading.jpg");
                SKCCResource.GISClientSplashScreen_Bottom.Save(fullDir + "\\GISClientSplashScreen_Bottom.png");
                SKCCResource.GISClientSplashScreen_Top.Save(fullDir + "\\GISClientSplashScreen_Top.png");
                SKCCResource.GISMapSplahScreen_Bottom.Save(fullDir + "\\GISMapSplahScreen_Bottom.png");
                SKCCResource.GISMapSplahScreen_Top.Save(fullDir + "\\GISMapSplahScreen_Top.png");
                SKCCResource.LiveAlarmPlayback_BackgroundImage.Save(fullDir + "\\LiveAlarmPlayback_BackgroundImage.png");
                SKCCResource.ProductLogo.Save(fullDir + "\\ProductLogo.png");
                SKCCResource.RecognitionAdminToolSplashScreen_Top.Save(fullDir + "\\RecognitionAdminToolSplashScreen_Top.png");
                SKCCResource.RemoteClientSplashScreen_Bottom.Save(fullDir + "\\RemoteClientSplashScreen_Bottom.png");
                SKCCResource.RemoteClientSplashScreen_Top.Save(fullDir + "\\RemoteClientSplashScreen_Top.png");
                SKCCResource.SplashScreen_Bottom.Save(fullDir + "\\SplashScreen_Bottom.png");
                SKCCResource.SplashScreen_Top.Save(fullDir + "\\SplashScreen_Top.png");
                SKCCResource.Sundance_Logo.Save(fullDir + "\\Sundance_Logo.png");
                SKCCResource.Sundance_Logo_Long.Save(fullDir + "\\Sundance_Logo_Long.bmp");
                SKCCResource.Uninstall_BG_top.Save(fullDir + "\\Uninstall_BG_top.jpg");
                SKCCResource.Wizard_BG_left.Save(fullDir + "\\Wizard_BG_left.png");
                SKCCResource.Wizard_BG_left_tile.Save(fullDir + "\\Wizard_BG_left_tile.jpg");
                SKCCResource.Wizard_BG_top.Save(fullDir + "\\Wizard_BG_top.jpg");
            }

            CommonResource.Map_Audio.Save(fullDir + "\\Map_Audio.png");
            CommonResource.Map_AudioBlue.Save(fullDir + "\\Map_AudioBlue.png");
            CommonResource.Map_AudioRed.Save(fullDir + "\\Map_AudioRed.png");
            CommonResource.Map_Camera.Save(fullDir + "\\Map_Camera.png");
            CommonResource.Map_Camera_down.Save(fullDir + "\\Map_Camera_down.png");
            CommonResource.Map_Camera_left.Save(fullDir + "\\Map_Camera_left.png");
            CommonResource.Map_Camera_right.Save(fullDir + "\\Map_Camera_right.png");
            CommonResource.Map_Camera_up.Save(fullDir + "\\Map_Camera_up.png");
            CommonResource.Map_CameraBlue.Save(fullDir + "\\Map_CameraBlue.png");
            CommonResource.Map_CameraBlue_left.Save(fullDir + "\\Map_CameraBlue_left.png");
            CommonResource.Map_CameraBlue_right.Save(fullDir + "\\Map_CameraBlue_right.png");
            CommonResource.Map_CameraBlue_up.Save(fullDir + "\\Map_CameraBlue_up.png");
            CommonResource.Map_CameraRed.Save(fullDir + "\\Map_CameraRed.png");
            CommonResource.Map_CameraRed_left.Save(fullDir + "\\Map_CameraRed_left.png");
            CommonResource.Map_CameraRed_right.Save(fullDir + "\\Map_CameraRed_right.png");
            CommonResource.Map_CameraRed_up.Save(fullDir + "\\Map_CameraRed_up.png");
            CommonResource.Map_Maplink.Save(fullDir + "\\Map_Maplink.png");
            CommonResource.Map_Relay.Save(fullDir + "\\Map_Relay.png");
            CommonResource.Map_Relay_down.Save(fullDir + "\\Map_Relay_down.png");
            CommonResource.Map_Relay_left.Save(fullDir + "\\Map_Relay_left.png");
            CommonResource.Map_Relay_right.Save(fullDir + "\\Map_Relay_right.png");
            CommonResource.Map_Relay_up.Save(fullDir + "\\Map_Relay_up.png");
            CommonResource.Map_RelayBlue.Save(fullDir + "\\Map_RelayBlue.png");
            CommonResource.Map_RelayBlue_down.Save(fullDir + "\\Map_RelayBlue_down.png");
            CommonResource.Map_RelayBlue_left.Save(fullDir + "\\Map_RelayBlue_left.png");
            CommonResource.Map_RelayBlue_right.Save(fullDir + "\\Map_RelayBlue_right.png");
            CommonResource.Map_RelayBlue_up.Save(fullDir + "\\Map_RelayBlue_up.png");
            CommonResource.Map_RelayRed.Save(fullDir + "\\Map_RelayRed.png");
            CommonResource.Map_RelayRed_down.Save(fullDir + "\\Map_RelayRed_down.png");
            CommonResource.Map_RelayRed_left.Save(fullDir + "\\Map_RelayRed_left.png");
            CommonResource.Map_RelayRed_right.Save(fullDir + "\\Map_RelayRed_right.png");
            CommonResource.Map_RelayRed_up.Save(fullDir + "\\Map_RelayRed_up.png");
            CommonResource.Map_Sensor.Save(fullDir + "\\Map_Sensor.png");
            CommonResource.Map_SensorBlue.Save(fullDir + "\\Map_SensorBlue.png");
            CommonResource.Map_SensorRed.Save(fullDir + "\\Map_SensorRed.png");
            CommonResource.Map_VideoServer.Save(fullDir + "\\Map_VideoServer.png");
        }

        #endregion
    }
}
