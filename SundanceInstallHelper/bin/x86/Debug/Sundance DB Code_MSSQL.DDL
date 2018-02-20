
/*==========================================*/
/*  CODE FOR CREATION OF VIEWS AND INDEXES  */
/*==========================================*/

GO

BEGIN TRANSACTION
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
GO


/*==========================================*/
/*      VIEWS                               */
/*==========================================*/

/*==========================================*/
/****    viewActionsTaken    */
/*==========================================*/
CREATE VIEW viewActionsTaken
AS
SELECT DISTINCT ActionsTaken.ActionTakenID, ActionsTaken.ActionTakenNameResID, ResourceTexts.Text AS ActionTaken
FROM         ResourceTexts INNER JOIN
                      ActionsTaken ON ResourceTexts.ResourceID = ActionsTaken.ActionTakenNameResID
WHERE     (ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewActionGroups    */
/* EnumGen 에서 이용 */
/*==========================================*/
CREATE VIEW [dbo].[viewActionGroups]
AS
SELECT     dbo.ActionGroups.ActionGroupID, dbo.ActionGroups.ActionGroupNameResID, dbo.ResourceTexts.Text, REPLACE(dbo.ResourceTexts.Text, ' ', '') 
                      AS EnumItem
FROM         dbo.ActionGroups INNER JOIN
                      dbo.ResourceTexts ON dbo.ActionGroups.ActionGroupNameResID = dbo.ResourceTexts.ResourceID
WHERE     (dbo.ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewActionTypes    */
/* EnumGen 에서 이용 */
/*==========================================*/
CREATE VIEW viewActionTypes
AS
SELECT     TOP (100) PERCENT ActionTypes.ActionTypeID, ActionTypes.ActionTypeNameResID, Resources.Description AS Resource, 
                      ResourceTexts.Text AS EnglishText, REPLACE(ResourceTexts.Text, ' ', '') AS EnumItem
FROM         ActionTypes INNER JOIN
                      Resources ON ActionTypes.ActionTypeNameResID = Resources.ResourceID INNER JOIN
                      ResourceTexts ON Resources.ResourceID = ResourceTexts.ResourceID
WHERE     (ResourceTexts.LanguageID = 1)
ORDER BY ActionTypes.ActionTypeID

GO

/*==========================================*/
/****    viewAlarmStatus    */
/*==========================================*/
CREATE VIEW viewAlarmStatus
AS
SELECT DISTINCT AlarmStatus.AlarmStatusID, AlarmStatus.AlarmStatusNameResID, ResourceTexts.Text AS AlarmStatus
FROM         ResourceTexts INNER JOIN
                      AlarmStatus ON ResourceTexts.ResourceID = AlarmStatus.AlarmStatusNameResID
WHERE     (ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewEventGroups    */
/* EnumGen 에서 이용 */
/*==========================================*/
CREATE VIEW [dbo].[viewEventGroups]
AS
SELECT     dbo.EventGroups.EventGroupID, dbo.EventGroups.EventGroupNameResID, dbo.ResourceTexts.Text, REPLACE(dbo.ResourceTexts.Text, ' ', '') 
                      AS EnumItem
FROM         dbo.EventGroups LEFT OUTER JOIN
                      dbo.ResourceTexts ON dbo.EventGroups.EventGroupNameResID = dbo.ResourceTexts.ResourceID
WHERE     (dbo.ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewEventTypes    */
/* EnumGen 에서 이용 */
/*==========================================*/
CREATE VIEW viewEventTypes
AS
SELECT     TOP (100) PERCENT EventTypes.EventTypeID, EventTypes.EventTypeNameResID, Resources.Description AS Resource, 
                      ResourceTexts.Text AS EnglishText, REPLACE(ResourceTexts.Text, ' ', '') AS EnumItem
FROM         EventTypes INNER JOIN
                      Resources ON EventTypes.EventTypeNameResID = Resources.ResourceID INNER JOIN
                      ResourceTexts ON Resources.ResourceID = ResourceTexts.ResourceID
WHERE     (ResourceTexts.LanguageID = 1)
ORDER BY EventTypes.EventTypeID

GO


/*==========================================*/
/****    viewDeviceTypes    */
/* EnumGen 에서 이용 */
/*==========================================*/
CREATE VIEW viewDeviceTypes
AS
SELECT     dbo.DeviceTypes.DeviceTypeID, dbo.DeviceTypes.DescriptionResID, dbo.Resources.Description AS Resource, 
                      dbo.ResourceTexts.Text AS EnglishText, REPLACE(dbo.ResourceTexts.Text, ' ', '') AS EnumItem
FROM         dbo.DeviceTypes INNER JOIN
                      dbo.Resources ON dbo.DeviceTypes.DescriptionResID = dbo.Resources.ResourceID INNER JOIN
                      dbo.ResourceTexts ON dbo.Resources.ResourceID = dbo.ResourceTexts.ResourceID
WHERE     (dbo.ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewAlarmCategories    */
/*==========================================*/
CREATE VIEW viewAlarmCategories
AS
SELECT     AlarmCategories.AlarmCategoryID, ResourceTexts.Text AS CategoryName
FROM         AlarmCategories INNER JOIN
                      ResourceTexts ON AlarmCategories.CategoryNameResID = ResourceTexts.ResourceID
WHERE     (ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewAlarmPriority    */
/*==========================================*/
CREATE VIEW [dbo].[viewAlarmPriority]
AS
SELECT     dbo.AlarmPriorities.AlarmPriorityID, dbo.AlarmPriorities.AlarmPriorityNameResID, dbo.ResourceTexts.Text AS AlarmPriority
FROM         dbo.AlarmPriorities INNER JOIN
                      dbo.ResourceTexts ON dbo.AlarmPriorities.AlarmPriorityNameResID = dbo.ResourceTexts.ResourceID
WHERE     (dbo.ResourceTexts.LanguageID = 1)

GO

/*==========================================*/
/****    viewResourceTexts    */
/*==========================================*/
CREATE VIEW [dbo].[viewResourceTexts]
AS
SELECT     TOP (100) PERCENT dbo.Resources.ResourceID, dbo.Resources.Description, dbo.ResourceTexts.Text
FROM         dbo.Resources INNER JOIN
                      dbo.ResourceTexts ON dbo.Resources.ResourceID = dbo.ResourceTexts.ResourceID
WHERE     (dbo.ResourceTexts.LanguageID = 1)
ORDER BY dbo.Resources.ResourceID

GO


/*==========================================*/
/****    viewLanguages    */
/*==========================================*/
CREATE VIEW [dbo].[viewLanguages]
AS
SELECT     dbo.Languages.LanguageID, dbo.ResourceTexts.LanguageID AS DescriptionLanguage, dbo.ResourceTexts.Text
FROM         dbo.Languages INNER JOIN
                      dbo.ResourceTexts ON dbo.Languages.LanguageNameResID = dbo.ResourceTexts.ResourceID
GO

/*==========================================*/
/****    viewPermissions    */
/* EnumGenerator 에서만 사용함으로 다른 DB 에서는 변경할 필요 없음 */
/*==========================================*/
CREATE VIEW [dbo].[viewPermissions]
AS
SELECT     TOP (100) PERCENT PermissionID, PermissionType, Name, 
                      CASE PermissionType WHEN 0 THEN 'System_' + Name WHEN 1 THEN 'Site_' + Name WHEN 2 THEN 'Device_' + Name WHEN 3 THEN 'Macro_' + Name WHEN 4 THEN 'ViewLayout_' + Name WHEN 5 THEN 'NetworkDevice_' + Name
                       END AS EnumItem
FROM         dbo.Permissions
ORDER BY PermissionType, Name

GO

/*==========================================*/
/****    viewUserRoles     */
/*==========================================*/
CREATE VIEW [dbo].[viewUserRoles]
AS
SELECT     TOP (100) PERCENT dbo.Roles.RoleName, dbo.Users.UserName
FROM         dbo.Users LEFT OUTER JOIN
                      dbo.UserRoles ON dbo.Users.UserID = dbo.UserRoles.UserID RIGHT OUTER JOIN
                      dbo.Roles ON dbo.UserRoles.RoleID = dbo.Roles.RoleID
WHERE     (dbo.Users.IsDeleted = 0) AND (dbo.Roles.IsDeleted = 0)
ORDER BY dbo.Roles.RoleName, dbo.Users.UserName

GO

/*  Formatted Views. These are more complex so we include their   */
/*  layout info. Note that they have to be in logical order       */

/*==========================================*/
/* START viewAlarms    */
/*==========================================*/
CREATE VIEW [dbo].[viewAlarms]
AS
SELECT     dbo.ActionLog.EventLogID, dbo.ActionLog.ActionLogID, dbo.ActionLog.DayInt, dbo.ActionLog.EventDayCount, 
                      dbo.ActionLog.LogDateTime AS ActionTime, dbo.AlarmChecks.AlarmCheckID, dbo.ActionLog.AlarmID, dbo.AlarmChecks.UserID, 
                      dbo.AlarmChecks.CheckDateTime, dbo.AlarmChecks.CheckTimeOfDay, dbo.AlarmChecks.AlarmStatusID, dbo.AlarmChecks.ActionTakenID, 
                      dbo.AlarmChecks.AlarmPriorityID, dbo.AlarmChecks.AlarmCategoryID, dbo.AlarmChecks.Notes, dbo.Devices.DeviceID, dbo.Devices.CustomGroupID, 
                      dbo.Devices.SiteID, dbo.ActionLog.PreRecord, dbo.ActionLog.PostRecord
FROM         dbo.Devices INNER JOIN
                      dbo.Cameras ON dbo.Devices.DeviceID = dbo.Cameras.DeviceID INNER JOIN
                      dbo.ActionLog INNER JOIN
                      dbo.AlarmChecks ON dbo.AlarmChecks.ActionLogID = dbo.ActionLog.ActionLogID INNER JOIN
                      dbo.Alarms ON dbo.ActionLog.AlarmID = dbo.Alarms.AlarmID ON dbo.Cameras.CameraID = dbo.Alarms.CameraID

GO

/*==========================================*/
/* START viewEvents    */
/*==========================================*/
CREATE VIEW [dbo].[viewEvents]
AS
SELECT     dbo.EventLog.EventLogID, ISNULL(dbo.viewAlarms.DayInt, dbo.EventLog.DayInt) AS DayInt, ISNULL(dbo.viewAlarms.EventDayCount, dbo.EventLog.EventDayCount) 
                      AS EventDayCount, dbo.EventLog.EventTypeID, dbo.EventLog.LogDateTime, dbo.EventLog.LogTimeOfDay, dbo.EventLog.DeviceID AS EventDeviceID, 
                      dbo.viewAlarms.ActionLogID, dbo.viewAlarms.ActionTime, dbo.viewAlarms.AlarmID, dbo.viewAlarms.AlarmCheckID, dbo.viewAlarms.UserID, 
                      dbo.viewAlarms.CheckDateTime, dbo.viewAlarms.CheckTimeOfDay, dbo.viewAlarms.AlarmStatusID, dbo.viewAlarms.ActionTakenID, dbo.viewAlarms.AlarmPriorityID, 
                      dbo.viewAlarms.AlarmCategoryID, ISNULL(dbo.viewAlarms.DeviceID, dbo.EventLog.DeviceID) AS DeviceID, ISNULL(dbo.viewAlarms.CustomGroupID, 
                      dbo.Devices.CustomGroupID) AS CustomGroupID, ISNULL(dbo.viewAlarms.SiteID, dbo.Devices.SiteID) AS SiteID, dbo.viewAlarms.Notes, 
                      dbo.EventLog.DayInt AS EventDayInt, dbo.EventLog.EventDayCount AS EventEventDayCount, dbo.viewAlarms.DayInt AS AlarmDayInt, 
                      dbo.viewAlarms.EventDayCount AS AlarmEventDayCount, dbo.viewAlarms.PreRecord, dbo.viewAlarms.PostRecord, dbo.EventLog.LogDescription, 
                      dbo.EventLog.VideoAnalyticsLogID, dbo.EventLog.RecognitionServerLogID
FROM         dbo.EventLog LEFT OUTER JOIN
                      dbo.Devices ON dbo.EventLog.DeviceID = dbo.Devices.DeviceID LEFT OUTER JOIN
                      dbo.viewAlarms ON dbo.EventLog.EventLogID = dbo.viewAlarms.EventLogID

GO

/*==========================================*/
/* START viewEventLogs    */
/*==========================================*/
CREATE VIEW [dbo].[viewEventLogs]
AS
SELECT     dbo.viewEvents.DayInt, dbo.viewEvents.EventDayCount, 
                      dbo.viewEvents.EventLogID, dbo.viewEvents.EventTypeID, dbo.viewEvents.LogDateTime AS EventTime, dbo.viewEvents.LogTimeOfDay AS EventTimeOfDay, 
                      dbo.viewEvents.EventDeviceID, dbo.viewEvents.ActionLogID, dbo.viewEvents.ActionTime, dbo.viewEvents.AlarmID, dbo.viewEvents.AlarmCheckID, 
                      dbo.viewEvents.UserID AS AlarmUserID, dbo.Users.UserName AS AlarmUserName, dbo.viewEvents.CheckDateTime, dbo.viewEvents.CheckTimeOfDay, 
                      dbo.viewEvents.AlarmStatusID, dbo.viewEvents.ActionTakenID, dbo.viewEvents.AlarmPriorityID, dbo.viewEvents.AlarmCategoryID, dbo.viewEvents.Notes, 
                      dbo.viewEvents.DeviceID, dbo.Devices.DeviceName, dbo.viewEvents.CustomGroupID, dbo.CustomGroups.Name AS CustomGroupName, dbo.viewEvents.SiteID, 
                      dbo.Sites.Name AS SiteName, dbo.Alarms.AlarmName, dbo.viewEvents.AlarmEventDayCount, dbo.viewEvents.AlarmDayInt, dbo.viewEvents.EventEventDayCount, 
                      dbo.viewEvents.EventDayInt, dbo.viewEvents.PreRecord, dbo.viewEvents.PostRecord, dbo.EventTypes.InSystemLog, dbo.EventTypes.InAlarmLog, 
                      dbo.viewEvents.LogDescription, dbo.viewEvents.VideoAnalyticsLogID, dbo.VideoAnalyticsLog.ObjClassID, dbo.VideoAnalyticsLog.ObjClassName, 
                      dbo.VideoAnalyticsLog.ObjHeight, dbo.VideoAnalyticsLog.ObjSpeed, dbo.VideoAnalyticsLog.ZoneName, dbo.VideoAnalyticsLog.ObjColor1, 
                      dbo.VideoAnalyticsLog.ObjColor2, dbo.VideoAnalyticsLog.ObjColor3, dbo.VideoAnalyticsLog.ObjColor4, dbo.VideoAnalyticsLog.ObjColor5, 
                      dbo.VideoAnalyticsLog.ObjColor6, dbo.VideoAnalyticsLog.ObjColor7, dbo.VideoAnalyticsLog.ObjColor8, dbo.VideoAnalyticsLog.ObjColor9, 
                      dbo.VideoAnalyticsLog.ObjColor10, dbo.VideoAnalyticsLog.ObjRecoName, dbo.viewEvents.RecognitionServerLogID,
                      dbo.RecognitionServerLogs.RecognitionObjectName, dbo.RecognitionServerLogs.SavedFileID
FROM         dbo.viewEvents INNER JOIN
                      dbo.EventTypes ON dbo.viewEvents.EventTypeID = dbo.EventTypes.EventTypeID LEFT OUTER JOIN
                      dbo.RecognitionServerLogs ON dbo.viewEvents.RecognitionServerLogID = dbo.RecognitionServerLogs.RecognitionServerLogID LEFT OUTER JOIN
                      dbo.VideoAnalyticsLog ON dbo.viewEvents.VideoAnalyticsLogID = dbo.VideoAnalyticsLog.VideoAnalyticsLogID LEFT OUTER JOIN
                      dbo.Sites ON dbo.viewEvents.SiteID = dbo.Sites.SiteID LEFT OUTER JOIN
                      dbo.Alarms ON dbo.viewEvents.AlarmID = dbo.Alarms.AlarmID LEFT OUTER JOIN
                      dbo.CustomGroups ON dbo.viewEvents.CustomGroupID = dbo.CustomGroups.CustomGroupID LEFT OUTER JOIN
                      dbo.Devices ON dbo.viewEvents.DeviceID = dbo.Devices.DeviceID LEFT OUTER JOIN
                      dbo.Users ON dbo.viewEvents.UserID = dbo.Users.UserID

GO

/*==========================================*/
/* START viewNewEventLogs    */
/*==========================================*/
CREATE VIEW [dbo].[viewNewEventLogs]
AS
SELECT  dbo.EventLog.EventLogID, dbo.EventLog.UserID AS AlarmUserID, dbo.EventLog.ServerID, 
               dbo.EventLog.DeviceID AS EventDeviceID, dbo.EventLog.EventTypeID, dbo.Users.UserName, 
               dbo.Devices.DeviceName, dbo.Users.SmartPoliceID, dbo.EventLog.VideoAnalyticsLogID, 
               dbo.EventLog.RecognitionServerLogID, dbo.EventTypes.InSystemLog, dbo.EventTypes.InAlarmLog, 
               dbo.AlarmChecks.AlarmCheckID, dbo.AlarmChecks.AlarmStatusID, dbo.AlarmChecks.ActionTakenID, 
               dbo.AlarmChecks.AlarmPriorityID, dbo.AlarmChecks.AlarmCategoryID, dbo.AlarmChecks.Notes, 
               dbo.AlarmChecks.CompletedTime, dbo.AlarmChecks.CompletedNote, dbo.AlarmChecks.CheckDateTime, 
               dbo.AlarmChecks.CheckTimeOfDay, dbo.ActionLog.AlarmID, dbo.ActionLog.PreRecord, dbo.ActionLog.PostRecord, 
               dbo.Devices.SiteID, dbo.EventLog.DayInt AS EventDayInt, dbo.ActionLog.DayInt AS AlarmDayInt, 
               dbo.EventLog.LogDateTime AS EventTime, dbo.ActionLog.LogDateTime AS ActionTime, 
               dbo.EventLog.EventDayCount AS EventEventDayCount, dbo.ActionLog.EventDayCount AS AlarmEventDayCount, 
               dbo.Devices.DeviceID, dbo.ActionLog.ActionLogID, dbo.EventLog.LogDescription, 
               dbo.ActionLog.LogDescription AS ActionLogDescription
FROM     dbo.EventLog INNER JOIN
               dbo.EventTypes ON dbo.EventLog.EventTypeID = dbo.EventTypes.EventTypeID LEFT OUTER JOIN
               dbo.Users ON dbo.EventLog.UserID = dbo.Users.UserID LEFT OUTER JOIN
               dbo.Devices ON dbo.Devices.DeviceID = dbo.EventLog.DeviceID LEFT OUTER JOIN
               dbo.AlarmChecks INNER JOIN
               dbo.ActionLog ON dbo.AlarmChecks.ActionLogID = dbo.ActionLog.ActionLogID ON 
               dbo.EventLog.EventLogID = dbo.ActionLog.EventLogID

GO

/*==========================================*/
/* START viewEventsDisplay    */
/*==========================================*/

CREATE VIEW [dbo].[viewEventsDisplay]
AS
SELECT     dbo.EventLog.EventLogID, dbo.EventLog.EventTypeID, dbo.viewEventTypes.EnglishText AS EventTypeName, dbo.EventLog.DeviceID, 
                      dbo.Devices.DeviceName, dbo.EventLog.LogDateTime, dbo.EventLog.LogTimeOfDay, dbo.Schedules.ScheduleID, dbo.Schedules.ScheduleName
FROM         dbo.EventLog INNER JOIN
                      dbo.viewEventTypes ON dbo.EventLog.EventTypeID = dbo.viewEventTypes.EventTypeID LEFT OUTER JOIN
                      dbo.Devices ON dbo.EventLog.DeviceID = dbo.Devices.DeviceID LEFT OUTER JOIN
                      dbo.Schedules ON dbo.EventLog.ScheduleID = dbo.Schedules.ScheduleID
GO

/*==========================================*/
/* START viewAlarmsDisplay    */
/*==========================================*/
CREATE VIEW [dbo].[viewAlarmsDisplay]
AS
SELECT     dbo.ActionLog.ActionLogID, dbo.ActionLog.EventLogID, dbo.ResourceTexts.Text AS EventType, dbo.AlarmChecks.AlarmCheckID, 
                      dbo.viewActionTypes.EnglishText AS ActionType, dbo.ActionLog.AlarmID, dbo.Alarms.AlarmName, dbo.AlarmChecks.UserID AS AlarmUserID, 
                      dbo.Users.UserName AS AlarmUserName, dbo.AlarmChecks.CheckDateTime AS AlarmCheckTime, 
                      dbo.AlarmChecks.CheckTimeOfDay AS AlarmCheckTimeOfDay, dbo.AlarmChecks.AlarmStatusID, dbo.viewAlarmStatus.AlarmStatus, 
                      dbo.AlarmChecks.ActionTakenID, dbo.viewActionsTaken.ActionTaken, dbo.AlarmChecks.AlarmPriorityID, dbo.viewAlarmPriority.AlarmPriority, 
                      dbo.AlarmChecks.AlarmCategoryID, dbo.viewAlarmCategories.CategoryName AS AlarmCategory, dbo.ActionLog.LogDateTime, 
                      dbo.AlarmChecks.Notes
FROM         dbo.Alarms RIGHT OUTER JOIN
                      dbo.ResourceTexts INNER JOIN
                      dbo.viewActionTypes INNER JOIN
                      dbo.ActionLog ON dbo.viewActionTypes.ActionTypeID = dbo.ActionLog.ActionTypeID INNER JOIN
                      dbo.EventLog ON dbo.ActionLog.EventLogID = dbo.EventLog.EventLogID INNER JOIN
                      dbo.EventTypes ON dbo.EventLog.EventTypeID = dbo.EventTypes.EventTypeID ON 
                      dbo.ResourceTexts.ResourceID = dbo.EventTypes.EventTypeNameResID ON dbo.Alarms.AlarmID = dbo.ActionLog.AlarmID FULL OUTER JOIN
                      dbo.viewAlarmPriority INNER JOIN
                      dbo.AlarmChecks ON dbo.viewAlarmPriority.AlarmPriorityID = dbo.AlarmChecks.AlarmPriorityID LEFT OUTER JOIN
                      dbo.viewAlarmCategories ON dbo.AlarmChecks.AlarmCategoryID = dbo.viewAlarmCategories.AlarmCategoryID LEFT OUTER JOIN
                      dbo.viewAlarmStatus ON dbo.AlarmChecks.AlarmStatusID = dbo.viewAlarmStatus.AlarmStatusID LEFT OUTER JOIN
                      dbo.viewActionsTaken ON dbo.AlarmChecks.ActionTakenID = dbo.viewActionsTaken.ActionTakenID ON 
                      dbo.ActionLog.ActionLogID = dbo.AlarmChecks.ActionLogID FULL OUTER JOIN
                      dbo.Users ON dbo.AlarmChecks.UserID = dbo.Users.UserID
WHERE     (dbo.ActionLog.ActionTypeID = 1401)

GO

/*==========================================*/
/**** START viewSystemLogs */
/*==========================================*/
CREATE VIEW [dbo].[viewSystemLogs]
AS
SELECT     TOP (100) PERCENT dbo.EventLog.EventLogID, dbo.EventLog.EventTypeID, dbo.EventLog.DeviceID, dbo.EventLog.UserID, dbo.EventLog.ServerID, 
                      dbo.EventLog.ScheduleID, dbo.EventLog.LogDateTime, dbo.EventLog.LogTimeOfDay, dbo.EventLog.DayInt, dbo.EventLog.EventDayCount, 
                      dbo.Devices.DeviceName, dbo.Users.UserName, dbo.StorageServers.Name AS ServerName, dbo.Servers.HostName AS ServerHostName, 
                      dbo.Servers.IP AS ServerIP, dbo.Sites.Name AS SiteName, dbo.EventLog.LogDescription, dbo.EventLog.EventLogXml
FROM         dbo.Servers AS Servers_1 INNER JOIN
                      dbo.StorageServers AS StorageServers_1 ON Servers_1.ServerID = StorageServers_1.ServerID RIGHT OUTER JOIN
                      dbo.Devices LEFT OUTER JOIN
                      dbo.Sites AS Sites_1 ON dbo.Devices.SiteID = Sites_1.SiteID RIGHT OUTER JOIN
                      dbo.Users RIGHT OUTER JOIN
                      dbo.EventTypes INNER JOIN
                      dbo.EventLog ON dbo.EventTypes.EventTypeID = dbo.EventLog.EventTypeID ON dbo.Users.UserID = dbo.EventLog.UserID ON 
                      dbo.Devices.DeviceID = dbo.EventLog.DeviceID LEFT OUTER JOIN
                      dbo.StorageServers RIGHT OUTER JOIN
                      dbo.Servers ON dbo.StorageServers.ServerID = dbo.Servers.ServerID ON dbo.EventLog.ServerID = dbo.Servers.ServerID ON 
                      StorageServers_1.StorageServerID = dbo.Devices.StorageServerID LEFT OUTER JOIN
                      dbo.Sites ON dbo.Servers.SiteID = dbo.Sites.SiteID
WHERE     (dbo.EventTypes.InSystemLog = 1)
ORDER BY dbo.EventLog.EventLogID DESC

GO

/*==========================================*/
/**** START viewCameras */
/*==========================================*/
CREATE VIEW [dbo].[viewCameras]
AS
SELECT     dbo.Devices.DeviceID, dbo.Cameras.CameraID, dbo.Devices.ParentDeviceID, dbo.Devices.DeviceName, dbo.Manufacturers.Name AS Manufacturer, 
                      dbo.DeviceModels.ModelName, dbo.Devices.NetAddress, dbo.Devices.Port, dbo.Devices.LoginName, dbo.Devices.Password, dbo.Sites.Name AS Site, 
                      dbo.CustomGroups.Name AS CustomGroup, dbo.Cameras.PTZEnabled AS PTZEnabled
FROM         dbo.Cameras INNER JOIN
                      dbo.Devices ON dbo.Cameras.DeviceID = dbo.Devices.DeviceID INNER JOIN
                      dbo.DeviceModels ON dbo.Devices.DeviceModelID = dbo.DeviceModels.DeviceModelID INNER JOIN
                      dbo.Manufacturers ON dbo.DeviceModels.ManufacturerID = dbo.Manufacturers.ManufacturerID LEFT OUTER JOIN
                      dbo.Sites ON dbo.Devices.SiteID = dbo.Sites.SiteID LEFT OUTER JOIN
                      dbo.CustomGroups ON dbo.Devices.CustomGroupID = dbo.CustomGroups.CustomGroupID
WHERE     (dbo.Devices.IsDeleted = 0) AND (dbo.Cameras.IsDeleted = 0)

GO

/*==========================================*/
/* START viewDeviceModels    */
/*==========================================*/
CREATE VIEW [dbo].[viewDeviceModels]
AS
SELECT     TOP(5000) dbo.DeviceModels.DeviceModelID, dbo.NetworkDeviceModels.NetworkDeviceModelID, dbo.ResourceTexts.Text AS DeviceType, 
                      dbo.Manufacturers.Name AS Manufctr, dbo.DeviceModels.ModelName AS Model, dbo.NetworkDeviceModels.DSIDeviceTypeID AS DSI_Type, 
                      dbo.NetworkDeviceModels.DSIDeviceModelID AS DSI_Model, dbo.NetworkDeviceModels.DefaultLoginName, 
                      dbo.NetworkDeviceModels.DefaultPassword, dbo.NetworkDeviceModels.DefaultPort, dbo.NetworkDeviceModels.DefaultConfigURL, 
                      dbo.NetworkDeviceModels.MaxCameraCount, dbo.NetworkDeviceModels.MaxAudioInCount, dbo.NetworkDeviceModels.MaxAudioOutCount, 
                      dbo.NetworkDeviceModels.MaxSensorCount, dbo.NetworkDeviceModels.MaxRelayCount, dbo.NetworkDeviceModels.SupportsAbsolutePosition, 
                      dbo.NetworkDeviceModels.SupportsMotionDetection, dbo.NetworkDeviceModels.SupportsControlFrameRate, 
                      dbo.NetworkDeviceModels.SupportsControlResolution, dbo.NetworkDeviceModels.MaxPresetCount, dbo.NetworkDeviceModels.SupportsMenu, 
                      dbo.NetworkDeviceModels.SupportsPTZ, dbo.NetworkDeviceModels.MaxAuxiliaryCount, dbo.NetworkDeviceModels.SupportsLight, 
                      dbo.NetworkDeviceModels.SupportsWiper, dbo.NetworkDeviceModels.MaxPresetTourCount, dbo.NetworkDeviceModels.MaxPatternTourCount, 
                      dbo.NetworkDeviceModels.MaxSwingCount, dbo.NetworkDeviceModels.MaxOtherTourCount
FROM         dbo.DeviceModels INNER JOIN
                      dbo.DeviceTypes ON dbo.DeviceModels.DeviceTypeID = dbo.DeviceTypes.DeviceTypeID INNER JOIN
                      dbo.Manufacturers ON dbo.DeviceModels.ManufacturerID = dbo.Manufacturers.ManufacturerID INNER JOIN
                      dbo.ResourceTexts ON dbo.DeviceTypes.DescriptionResID = dbo.ResourceTexts.ResourceID LEFT OUTER JOIN
                      dbo.NetworkDeviceModels ON dbo.DeviceModels.DeviceModelID = dbo.NetworkDeviceModels.DeviceModelID
ORDER BY DeviceType, Manufctr, Model

GO

/*==========================================*/
/* START viewEventActionMap    */
/*==========================================*/
CREATE VIEW [dbo].[viewEventActionMap]
AS
SELECT     dbo.ResourceTexts.Text AS Event, Devices_1.DeviceName AS SourceDevice, dbo.Schedules.ScheduleName AS SourceSchedule, 
                      ResourceTexts_1.Text AS Action, Devices_2.DeviceName AS RecordingCamera, dbo.Devices.DeviceName AS ActionTargetDevice
FROM         dbo.Devices AS Devices_2 INNER JOIN
                      dbo.Cameras INNER JOIN
                      dbo.RecordingSchedules ON dbo.Cameras.CameraID = dbo.RecordingSchedules.CameraID ON 
                      Devices_2.DeviceID = dbo.Cameras.DeviceID RIGHT OUTER JOIN
                      dbo.Devices RIGHT OUTER JOIN
                      dbo.ResourceTexts INNER JOIN
                      dbo.EventTypes INNER JOIN
                      dbo.Events ON dbo.EventTypes.EventTypeID = dbo.Events.EventTypeID INNER JOIN
                      dbo.EventActions ON dbo.Events.EventID = dbo.EventActions.EventID INNER JOIN
                      dbo.ActionItems ON dbo.EventActions.ActionItemID = dbo.ActionItems.ActionItemID ON 
                      dbo.ResourceTexts.ResourceID = dbo.EventTypes.EventTypeNameResID INNER JOIN
                      dbo.ActionTypes ON dbo.ActionItems.ActionTypeID = dbo.ActionTypes.ActionTypeID INNER JOIN
                      dbo.ResourceTexts AS ResourceTexts_1 ON dbo.ActionTypes.ActionTypeNameResID = ResourceTexts_1.ResourceID ON 
                      dbo.Devices.DeviceID = dbo.ActionItems.DeviceID ON 
                      dbo.RecordingSchedules.RecordingScheduleID = dbo.ActionItems.RecordingScheduleID LEFT OUTER JOIN
                      dbo.Devices AS Devices_1 ON dbo.Events.DeviceID = Devices_1.DeviceID LEFT OUTER JOIN
                      dbo.Schedules ON dbo.Events.ScheduleID = dbo.Schedules.ScheduleID

GO

/*==========================================*/
/* START viewUsers		*/
/*==========================================*/
CREATE VIEW [dbo].[viewUsers]
AS
SELECT     UserID, UserName, FirstName, LastName, Description
FROM         dbo.Users
WHERE     (IsDeleted = 0)

GO

/*==========================================*/
/* START viewEventLogTypes		*/
/*==========================================*/
CREATE VIEW [dbo].[viewEventLogTypes]
AS
SELECT dbo.EventTypes.EventTypeID, dbo.EventTypes.EventGroupID, dbo.EventTypes.EventTypeNameResID, 
    dbo.EventTypes.LogByDefault, dbo.EventTypes.AllowCustomLogSetting, 
	dbo.EventTypes.FirstSupportingDBVersion, dbo.EventTypes.IsDeleted, dbo.EventTypes.InSystemLog, 
	dbo.EventTypes.InAlarmLog 
FROM dbo.EventTypes
	INNER JOIN (SELECT DISTINCT dbo.EventLog.EventTypeID FROM dbo.EventLog) el ON dbo.EventTypes.EventTypeID = el.EventTypeID
	
GO

/*==========================================*/
/*     FUNCTIONS                    */
/*==========================================*/



/*==========================================*/
/*     STORED PROCEDURES                    */
/*==========================================*/

-- 국내에서 InstallSundance.exe 를 사용중임으로 관련 코드를
-- 추가한다.
-- =============================================
-- Author:		Daniel Hochee
-- Create date: 5/15/2009
-- Description:	This script will disable all constraints on all tables within the database that it is 
--              run in to allow batch operations. When finished processing, call spEnableConstraints.
-- =============================================
CREATE PROCEDURE [dbo].[spDisableConstraints] 
AS
BEGIN

SET NOCOUNT ON
SET ROWCOUNT 0 

DECLARE @Count int
DECLARE @String nvarchar (1000)
DECLARE @ConstraintName varchar(128)
DECLARE @TableName varchar(128)

--Find all constraints and their respective tables from the sysobjects table and place into a temp table.
--Primary Key and Unique Constraints via Unique Indexes are not disabled through this command
--You should use the ALTER INDEX...DISABLE command in SQL Server 2005
SELECT 
		name					 AS constraintname,
		object_name(parent_obj)  AS tablename 
INTO #Const_Table
FROM sysobjects s 
where xtype in ('F')

SELECT @Count = Count(*) FROM #Const_Table

--Setting the rowcount to one allows for one row from the temp table to be picked off at a time.
--Used as an alternative to a cursor.
SET ROWCOUNT 1

--Loop until all rows in temp table have been processed.
WHILE @Count > 0
BEGIN
	--The rowcount of one ensures that only one tablename and constraint name is picked.
	SELECT @TableName = TableName, @ConstraintName = ConstraintName
	FROM #Const_Table

	--Build execution string to disable constraint.
	SET @String = 'ALTER TABLE ['+ @tablename + '] NOCHECK CONSTRAINT [' + @constraintname +']'

	--Execute the SQL
	exec sp_executesql @string

	--Remove this row from the temp table, since it has now been processed.
	DELETE FROM #Const_Table WHERE ConstraintName = @ConstraintName and TableName = @TableName

	SET @Count = @Count - 1
END -- Loop

set rowcount 0

END

GO

-- =============================================
-- Author:		Daniel Hochee
-- Create date: 5/15/09
-- Description:	This script will enable all constraints on all tables within the database that it is run in. 
--              Generally called when finished batch processing after first calling spDisableConstraints.
-- =============================================
CREATE PROCEDURE [dbo].[spEnableConstraints] 
AS
BEGIN

SET NOCOUNT ON
SET ROWCOUNT 0 

DECLARE @Count int
DECLARE @String nvarchar (1000)
DECLARE @ConstraintName varchar(128)
DECLARE @TableName varchar(128)

--Find all constraints and their respective tables from the sysobjects table and place into a temp table.
--Primary Key and Unique Constraints via Unique Indexes are not disabled through this command
--You should use the ALTER INDEX...DISABLE command in SQL Server 2005
SELECT 
		name					 AS constraintname,
		object_name(parent_obj)  AS tablename 
INTO #Const_Table
FROM sysobjects s 
where xtype in ('F')

SELECT @Count = Count(*) FROM #Const_Table

--Setting the rowcount to one allows for one row from the temp table to be picked off at a time.
--Used as an alternative to a cursor.
SET ROWCOUNT 1

--Loop until all rows in temp table have been processed.
WHILE @Count > 0
BEGIN
	--The rowcount of one ensures that only one tablename and constraint name is picked.
	SELECT @TableName = TableName, @ConstraintName = ConstraintName
	FROM #Const_Table

	--Build execution string to disable constraint.
	SET @String = 'ALTER TABLE ['+ @tablename + '] CHECK CONSTRAINT [' + @constraintname +']'

	--Execute the SQL
	exec sp_executesql @string

	--Remove this row from the temp table, since it has now been processed.
	DELETE FROM #Const_Table WHERE ConstraintName = @ConstraintName and TableName = @TableName

	SET @Count = @Count - 1
END -- Loop

set rowcount 0
 

END

GO