/*==========================================*/
/* 주의                                                                  */
/* 1. 모든 테이블 명과 컬럼 명은 쌍따옴표 (")로 묶어 정의한다. */
/*==========================================*/

/*==========================================*/
/*  CODE FOR CREATION OF VIEWS AND INDEXES  */
/*==========================================*/


/*==========================================*/
/*      VIEWS                               */
/*==========================================*/

/*==========================================*/
/* viewActionsTaken    */
/*==========================================*/
CREATE VIEW "viewActionsTaken"
AS
SELECT DISTINCT "ActionsTaken"."ActionTakenID", "ActionsTaken"."ActionTakenNameResID", "ResourceTexts"."Text" AS "ActionTaken"
FROM         "ResourceTexts" INNER JOIN
                      "ActionsTaken" ON "ResourceTexts"."ResourceID" = "ActionsTaken"."ActionTakenNameResID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewActionGroups    */
/*==========================================*/
CREATE VIEW "viewActionGroups"
AS
SELECT     "ActionGroups"."ActionGroupID", "ActionGroups"."ActionGroupNameResID", "ResourceTexts"."Text", REPLACE("ResourceTexts"."Text", ' ', '') 
                      AS "EnumItem"
FROM         "ActionGroups" INNER JOIN
                      "ResourceTexts" ON "ActionGroups"."ActionGroupNameResID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewActionTypes    */
/*==========================================*/
CREATE VIEW "viewActionTypes"
AS
SELECT     "ActionTypes"."ActionTypeID", "ActionTypes"."ActionTypeNameResID", "Resources"."Description" AS "Resource", 
                      "ResourceTexts"."Text" AS "EnglishText", REPLACE("ResourceTexts"."Text", ' ', '') AS "EnumItem"
FROM         "ActionTypes" INNER JOIN
                      "Resources" ON "ActionTypes"."ActionTypeNameResID" = "Resources"."ResourceID" INNER JOIN
                      "ResourceTexts" ON "Resources"."ResourceID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1)
ORDER BY "ActionTypes"."ActionTypeID";

/*==========================================*/
/* viewAlarmStatus    */
/*==========================================*/
CREATE VIEW "viewAlarmStatus"
AS
SELECT DISTINCT "AlarmStatus"."AlarmStatusID", "AlarmStatus"."AlarmStatusNameResID", "ResourceTexts"."Text" AS "AlarmStatus"
FROM         "ResourceTexts" INNER JOIN
                      "AlarmStatus" ON "ResourceTexts"."ResourceID" = "AlarmStatus"."AlarmStatusNameResID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewEventGroups    */
/*==========================================*/
CREATE VIEW "viewEventGroups"
AS
SELECT     "EventGroups"."EventGroupID", "EventGroups"."EventGroupNameResID", "ResourceTexts"."Text", REPLACE("ResourceTexts"."Text", ' ', '') 
                      AS "EnumItem"
FROM         "EventGroups" LEFT OUTER JOIN
                      "ResourceTexts" ON "EventGroups"."EventGroupNameResID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewEventTypes    */
/*==========================================*/
CREATE VIEW "viewEventTypes"
AS
SELECT     "EventTypes"."EventTypeID", "EventTypes"."EventTypeNameResID", "Resources"."Description" AS "Resource", 
                      "ResourceTexts"."Text" AS "EnglishText", REPLACE("ResourceTexts"."Text", ' ', '') AS "EnumItem"
FROM         "EventTypes" INNER JOIN
                      "Resources" ON "EventTypes"."EventTypeNameResID" = "Resources"."ResourceID" INNER JOIN
                      "ResourceTexts" ON "Resources"."ResourceID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1)
ORDER BY "EventTypes"."EventTypeID";

/*==========================================*/
/* viewDeviceTypes    */
/*==========================================*/
CREATE VIEW "viewDeviceTypes"
AS
SELECT     "DeviceTypes"."DeviceTypeID", "DeviceTypes"."DescriptionResID", "Resources"."Description" AS "Resource", 
                      "ResourceTexts"."Text" AS "EnglishText", REPLACE("ResourceTexts"."Text", ' ', '') AS "EnumItem"
FROM         "DeviceTypes" INNER JOIN
                      "Resources" ON "DeviceTypes"."DescriptionResID" = "Resources"."ResourceID" INNER JOIN
                      "ResourceTexts" ON "Resources"."ResourceID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewAlarmCategories    */
/*==========================================*/
CREATE VIEW "viewAlarmCategories"
AS
SELECT     "AlarmCategories"."AlarmCategoryID", "ResourceTexts"."Text" AS "CategoryName"
FROM         "AlarmCategories" INNER JOIN
                      "ResourceTexts" ON "AlarmCategories"."CategoryNameResID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewAlarmPriority    */
/*==========================================*/
CREATE VIEW "viewAlarmPriority"
AS
SELECT     "AlarmPriorities"."AlarmPriorityID", "AlarmPriorities"."AlarmPriorityNameResID", "ResourceTexts"."Text" AS "AlarmPriority"
FROM         "AlarmPriorities" INNER JOIN
                      "ResourceTexts" ON "AlarmPriorities"."AlarmPriorityNameResID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1);

/*==========================================*/
/* viewResourceTexts    */
/*==========================================*/
CREATE VIEW "viewResourceTexts"
AS
SELECT     "Resources"."ResourceID", "Resources"."Description", "ResourceTexts"."Text"
FROM         "Resources" INNER JOIN
                      "ResourceTexts" ON "Resources"."ResourceID" = "ResourceTexts"."ResourceID"
WHERE     ("ResourceTexts"."LanguageID" = 1)
ORDER BY "Resources"."ResourceID";

/*==========================================*/
/* viewLanguages    */
/*==========================================*/
CREATE VIEW "viewLanguages"
AS
SELECT     "Languages"."LanguageID", "ResourceTexts"."LanguageID" AS "DescriptionLanguage", "ResourceTexts"."Text"
FROM         "Languages" INNER JOIN
                      "ResourceTexts" ON "Languages"."LanguageNameResID" = "ResourceTexts"."ResourceID";

/*  Formatted Views. These are more complex so we include their   */
/*  layout info. Note that they have to be in logical order       */

/*==========================================*/
/* viewUserRoles     */
/*==========================================*/
CREATE VIEW "viewUserRoles"
AS
SELECT     "Roles"."RoleName", "Users"."UserName"
FROM         "Users" LEFT OUTER JOIN
                      "UserRoles" ON "Users"."UserID" = "UserRoles"."UserID" RIGHT OUTER JOIN
                      "Roles" ON "UserRoles"."RoleID" = "Roles"."RoleID"
WHERE     ("Users"."IsDeleted" = 0) AND ("Roles"."IsDeleted" = 0)
ORDER BY "Roles"."RoleName", "Users"."UserName";

/*==========================================*/
/* viewAlarms    */
/*==========================================*/
CREATE VIEW "viewAlarms"
AS
SELECT     "ActionLog"."EventLogID", "ActionLog"."ActionLogID", "ActionLog"."DayInt", "ActionLog"."EventDayCount", 
                      "ActionLog"."LogDateTime" AS "ActionTime", "AlarmChecks"."AlarmCheckID", "ActionLog"."AlarmID", "AlarmChecks"."UserID", 
                      "AlarmChecks"."CheckDateTime", "AlarmChecks"."CheckTimeOfDay", "AlarmChecks"."AlarmStatusID", "AlarmChecks"."ActionTakenID", 
                      "AlarmChecks"."AlarmPriorityID", "AlarmChecks"."AlarmCategoryID", "AlarmChecks"."Notes", "Devices"."DeviceID", "Devices"."CustomGroupID", 
                      "Devices"."SiteID", "ActionLog"."PreRecord", "ActionLog"."PostRecord"
FROM         "Devices" INNER JOIN
                      "Cameras" ON "Devices"."DeviceID" = "Cameras"."DeviceID" INNER JOIN
                      "ActionLog" INNER JOIN
                      "AlarmChecks" ON "AlarmChecks"."ActionLogID" = "ActionLog"."ActionLogID" INNER JOIN
                      "Alarms" ON "ActionLog"."AlarmID" = "Alarms"."AlarmID" ON "Cameras"."CameraID" = "Alarms"."CameraID";

/*==========================================*/
/* viewEvents    */
/*==========================================*/
CREATE VIEW "viewEvents"
AS
SELECT     "EventLog"."EventLogID", "EventLog"."DayInt" AS "DayInt", "EventLog"."EventDayCount"
                      AS "EventDayCount", "EventLog"."EventTypeID", "EventLog"."LogDateTime", "EventLog"."LogTimeOfDay", "EventLog"."DeviceID" AS "EventDeviceID", 
                      "viewAlarms"."ActionLogID", "viewAlarms"."ActionTime", "viewAlarms"."AlarmID", "viewAlarms"."AlarmCheckID", "viewAlarms"."UserID", 
                      "viewAlarms"."CheckDateTime", "viewAlarms"."CheckTimeOfDay", "viewAlarms"."AlarmStatusID", "viewAlarms"."ActionTakenID", "viewAlarms"."AlarmPriorityID", 
                      "viewAlarms"."AlarmCategoryID", "EventLog"."DeviceID" AS "DeviceID",
                      "Devices"."CustomGroupID" AS "CustomGroupID", "Devices"."SiteID" AS "SiteID", "viewAlarms"."Notes", 
                      "EventLog"."DayInt" AS "EventDayInt", "EventLog"."EventDayCount" AS "EventEventDayCount", "viewAlarms"."DayInt" AS "AlarmDayInt", 
                      "viewAlarms"."EventDayCount" AS "AlarmEventDayCount", "viewAlarms"."PreRecord", "viewAlarms"."PostRecord", "EventLog"."LogDescription", 
                      "EventLog"."VideoAnalyticsLogID", "EventLog"."RecognitionServerLogID"
FROM         "EventLog" LEFT OUTER JOIN
                      "Devices" ON "EventLog"."DeviceID" = "Devices"."DeviceID" LEFT OUTER JOIN
                      "viewAlarms" ON "EventLog"."EventLogID" = "viewAlarms"."EventLogID";

/*==========================================*/
/* viewEventLogs    */
/*==========================================*/
CREATE VIEW "viewEventLogs"
AS
SELECT     "viewEvents"."DayInt", "viewEvents"."EventDayCount", 
                      "viewEvents"."EventLogID", "viewEvents"."EventTypeID", "viewEvents"."LogDateTime" AS "EventTime", "viewEvents"."LogTimeOfDay" AS "EventTimeOfDay", 
                      "viewEvents"."EventDeviceID", "viewEvents"."ActionLogID", "viewEvents"."ActionTime", "viewEvents"."AlarmID", "viewEvents"."AlarmCheckID", 
                      "viewEvents"."UserID" AS "AlarmUserID", "Users"."UserName" AS "AlarmUserName", "viewEvents"."CheckDateTime", "viewEvents"."CheckTimeOfDay", 
                      "viewEvents"."AlarmStatusID", "viewEvents"."ActionTakenID", "viewEvents"."AlarmPriorityID", "viewEvents"."AlarmCategoryID", "viewEvents"."Notes", 
                      "viewEvents"."DeviceID", "Devices"."DeviceName", "viewEvents"."CustomGroupID", "CustomGroups"."Name" AS "CustomGroupName", "viewEvents"."SiteID", 
                      "Sites"."Name" AS "SiteName", "Alarms"."AlarmName", "viewEvents"."AlarmEventDayCount", "viewEvents"."AlarmDayInt", "viewEvents"."EventEventDayCount", 
                      "viewEvents"."EventDayInt", "viewEvents"."PreRecord", "viewEvents"."PostRecord", "EventTypes"."InSystemLog", "EventTypes"."InAlarmLog", 
                      "viewEvents"."LogDescription", "viewEvents"."VideoAnalyticsLogID", "VideoAnalyticsLog"."ObjClassID", "VideoAnalyticsLog"."ObjClassName", 
                      "VideoAnalyticsLog"."ObjHeight", "VideoAnalyticsLog"."ObjSpeed", "VideoAnalyticsLog"."ZoneName", "VideoAnalyticsLog"."ObjColor1", 
                      "VideoAnalyticsLog"."ObjColor2", "VideoAnalyticsLog"."ObjColor3", "VideoAnalyticsLog"."ObjColor4", "VideoAnalyticsLog"."ObjColor5", 
                      "VideoAnalyticsLog"."ObjColor6", "VideoAnalyticsLog"."ObjColor7", "VideoAnalyticsLog"."ObjColor8", "VideoAnalyticsLog"."ObjColor9", 
                      "VideoAnalyticsLog"."ObjColor10", "VideoAnalyticsLog"."ObjRecoName", "viewEvents"."RecognitionServerLogID",
                      "RecognitionServerLogs"."RecognitionObjectName", "RecognitionServerLogs"."SavedFileID"
FROM         "viewEvents" INNER JOIN
                      "EventTypes" ON "viewEvents"."EventTypeID" = "EventTypes"."EventTypeID" LEFT OUTER JOIN
                      "RecognitionServerLogs" ON "viewEvents"."RecognitionServerLogID" = "RecognitionServerLogs"."RecognitionServerLogID" LEFT OUTER JOIN
                      "VideoAnalyticsLog" ON "viewEvents"."VideoAnalyticsLogID" = "VideoAnalyticsLog"."VideoAnalyticsLogID" LEFT OUTER JOIN
                      "Sites" ON "viewEvents"."SiteID" = "Sites"."SiteID" LEFT OUTER JOIN
                      "Alarms" ON "viewEvents"."AlarmID" = "Alarms"."AlarmID" LEFT OUTER JOIN
                      "CustomGroups" ON "viewEvents"."CustomGroupID" = "CustomGroups"."CustomGroupID" LEFT OUTER JOIN
                      "Devices" ON "viewEvents"."DeviceID" = "Devices"."DeviceID" LEFT OUTER JOIN
                      "Users" ON "viewEvents"."UserID" = "Users"."UserID";

/*==========================================*/
/* viewNewEventLogs    */
/*==========================================*/
CREATE VIEW "viewNewEventLogs"
AS
SELECT     "EventLog.EventLogID", "EventLog.UserID" AS "AlarmUserID", "EventLog.ServerID", "EventLog.DeviceID" AS "EventDeviceID", "EventLog.EventTypeID", "Users.UserName", 
                      "Devices.DeviceName", "Users.SmartPoliceID", "EventLog.VideoAnalyticsLogID", "EventLog.RecognitionServerLogID", "EventTypes.InSystemLog", 
                      "EventTypes.InAlarmLog", "AlarmChecks.AlarmCheckID", "AlarmChecks.AlarmStatusID", "AlarmChecks.ActionTakenID", "AlarmChecks.AlarmPriorityID", 
                      "AlarmChecks.AlarmCategoryID", "AlarmChecks.Notes", "AlarmChecks.CompletedTime", "AlarmChecks.CompletedNote", "AlarmChecks.CheckDateTime", 
                      "AlarmChecks.CheckTimeOfDay", "ActionLog.AlarmID", "ActionLog.PreRecord", "ActionLog.PostRecord", "ActionLog.LogDescription", "Devices.SiteID", 
                      "EventLog.DayInt" AS "EventDayInt", "ActionLog.DayInt" AS "AlarmDayInt", "EventLog.LogDateTime" AS "EventTime", "ActionLog.LogDateTime" AS "ActionTime", 
                      "EventLog.EventDayCount" AS "EventEventDayCount", "ActionLog.EventDayCount" AS "AlarmEventDayCount", "Devices.DeviceID", "ActionLog.ActionLogID", 
                      "EventLog.LogDescription", "ActionLog.LogDescription" AS "ActionLogDescription"
FROM         "EventLog" INNER JOIN
                      "EventTypes ON "EventLog.EventTypeID" = "EventTypes.EventTypeID" LEFT OUTER JOIN
                      "Users ON "EventLog.UserID" = "Users.UserID" LEFT OUTER JOIN
                      "Devices ON "Devices.DeviceID" = "EventLog.DeviceID" LEFT OUTER JOIN
                      "AlarmChecks" INNER JOIN
                      "ActionLog" ON "AlarmChecks.ActionLogID" = "ActionLog.ActionLogID" ON "EventLog.EventLogID" = "ActionLog.EventLogID";

/*==========================================*/
/* viewEventsDisplay    */
/*==========================================*/
CREATE VIEW "viewEventsDisplay"
AS
SELECT     "EventLog"."EventLogID", "EventLog"."EventTypeID", "viewEventTypes"."EnglishText" AS "EventTypeName", "EventLog"."DeviceID", 
                      "Devices"."DeviceName", "EventLog"."LogDateTime", "EventLog"."LogTimeOfDay", "Schedules"."ScheduleID", "Schedules"."ScheduleName"
FROM         "EventLog" INNER JOIN
                      "viewEventTypes" ON "EventLog"."EventTypeID" = "viewEventTypes"."EventTypeID" LEFT OUTER JOIN
                      "Devices" ON "EventLog"."DeviceID" = "Devices"."DeviceID" LEFT OUTER JOIN
                      "Schedules" ON "EventLog"."ScheduleID" = "Schedules"."ScheduleID";

/*==========================================*/
/* viewAlarmsDisplay    */
/*==========================================*/
CREATE VIEW "viewAlarmsDisplay"
AS
SELECT     "ActionLog"."ActionLogID", "ActionLog"."EventLogID", "ResourceTexts"."Text" AS "EventType", "AlarmChecks"."AlarmCheckID", 
                      "viewActionTypes"."EnglishText" AS "ActionType", "ActionLog"."AlarmID", "Alarms"."AlarmName", "AlarmChecks"."UserID" AS "AlarmUserID", 
                      "Users"."UserName" AS "AlarmUserName", "AlarmChecks"."CheckDateTime" AS "AlarmCheckTime", 
                      "AlarmChecks"."CheckTimeOfDay" AS "AlarmCheckTimeOfDay", "AlarmChecks"."AlarmStatusID", "viewAlarmStatus"."AlarmStatus", 
                      "AlarmChecks"."ActionTakenID", "viewActionsTaken"."ActionTaken", "AlarmChecks"."AlarmPriorityID", "viewAlarmPriority"."AlarmPriority", 
                      "AlarmChecks"."AlarmCategoryID", "viewAlarmCategories"."CategoryName" AS "AlarmCategory", "ActionLog"."LogDateTime", 
                      "AlarmChecks"."Notes"
FROM         "Alarms" RIGHT OUTER JOIN
                      "ResourceTexts" INNER JOIN
                      "viewActionTypes" INNER JOIN
                      "ActionLog" ON "viewActionTypes"."ActionTypeID" = "ActionLog"."ActionTypeID" INNER JOIN
                      "EventLog" ON "ActionLog"."EventLogID" = "EventLog"."EventLogID" INNER JOIN
                      "EventTypes" ON "EventLog"."EventTypeID" = "EventTypes"."EventTypeID" ON 
                      "ResourceTexts"."ResourceID" = "EventTypes"."EventTypeNameResID" ON "Alarms"."AlarmID" = "ActionLog"."AlarmID" FULL OUTER JOIN
                      "viewAlarmPriority" INNER JOIN
                      "AlarmChecks" ON "viewAlarmPriority"."AlarmPriorityID" = "AlarmChecks"."AlarmPriorityID" LEFT OUTER JOIN
                      "viewAlarmCategories" ON "AlarmChecks"."AlarmCategoryID" = "viewAlarmCategories"."AlarmCategoryID" LEFT OUTER JOIN
                      "viewAlarmStatus" ON "AlarmChecks"."AlarmStatusID" = "viewAlarmStatus"."AlarmStatusID" LEFT OUTER JOIN
                      "viewActionsTaken" ON "AlarmChecks"."ActionTakenID" = "viewActionsTaken"."ActionTakenID" ON 
                      "ActionLog"."ActionLogID" = "AlarmChecks"."ActionLogID" FULL OUTER JOIN
                      "Users" ON "AlarmChecks"."UserID" = "Users"."UserID"
WHERE     ("ActionLog"."ActionTypeID" = 1401);

/*==========================================*/
/* viewSystemLogs */
/*==========================================*/
CREATE VIEW "viewSystemLogs"
AS
SELECT     "EventLog"."EventLogID", "EventLog"."EventTypeID", "EventLog"."DeviceID", "EventLog"."UserID", "EventLog"."ServerID", 
                      "EventLog"."ScheduleID", "EventLog"."LogDateTime", "EventLog"."LogTimeOfDay", "EventLog"."DayInt", "EventLog"."EventDayCount", 
                      "Devices"."DeviceName", "Users"."UserName", "StorageServers"."Name" AS "ServerName", "Servers"."HostName" AS "ServerHostName",
                      "Servers"."IP" AS "ServerIP", "Sites"."Name" AS "SiteName", "EventLog"."LogDescription", "EventLog"."EventLogXml"
FROM         "Servers" AS "Servers_1" INNER JOIN
                      "StorageServers" AS "StorageServers_1" ON "Servers_1"."ServerID" = "StorageServers_1"."ServerID" RIGHT OUTER JOIN
                      "Devices" LEFT OUTER JOIN
                      "Sites" AS "Sites_1" ON "Devices"."SiteID" = "Sites_1"."SiteID" RIGHT OUTER JOIN
                      "Users" RIGHT OUTER JOIN
                      "EventTypes" INNER JOIN
                      "EventLog" ON "EventTypes"."EventTypeID" = "EventLog"."EventTypeID" ON "Users"."UserID" = "EventLog"."UserID" ON 
                      "Devices"."DeviceID" = "EventLog"."DeviceID" LEFT OUTER JOIN
                      "StorageServers" RIGHT OUTER JOIN
                      "Servers" ON "StorageServers"."ServerID" = "Servers"."ServerID" ON "EventLog"."ServerID" = "Servers"."ServerID" ON 
                      "StorageServers_1"."StorageServerID" = "Devices"."StorageServerID" LEFT OUTER JOIN
                      "Sites" ON "Servers"."SiteID" = "Sites"."SiteID"
WHERE     ("EventTypes"."InSystemLog" = 1)
ORDER BY "EventLog"."EventLogID" DESC;

/*==========================================*/
/* viewCameras */
/*==========================================*/
CREATE VIEW "viewCameras"
AS
SELECT     "Devices"."DeviceID", "Cameras"."CameraID", "Devices"."ParentDeviceID", "Devices"."DeviceName", "Manufacturers"."Name" AS "Manufacturer", 
                      "DeviceModels"."ModelName", "Devices"."NetAddress", "Devices"."Port", "Devices"."LoginName", "Devices"."Password", "Sites"."Name" AS "Site", 
                      "CustomGroups"."Name" AS "CustomGroup"
FROM         "Cameras" INNER JOIN
                      "Devices" ON "Cameras"."DeviceID" = "Devices"."DeviceID" INNER JOIN
                      "DeviceModels" ON "Devices"."DeviceModelID" = "DeviceModels"."DeviceModelID" INNER JOIN
                      "Manufacturers" ON "DeviceModels"."ManufacturerID" = "Manufacturers"."ManufacturerID" LEFT OUTER JOIN
                      "Sites" ON "Devices"."SiteID" = "Sites"."SiteID" LEFT OUTER JOIN
                      "CustomGroups" ON "Devices"."CustomGroupID" = "CustomGroups"."CustomGroupID"
WHERE     ("Devices"."IsDeleted" = 0) AND ("Cameras"."IsDeleted" = 0);

/*==========================================*/
/* viewDeviceModels    */
/*==========================================*/
CREATE VIEW "viewDeviceModels"
AS
SELECT     FIRST 5000 "DeviceModels"."DeviceModelID", "NetworkDeviceModels"."NetworkDeviceModelID", "ResourceTexts"."Text" AS "DeviceType", 
                      "Manufacturers"."Name" AS "Manufctr", "DeviceModels"."ModelName" AS "Model", "NetworkDeviceModels"."DSIDeviceTypeID" AS "DSI_Type", 
                      "NetworkDeviceModels"."DSIDeviceModelID" AS "DSI_Model", "NetworkDeviceModels"."DefaultLoginName", 
                      "NetworkDeviceModels"."DefaultPassword", "NetworkDeviceModels"."DefaultPort", "NetworkDeviceModels"."DefaultConfigURL", 
                      "NetworkDeviceModels"."MaxCameraCount", "NetworkDeviceModels"."MaxAudioInCount", "NetworkDeviceModels"."MaxAudioOutCount", 
                      "NetworkDeviceModels"."MaxSensorCount", "NetworkDeviceModels"."MaxRelayCount", "NetworkDeviceModels"."SupportsAbsolutePosition", 
                      "NetworkDeviceModels"."SupportsMotionDetection", "NetworkDeviceModels"."SupportsControlFrameRate", 
                      "NetworkDeviceModels"."SupportsControlResolution", "NetworkDeviceModels"."MaxPresetCount", "NetworkDeviceModels"."SupportsMenu", 
                      "NetworkDeviceModels"."SupportsPTZ", "NetworkDeviceModels"."MaxAuxiliaryCount", "NetworkDeviceModels"."SupportsLight", 
                      "NetworkDeviceModels"."SupportsWiper", "NetworkDeviceModels"."MaxPresetTourCount", "NetworkDeviceModels"."MaxPatternTourCount", 
                      "NetworkDeviceModels"."MaxSwingCount", "NetworkDeviceModels"."MaxOtherTourCount"
FROM         "DeviceModels" INNER JOIN
                      "DeviceTypes" ON "DeviceModels"."DeviceTypeID" = "DeviceTypes"."DeviceTypeID" INNER JOIN
                      "Manufacturers" ON "DeviceModels"."ManufacturerID" = "Manufacturers"."ManufacturerID" INNER JOIN
                      "ResourceTexts" ON "DeviceTypes"."DescriptionResID" = "ResourceTexts"."ResourceID" LEFT OUTER JOIN
                      "NetworkDeviceModels" ON "DeviceModels"."DeviceModelID" = "NetworkDeviceModels"."DeviceModelID"
ORDER BY "DeviceType", "Manufctr", "Model";

/*==========================================*/
/* viewEventActionMap    */
/*==========================================*/
CREATE VIEW "viewEventActionMap"
AS
SELECT     "ResourceTexts"."Text" AS "Event", "Devices_1"."DeviceName" AS "SourceDevice", "Schedules"."ScheduleName" AS "SourceSchedule", 
                      "ResourceTexts_1"."Text" AS "Action", "Devices_2"."DeviceName" AS "RecordingCamera", "Devices"."DeviceName" AS "ActionTargetDevice"
FROM         "Devices" AS "Devices_2" INNER JOIN
                      "Cameras" INNER JOIN
                      "RecordingSchedules" ON "Cameras"."CameraID" = "RecordingSchedules"."CameraID" ON 
                      "Devices_2"."DeviceID" = "Cameras"."DeviceID" RIGHT OUTER JOIN
                      "Devices" RIGHT OUTER JOIN
                      "ResourceTexts" INNER JOIN
                      "EventTypes" INNER JOIN
                      "Events" ON "EventTypes"."EventTypeID" = "Events"."EventTypeID" INNER JOIN
                      "EventActions" ON "Events"."EventID" = "EventActions"."EventID" INNER JOIN
                      "ActionItems" ON "EventActions"."ActionItemID" = "ActionItems"."ActionItemID" ON 
                      "ResourceTexts"."ResourceID" = "EventTypes"."EventTypeNameResID" INNER JOIN
                      "ActionTypes" ON "ActionItems"."ActionTypeID" = "ActionTypes"."ActionTypeID" INNER JOIN
                      "ResourceTexts" AS "ResourceTexts_1" ON "ActionTypes"."ActionTypeNameResID" = "ResourceTexts_1"."ResourceID" ON 
                      "Devices"."DeviceID" = "ActionItems"."DeviceID" ON 
                      "RecordingSchedules"."RecordingScheduleID" = "ActionItems"."RecordingScheduleID" LEFT OUTER JOIN
                      "Devices" AS "Devices_1" ON "Events"."DeviceID" = "Devices_1"."DeviceID" LEFT OUTER JOIN
                      "Schedules" ON "Events"."ScheduleID" = "Schedules"."ScheduleID";


/*==========================================*/
/* viewUsers		*/
/*==========================================*/
CREATE VIEW "viewUsers"
AS
SELECT     "UserID", "UserName", "FirstName", "LastName", "Description"
FROM         "Users"
WHERE     ("IsDeleted" = 0);

/*==========================================*/
/* viewEventLogTypes		*/
/*==========================================*/
CREATE VIEW "viewEventLogTypes"
AS
SELECT "EventTypes"."EventTypeID", "EventTypes"."EventGroupID", "EventTypes"."EventTypeNameResID", 
    "EventTypes"."LogByDefault", "EventTypes"."AllowCustomLogSetting", 
	"EventTypes"."FirstSupportingDBVersion", "EventTypes"."IsDeleted", "EventTypes"."InSystemLog", 
	"EventTypes"."InAlarmLog" 
FROM "EventTypes"
	INNER JOIN (SELECT DISTINCT "EventTypeID" FROM "EventLog") el ON "EventTypes"."EventTypeID" = el."EventTypeID";

/*==========================================*/
/*     FUNCTIONS                    */
/*==========================================*/

/* 시간정보에서 '년' 정보를 얻어옴 */
DECLARE EXTERNAL FUNCTION GETYEAR
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'GetYear'
MODULE_NAME 'FirebirdFunction';

/* 시간정보에서 '월' 정보를 얻어옴 */
DECLARE EXTERNAL FUNCTION GETMONTH
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'GetMonth'
MODULE_NAME 'FirebirdFunction';

/* 시간정보에서 '일' 정보를 얻어옴 */
DECLARE EXTERNAL FUNCTION GETDAY
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'GetDay'
MODULE_NAME 'FirebirdFunction';

/* 시간정보에서 '시' 정보를 얻어옴 */
DECLARE EXTERNAL FUNCTION GETHOUR
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'GetHour'
MODULE_NAME 'FirebirdFunction';

/* 시간정보에서 '분' 정보를 얻어옴 */
DECLARE EXTERNAL FUNCTION GETMINUTE
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'GetMinute'
MODULE_NAME 'FirebirdFunction';

/* 시간정보에서 '초' 정보를 얻어옴 */
DECLARE EXTERNAL FUNCTION GETSECOND
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'GetSecond'
MODULE_NAME 'FirebirdFunction';


/* 시간정보에서 '초' 정보를 더함 */
DECLARE EXTERNAL FUNCTION ADDSECOND
Timestamp, int
RETURNS Timestamp
ENTRY_POINT 'addSecond'
MODULE_NAME 'fbudf';

/* 시간정보에서 '분' 정보를 더함 */
DECLARE EXTERNAL FUNCTION ADDMINUTE
Timestamp, int
RETURNS Timestamp 
ENTRY_POINT 'addMinute'
MODULE_NAME 'fbudf';

/* 시간정보에서 '시' 정보를 더함 */
DECLARE EXTERNAL FUNCTION ADDHOUR
Timestamp, int
RETURNS Timestamp 
ENTRY_POINT 'addHour'
MODULE_NAME 'fbudf';

/* 시간정보에서 'yyyymmdd' 포맷으로 날짜 문자열을 얻어옴 */
DECLARE EXTERNAL FUNCTION GETDATESTRING
Timestamp
RETURNS CSTRING(9) FREE_IT 
ENTRY_POINT 'GetDateString'
MODULE_NAME 'FirebirdFunction';