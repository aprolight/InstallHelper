/* Create new table "UsagePurposes".                                                          */
/* "UsagePurposes" : Table of UsagePurposes                                                   */
/* 	"UsagePurposeID" : UsagePurposeID identifies UsagePurpose [SoftwareIdentity(100000)]      */
/* 	"Category" : Category is of UsagePurposes                                                 */
/* 	"UsagePurposeNameResID" : UsagePurposeNameResID is of UsagePurposes                       */
/* 	"IsDeleted" : IsDeleted is of UsagePurposes                                               */  
create table "UsagePurposes" ( 
	"UsagePurposeID" int not null,
	"Category" int null,
	"UsagePurposeNameResID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "UsagePurposes"
	add constraint "UsagePurposes_PK" primary key ("UsagePurposeID")   


go

/* Create new table "EventDataTypes".                                                         */
/* "EventDataTypes" : Table of EventDataTypes                                                 */
/* 	"EventDataTypeID" : EventDataTypeID identifies EventDataTypes                             */
/* 	"EventTypeID" : EventTypeID is of EventDataTypes                                          */
/* 	"DataEntityName" : Releated entity name, if set 'EventData' of 'EventLog' to related entity id. */
/* 	"DataType" : Data type for 'EventData' of 'EventLog'                                      */
/* 	"DataNameResID" : DataNameResID is of EventDataTypes                                      */
/* 	"DataOrder" : The order for 'EventData' of 'EventLog'                                     */  
create table "EventDataTypes" ( 
	"EventDataTypeID" int identity not null,
	"EventTypeID" int not null,
	"DataEntityName" nvarchar(50) null,
	"DataType" int null,
	"DataNameResID" int null,
	"DataOrder" int not null)  

go

alter table "EventDataTypes"
	add constraint "EventDataTypes_PK" primary key ("EventDataTypeID")   


go

/* Create new table "FailureChecks".                                                          */
/* "FailureChecks" : Table of FailureChecks                                                   */
/* 	"FailureCheckID" : FailureCheckID identifies FailureChecks                                */
/* 	"FailureID" : FailureID is of FailureChecks                                               */
/* 	"UserID" : UserID is of FailureChecks                                                     */
/* 	"AlarmStatusID" : AlarmStatusID is of FailureChecks                                       */
/* 	"Notes" : Notes is of FailureChecks                                                       */
/* 	"DateTimeAdded" : DateTimeAdded is of FailureChecks                                       */
/* 	"IsDeleted" : IsDeleted is of FailureChecks                                               */  
create table "FailureChecks" ( 
	"FailureCheckID" int identity not null,
	"FailureID" int null,
	"UserID" int null,
	"AlarmStatusID" int null,
	"Notes" nvarchar(500) null,
	"DateTimeAdded" datetime default 'GetDate()' not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "FailureChecks"
	add constraint "FailureChecks_PK" primary key ("FailureCheckID")   


go

/* Create new table "Failures".                                                               */
/* "Failures" : Table of Failures                                                             */
/* 	"FailureID" : FailureID identifies Failures                                               */
/* 	"DeviceID" : DeviceID is of Failures                                                      */
/* 	"ServerID" : ServerID is of Failures                                                      */
/* 	"DateTimeAdded" : DateTimeAdded is of Failures                                            */
/* 	"DateTimeCompleted" : DateTimeCompleted is of Failures                                    */
/* 	"IsDeleted" : IsDeleted is of Failures                                                    */  
create table "Failures" ( 
	"FailureID" int identity not null,
	"DeviceID" int null,
	"ServerID" int null,
	"DateTimeAdded" datetime not null,
	"DateTimeCompleted" datetime null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Failures"
	add constraint "Failures_PK" primary key ("FailureID")   


go

/* Create new table "HealthCheckFailures".                                                    */
/* "HealthCheckFailures" : Table of HealthCheckFailures [LogTable]                            */
/* 	"HealthCheckFailureID" : HealthCheckFailureID identifies HealthCheckFailures              */
/* 	"RecordingStatusID" : RecordingStatusID is of HealthCheckFailures                         */
/* 	"SignalStatusID" : SignalStatusID is of HealthCheckFailures                               */
/* 	"StorageStatusID" : StorageStatusID is of HealthCheckFailures                             */
/* 	"DateTimeFailure" : DateTimeFailure is of HealthCheckFailures                             */  
create table "HealthCheckFailures" ( 
	"HealthCheckFailureID" int identity not null,
	"RecordingStatusID" int null,
	"SignalStatusID" int null,
	"StorageStatusID" int null,
	"DateTimeFailure" datetime not null)  

go

alter table "HealthCheckFailures"
	add constraint "HealthCheckFailures_PK" primary key ("HealthCheckFailureID")   


go

/* Create new table "ResourceChecks".                                                         */
/* "ResourceChecks" : ResourceChecks [LogTable]                                               */
/* 	"ResourceCheckID" : ResourceCheckID identifies ResourceChecks                             */
/* 	"SystemSpecID" : SystemSpecID is of ResourceChecks                                        */
/* 	"DeviceID" : DeviceID is of ResourceChecks                                                */
/* 	"HostID" : HostID is of ResourceChecks                                                    */
/* 	"CpuUsages" : CpuUsages is of ResourceChecks                                              */
/* 	"MemoryUsages" : MemoryUsages is of ResourceChecks                                        */
/* 	"NetReceiveBps" : NetReceiveBps is of ResourceChecks                                      */
/* 	"NetSendBps" : NetSendBps is of ResourceChecks                                            */
/* 	"ProcCpuUsages" : ProcCpuUsages is of ResourceChecks                                      */
/* 	"ProcMemoryUsages" : ProcMemoryUsages is of ResourceChecks                                */
/* 	"ProcHandles" : ProcHandles is of ResourceChecks                                          */
/* 	"ProcGDIObjects" : ProcGDIObjects is of ResourceChecks                                    */
/* 	"ProcThreads" : ProcThreads is of ResourceChecks                                          */
/* 	"DateTimeChecked" : DateTimeChecked is of ResourceChecks                                  */  
create table "ResourceChecks" ( 
	"ResourceCheckID" int identity not null,
	"SystemSpecID" int null,
	"DeviceID" int null,
	"HostID" int null,
	"CpuUsages" int null,
	"MemoryUsages" bigint null,
	"NetReceiveBps" bigint null,
	"NetSendBps" bigint null,
	"ProcCpuUsages" int null,
	"ProcMemoryUsages" bigint null,
	"ProcHandles" int null,
	"ProcGDIObjects" int null,
	"ProcThreads" int null,
	"DateTimeChecked" datetime not null)  

go

alter table "ResourceChecks"
	add constraint "ResourceChecks_PK" primary key ("ResourceCheckID")   


go

/* Create new table "SystemSpecs".                                                            */
/* "SystemSpecs" : Table of SystemSpecs                                                       */
/* 	"SystemSpecID" : SystemSpecID identifies SystemSpecs                                      */
/* 	"DeviceID" : DeviceID is of SystemSpecs                                                   */
/* 	"HostID" : HostID is of SystemSpecs                                                       */
/* 	"OperatingSystem" : OperatingSystem is of SystemSpecs                                     */
/* 	"ProcessorCount" : ProcessorCount is of SystemSpecs                                       */
/* 	"ProcessorName" : ProcessorName is of SystemSpecs                                         */
/* 	"Memory" : Memory is of SystemSpecs                                                       */
/* 	"GraphicCard" : GraphicCard is of SystemSpecs                                             */
/* 	"NetworkCard" : NetworkCard is of SystemSpecs                                             */
/* 	"Mainboard" : Mainboard is of SystemSpecs                                                 */
/* 	"IsDeleted" : IsDeleted is of SystemSpecs                                                 */  
create table "SystemSpecs" ( 
	"SystemSpecID" int identity not null,
	"DeviceID" int null,
	"HostID" int null,
	"OperatingSystem" varchar(50) null,
	"ProcessorCount" int null,
	"ProcessorName" varchar(50) null,
	"Memory" bigint null,
	"GraphicCard" varchar(50) null,
	"NetworkCard" varchar(50) null,
	"Mainboard" varchar(30) null,
	"IsDeleted" bit default 0 not null)  

go

alter table "SystemSpecs"
	add constraint "SystemSpecs_PK" primary key ("SystemSpecID")   


go

/* Create new table "SignalStatuses".                                                         */
/* "SignalStatuses" : SignalStatuses [LogTable]                                               */
/* 	"SignalStatusID" : SignalStatusID identifies SignalStatuses                               */
/* 	"HealthCheckID" : HealthCheckID is of SignalStatuses                                      */
/* 	"DeviceID" : DeviceID is of SignalStatuses                                                */
/* 	"StatusType" : Enum:SignalStatusType Video                                                */
/* 	"DateTimeChecked" : DateTimeChecked is of SignalStatuses                                  */
/* 	"IsFailed" : IsFailed is of SignalStatuses                                                */
/* 	"StatisticsPeriod" : StatisticsPeriod is of SignalStatuses                                */  
create table "SignalStatuses" ( 
	"SignalStatusID" int identity not null,
	"HealthCheckID" int null,
	"DeviceID" int null,
	"StatusType" int null,
	"DateTimeChecked" datetime not null,
	"IsFailed" bit default 0 not null,
	"StatisticsPeriod" int null)  

go

alter table "SignalStatuses"
	add constraint "SignalStatuses_PK" primary key ("SignalStatusID")   


go

/* Create new table "StorageStatuses".                                                        */
/* "StorageStatuses" : StorageStatuses [LogTable]                                             */
/* 	"StorageStatusID" : StorageStatusID identifies StorageStatuses                            */
/* 	"HealthCheckID" : HealthCheckID is of StorageStatuses                                     */
/* 	"DeviceID" : DeviceID is of StorageStatuses                                               */
/* 	"ServerID" : ServerID is of StorageStatuses                                               */
/* 	"StatusType" : Enum:StorageStatusType Normal, Smart                                       */
/* 	"Path" : Path is of StorageStatuses                                                       */
/* 	"Description" : Description is of StorageStatuses                                         */
/* 	"DateTimeChecked" : DateTimeChecked is of StorageStatuses                                 */
/* 	"IsFailed" : IsFailed is of StorageStatuses                                               */
/* 	"StatisticsPeriod" : StatisticsPeriod is of StorageStatuses                               */  
create table "StorageStatuses" ( 
	"StorageStatusID" int identity not null,
	"HealthCheckID" int null,
	"DeviceID" int null,
	"ServerID" int null,
	"StatusType" int not null,
	"Path" varchar(50) null,
	"Description" nvarchar(128) null,
	"DateTimeChecked" datetime not null,
	"IsFailed" bit default 0 not null,
	"StatisticsPeriod" int null)  

go

alter table "StorageStatuses"
	add constraint "StorageStatuses_PK" primary key ("StorageStatusID")   


go

/* Create new table "RecordingStatuses".                                                      */
/* "RecordingStatuses" : RecordingStatuses [LogTable]                                         */
/* 	"RecordingStatusID" : RecordingStatusID identifies RecordingStatuses                      */
/* 	"HealthCheckID" : HealthCheckID is of RecordingStatuses                                   */
/* 	"DeviceID" : DeviceID is of RecordingStatuses                                             */
/* 	"IsContinuous" : IsContinuous is of RecordingStatuses                                     */
/* 	"IsEvent" : IsEvent is of RecordingStatuses                                               */
/* 	"RecordedStartTime" : RecordedStartTime is of RecordingStatuses                           */
/* 	"RecordedEndTime" : RecordedEndTime is of RecordingStatuses                               */
/* 	"StreamingFps" : StreamingFps is of RecordingStatuses                                     */
/* 	"StreamingBps" : StreamingBps is of RecordingStatuses                                     */
/* 	"WritingFps" : WritingFps is of RecordingStatuses                                         */
/* 	"WritingBps" : WritingBps is of RecordingStatuses                                         */
/* 	"RecordedSize" : RecordedSize is of RecordingStatuses                                     */
/* 	"CodecType" : Enum:RecordingCodecType MJPEG, MPEG4, H264                                  */
/* 	"VideoWidth" : VideoWidth is of RecordingStatuses                                         */
/* 	"VideoHeight" : VideoHeight is of RecordingStatuses                                       */
/* 	"DateTimeChecked" : DateTimeChecked is of RecordingStatuses                               */
/* 	"IsFailed" : IsFailed is of RecordingStatuses                                             */
/* 	"StatisticsPeriod" : StatisticsPeriod is of RecordingStatuses                             */  
create table "RecordingStatuses" ( 
	"RecordingStatusID" int identity not null,
	"HealthCheckID" int null,
	"DeviceID" int null,
	"IsContinuous" bit null,
	"IsEvent" bit null,
	"RecordedStartTime" datetime null,
	"RecordedEndTime" datetime null,
	"StreamingFps" int null,
	"StreamingBps" bigint null,
	"WritingFps" int null,
	"WritingBps" bigint null,
	"RecordedSize" bigint null,
	"CodecType" int null,
	"VideoWidth" int null,
	"VideoHeight" int null,
	"DateTimeChecked" datetime not null,
	"IsFailed" bit default 0 not null,
	"StatisticsPeriod" int null)  

go

alter table "RecordingStatuses"
	add constraint "RecordingStatuses_PK" primary key ("RecordingStatusID")   


go

/* Create new table "HealthChecks".                                                           */
/* "HealthChecks" : HealthChecks [LogTable]                                                   */
/* 	"HealthCheckID" : HealthCheckID identifies HealthChecks                                   */
/* 	"DeviceID" : DeviceID is of HealthChecks                                                  */
/* 	"ServerID" : ServerID is of HealthChecks                                                  */
/* 	"FirmwareVersion" : FirmwareVersion is of HealthChecks                                    */
/* 	"ConnectionFailures" : ConnectionFailures is of HealthChecks                              */
/* 	"RecordingFailures" : RecordingFailures is of HealthChecks                                */
/* 	"StorageFailures" : StorageFailures is of HealthChecks                                    */
/* 	"VideoSignalFailures" : VideoSignalFailures is of HealthChecks                            */
/* 	"SmartFailures" : SmartFailures is of HealthChecks                                        */
/* 	"RecordedStartTime" : RecordedStartTime is of HealthChecks                                */
/* 	"RecordedEndTime" : RecordedEndTime is of HealthChecks                                    */
/* 	"StatisticsPeriod" : StatisticsPeriod is of HealthChecks                                  */
/* 	"CheckStartTime" : CheckStartTime is of HealthChecks                                      */
/* 	"CheckEndTime" : CheckEndTime is of HealthChecks                                          */  
create table "HealthChecks" ( 
	"HealthCheckID" int identity not null,
	"DeviceID" int null,
	"ServerID" int null,
	"FirmwareVersion" varchar(25) null,
	"ConnectionFailures" int null,
	"RecordingFailures" int null,
	"StorageFailures" int null,
	"VideoSignalFailures" int null,
	"SmartFailures" int null,
	"RecordedStartTime" datetime null,
	"RecordedEndTime" datetime null,
	"StatisticsPeriod" int null,
	"CheckStartTime" datetime not null,
	"CheckEndTime" datetime not null)  

go

alter table "HealthChecks"
	add constraint "HealthChecks_PK" primary key ("HealthCheckID")   


go

/* Create new table "AlarmOrgGroups".                                                         */
/* "AlarmOrgGroups" : Table of AlarmOrgGroups                                                 */
/* 	"AlarmOrgGroupID" : AlarmOrgGroupID identifies AlarmOrgGroups                             */
/* 	"AlarmCategoryID" : AlarmCategoryID is of AlarmOrgGroups                                  */
/* 	"SharedFileID" : SharedFileID is of AlarmOrgGroups                                        */
/* 	"CustomGroupID" : CustomGroupID is of AlarmOrgGroups                                      */  
create table "AlarmOrgGroups" ( 
	"AlarmOrgGroupID" int identity not null,
	"AlarmCategoryID" int not null,
	"SharedFileID" int null,
	"CustomGroupID" int not null)  

go

alter table "AlarmOrgGroups"
	add constraint "AlarmOrgGroups_PK" primary key ("AlarmOrgGroupID")   


go

/* Create new table "NetAddressFilters".                                                      */
/* "NetAddressFilters" : Table of NetAddressFilters                                           */
/* 	"NetAddressFilterID" : NetAddressFilterID identifies NetAddressFilters                    */
/* 	"UserID" : UserID is of NetAddressFilters                                                 */
/* 	"RoleID" : RoleID is of NetAddressFilters                                                 */
/* 	"HostTypeID" : HostTypeID is of NetAddressFilters                                         */
/* 	"BeginAddress" : BeginAddress is of NetAddressFilters                                     */
/* 	"EndAddress" : EndAddress is of NetAddressFilters                                         */
/* 	"FilterMethod" : 0=Allow, 1=Deny Enum:FilterMethodType                                    */
/* 	"Order" : Order is of NetAddressFilters                                                   */  
create table "NetAddressFilters" ( 
	"NetAddressFilterID" int identity not null,
	"UserID" int null,
	"RoleID" int null,
	"HostTypeID" int null,
	"BeginAddress" varchar(50) not null,
	"EndAddress" varchar(50) null,
	"FilterMethod" int null,
	"Order" int null)  

go

alter table "NetAddressFilters"
	add constraint "NetAddressFilters_PK" primary key ("NetAddressFilterID")   


go

/* Create new table "PasswordRules".                                                          */
/* "PasswordRules" : Table of PasswordRules                                                   */
/* 	"PasswordRuleID" : PasswordRuleID identifies PasswordRules                                */
/* 	"ExpirationMethod" : ExpirationMethod is of PasswordRules                                 */
/* 	"ExpirationDate" : ExpirationDate is of PasswordRules                                     */
/* 	"ShowExpirationMessage" : ShowExpirationMessage is of PasswordRules                       */
/* 	"ExpirationMessageDay" : ExpirationMessageDay is of PasswordRules                         */
/* 	"ExpirationMessageInterval" : ExpirationMessageInterval is of PasswordRules               */
/* 	"LastUpdated" : LastUpdated is of PasswordRules                                           */
/* 	"ExpirationDuration" : ExpirationDuration is of PasswordRules                             */  
create table "PasswordRules" ( 
	"PasswordRuleID" int identity not null,
	"ExpirationMethod" int not null,
	"ExpirationDate" datetime null,
	"ShowExpirationMessage" bit not null,
	"ExpirationMessageDay" int not null,
	"ExpirationMessageInterval" int not null,
	"LastUpdated" datetime not null,
	"ExpirationDuration" int null)  

go

alter table "PasswordRules"
	add constraint "PasswordRules_PK" primary key ("PasswordRuleID")   


go

/* Create new table "EndPointFiles".                                                          */
/* "EndPointFiles" : EndPointFiles [LogTable]                                                 */
/* 	"EndPointFileID" : EndPointFileID identifies EndPointFiles                                */
/* 	"DeviceID" : DeviceID is of EndPointFiles                                                 */
/* 	"ServerID" : ServerID of InteropServer                                                    */
/* 	"FileKey" : FileKey is of EndPointFiles                                                   */
/* 	"FileName" : FileName is of EndPointFiles                                                 */
/* 	"FileServerPath" : Relative path for root folder of file server                           */
/* 	"FullPath" : Full path of file                                                            */
/* 	"FileSize" : FileSize is of EndPointFiles                                                 */
/* 	"FileDateTime" : FileDateTime is of EndPointFiles                                         */  
create table "EndPointFiles" ( 
	"EndPointFileID" int identity not null,
	"DeviceID" int not null,
	"ServerID" int not null,
	"FileKey" varchar(36) null,
	"FileName" nvarchar(150) not null,
	"FileServerPath" nvarchar(200) not null,
	"FullPath" nvarchar(255) not null,
	"FileSize" int null,
	"FileDateTime" datetime null)  

go

alter table "EndPointFiles"
	add constraint "EndPointFiles_PK" primary key ("EndPointFileID")   


go

/* Create new table "HostTypes".                                                              */
/* "HostTypes" : Table of HostTypes                                                           */
/* 	"HostTypeID" : HostTypeID identifies HostTypes                                            */
/* 	"Name" : Name is of HostTypes                                                             */  
create table "HostTypes" ( 
	"HostTypeID" int not null,
	"Name" nvarchar(80) not null)  

go

alter table "HostTypes"
	add constraint "HostTypes_PK" primary key ("HostTypeID")   


go

/* Create new table "DevicePermissionSettings".                                               */
/* "DevicePermissionSettings" : Table of DevicePermissionSettings                             */
/* 	"DevicePermissionSettingID" : DevicePermissionSettingID identifies DevicePermissionSettings */
/* 	"DevicePermissionID" : DevicePermissionID is of DevicePermissionSettings                  */
/* 	"Attribute" : Attribute is of DevicePermissionSettings                                    */
/* 	"Value" : Value is of DevicePermissionSettings                                            */  
create table "DevicePermissionSettings" ( 
	"DevicePermissionSettingID" int identity not null,
	"DevicePermissionID" int not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null)  

go

alter table "DevicePermissionSettings"
	add constraint "DevicePermissionSettings_PK" primary key ("DevicePermissionSettingID")   


go

/* Create new table "PTZCalibrationZoomSettings".                                             */
/* "PTZCalibrationZoomSettings" : Table of PTZCalibrationZoomSettings                         */
/* 	"PTZCalibrationZoomSettingID" : PTZCalibrationZoomSettingID identifies PTZCalibrationZoomSettings */
/* 	"PTZCalibrationSettingID" : PTZCalibrationSettingID is of PTZCalibrationZoomSettings      */
/* 	"ZoomRatio" : ZoomRatio is of PTZCalibrationZoomSettings                                  */
/* 	"ZoomValue" : ZoomValue is of PTZCalibrationZoomSettings                                  */  
create table "PTZCalibrationZoomSettings" ( 
	"PTZCalibrationZoomSettingID" int identity not null,
	"PTZCalibrationSettingID" int not null,
	"ZoomRatio" int not null,
	"ZoomValue" int not null)  

go

alter table "PTZCalibrationZoomSettings"
	add constraint "PTZCalibrationZoomSettings_PK" primary key ("PTZCalibrationZoomSettingID")   


go

/* Create new table "PTZCalibrationSettings".                                                 */
/* "PTZCalibrationSettings" : Table of PTZCalibrationSettings                                 */
/* 	This is related with one-click move function.                                             */
/* 	"PTZCalibrationSettingID" : PTZCalibrationSettingID identifies PTZCalibrationSettings     */
/* 	"CameraID" : CameraID is of PTZCalibrationSettings                                        */
/* 	"MaxTiltValue" : The maximum position value of ptz from center to left or right.          */
/* 	"MaxPanValue" : The maximum position value of ptz from center to top or bottom.           */
/* 	"ToleranceTilt" : The tolerance value for MaxTiltValue.                                   */
/* 	"TolerancePan" : The tolerance value for MaxPanValue.                                     */  
create table "PTZCalibrationSettings" ( 
	"PTZCalibrationSettingID" int identity not null,
	"CameraID" int not null,
	"MaxTiltValue" int not null,
	"MaxPanValue" int not null,
	"ToleranceTilt" int null,
	"TolerancePan" int null)  

go

alter table "PTZCalibrationSettings"
	add constraint "PTZCalibrationSettings_PK" primary key ("PTZCalibrationSettingID")   


go

/* Create new table "GISBookmarks".                                                           */
/* "GISBookmarks" : Table of GISBookmarks                                                     */
/* 	"GISBookmarkID" : GISBookmarkID identifies GISBookmarks                                   */
/* 	"Name" : Name is of GISBookmarks                                                          */
/* 	"Description" : Description is of GISBookmarks                                            */
/* 	"Latitude" : Latitude is of GISBookmarks                                                  */
/* 	"Longitude" : Longitude is of GISBookmarks                                                */
/* 	"Altitude" : Altitude is of GISBookmarks                                                  */
/* 	"Tilt" : Tilt is of GISBookmarks                                                          */
/* 	"Direct" : Direct is of GISBookmarks                                                      */
/* 	"BookmarkZoomLevel" : BookmarkZoomLevel is of GISBookmarks                                */
/* 	"IsHome" : IsHome is of GISBookmarks                                                      */
/* 	"MarkerID" : MarkerID is of GISBookmarks                                                  */  
create table "GISBookmarks" ( 
	"GISBookmarkID" int identity not null,
	"Name" nvarchar(50) not null,
	"Description" nvarchar(255) null,
	"Latitude" float null,
	"Longitude" float null,
	"Altitude" float null,
	"Tilt" float null,
	"Direct" float null,
	"BookmarkZoomLevel" float null,
	"IsHome" bit null,
	"MarkerID" int null)  

go

alter table "GISBookmarks"
	add constraint "GISBookmarks_PK" primary key ("GISBookmarkID")   


go

/* Create new table "FacilityTypes".                                                          */
/* "FacilityTypes" : Table of FacilityTypes                                                   */
/* 	"FacilityTypeID" : FacilityTypeID identifies FacilityTypes                                */
/* 	"FacilityTypeName" : FacilityTypeName is of FacilityTypes                                 */
/* 	"FacilityIconUrl" : FacilityIconUrl is of FacilityTypes                                   */  
create table "FacilityTypes" ( 
	"FacilityTypeID" int identity not null,
	"FacilityTypeName" nvarchar(255) not null,
	"FacilityIconUrl" nvarchar(255) null)  

go

alter table "FacilityTypes"
	add constraint "FacilityTypes_PK" primary key ("FacilityTypeID")   


go

/* Create new table "FacilityAttributes".                                                     */
/* "FacilityAttributes" : Table of FacilityAttributes                                         */
/* 	"FacilityAttributesID" : FacilityAttributesID identifies FacilityAttributes               */
/* 	"AttributeTitle" : AttributeTitle is of FacilityAttributes                                */
/* 	"IsRepresentation" : IsRepresentation is of FacilityAttributes                            */
/* 	"FacilityTypeID" : FacilityTypeID is of FacilityAttributes                                */  
create table "FacilityAttributes" ( 
	"FacilityAttributesID" int identity not null,
	"AttributeTitle" nvarchar(255) not null,
	"IsRepresentation" bit null,
	"FacilityTypeID" int null)  

go

alter table "FacilityAttributes"
	add constraint "FacilityAttributes_PK" primary key ("FacilityAttributesID")   


go

/* Create new table "FacilityValues".                                                         */
/* "FacilityValues" : Table of FacilityValues                                                 */
/* 	"FacilityValueID" : FacilityValueID identifies FacilityValues                             */
/* 	"Value" : Value is of FacilityValues                                                      */
/* 	"FacilityAttributesID" : FacilityAttributesID is of FacilityValues                        */
/* 	"MarkerID" : MarkerID is of FacilityValues                                                */  
create table "FacilityValues" ( 
	"FacilityValueID" int identity not null,
	"Value" nvarchar(255) not null,
	"FacilityAttributesID" int null,
	"MarkerID" int null)  

go

alter table "FacilityValues"
	add constraint "FacilityValues_PK" primary key ("FacilityValueID")   


go

/* Create new table "TrackingCameraConnections".                                              */
/* "TrackingCameraConnections" : Table of TrackingCameraConnections                           */
/* 	"TrackingCameraConnectionID" : TrackingCameraConnectionID identifies TrackingCameraConnections */
/* 	"TrackingCameraID" : TrackingCameraID is of TrackingCameraConnections                     */
/* 	"FixedCameraID" : FixedCameraID is of TrackingCameraConnections                           */  
create table "TrackingCameraConnections" ( 
	"TrackingCameraConnectionID" int identity not null,
	"TrackingCameraID" int not null,
	"FixedCameraID" int not null)  

go

alter table "TrackingCameraConnections"
	add constraint "TrackingCameraConnections_PK" primary key ("TrackingCameraConnectionID")   


go

/* Create new table "FailoverHistorys".                                                       */
/* "FailoverHistorys" : FailoverHistorys [LogTable]                                           */
/* 	"FailoverHistoryID" : FailoverHistoryID identifies FailoverHistorys                       */
/* 	"FailoverStartTime" : 해당 카메라 장애가 발생한 시점                                                   */
/* 	"FailoverStopTime" : 해당 카메 장애가 복구된 시점                                                     */
/* 	"FailoverStartReason" : Enum:FailStartReasonType Unspecific, Software, Hardware, Storage  */
/* 	"FailoverStopReason" : Enum:FailStopReasonType Unknown, Recovered, AbnormalDisconnected, Stopped */
/* 	"FailoverActiveTime" : 실제 Fail-over 가 Active 된 시점                                         */
/* 	"FailedSSID" : FailedSSID is of FailoverHistorys                                          */
/* 	"FailoverSSID" : FailoverSSID is of FailoverHistorys                                      */
/* 	"Description" : Description is of FailoverHistorys                                        */  
create table "FailoverHistorys" ( 
	"FailoverHistoryID" int identity not null,
	"FailoverStartTime" datetime null,
	"FailoverStopTime" datetime null,
	"FailoverStartReason" int null,
	"FailoverStopReason" int null,
	"FailoverActiveTime" datetime null,
	"FailedSSID" int not null,
	"FailoverSSID" int not null,
	"Description" nvarchar(255) null)  

go

alter table "FailoverHistorys"
	add constraint "FailoverHistorys_PK" primary key ("FailoverHistoryID")   


go

/* Create new table "FailoverDevices".                                                        */
/* "FailoverDevices" : FailoverDevices [LogTable]                                             */
/* 	"FailoverDeviceID" : FailoverDeviceID identifies FailoverDevices                          */
/* 	"DeviceID" : DeviceID is of FailoverDevices                                               */
/* 	"FailoverHistoryID" : FailoverHistoryID is of FailoverDevices                             */  
create table "FailoverDevices" ( 
	"FailoverDeviceID" int identity not null,
	"DeviceID" int null,
	"FailoverHistoryID" int null)  

go

alter table "FailoverDevices"
	add constraint "FailoverDevices_PK" primary key ("FailoverDeviceID")   


go

/* Create new table "DeviceSettings".                                                         */
/* "DeviceSettings" : Table of DeviceSettings                                                 */
/* 	"DeviceSettingID" : DeviceSettingID identifies DeviceSettings                             */
/* 	"DeviceID" : DeviceID is of DeviceSettings                                                */
/* 	"Attribute" : Attribute is of DeviceSettings                                              */
/* 	"Value" : Value is of DeviceSettings                                                      */  
create table "DeviceSettings" ( 
	"DeviceSettingID" int identity not null,
	"DeviceID" int not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null)  

go

alter table "DeviceSettings"
	add constraint "DeviceSettings_PK" primary key ("DeviceSettingID")   


go

/* Create new table "Licenses".                                                               */
/* "Licenses" : Table of Licenses                                                             */
/* 	"LicenseID" : LicenseID identifies Licenses                                               */
/* 	"LicenseKey" : LicenseKey is of Licenses                                                  */
/* 	"SystemKey" : SystemKey is of Licenses                                                    */
/* 	"ServerID" : ServerID is of Licenses                                                      */
/* 	"LicenseType" :  Specifies the type of license type to use: TRIUMi, UDPVCAPCOpen  Enum:LicenseType */
/* 	"DateTimeAdded" : Date/time device was added to DB. Auto-set by server. [ReadOnly]        */
/* 	"IsDeleted" : IsDeleted is of Licenses                                                    */  
create table "Licenses" ( 
	"LicenseID" int identity not null,
	"LicenseKey" nvarchar(max) not null,
	"SystemKey" nvarchar(255) not null,
	"ServerID" int null,
	"LicenseType" int null,
	"DateTimeAdded" datetime default GetDate() not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Licenses"
	add constraint "Licenses_PK" primary key ("LicenseID")   


go

/* Create new table "CameraListItems".                                                        */
/* "CameraListItems" : Table of CameraListItems                                               */
/* 	"CameraListItemID" : CameraListItemID identifies CameraListItems                          */
/* 	"CameraListID" : CameraListID is of CameraListItems                                       */
/* 	"CameraID" : CameraID is of CameraListItems                                               */  
create table "CameraListItems" ( 
	"CameraListItemID" int identity not null,
	"CameraListID" int null,
	"CameraID" int null)  

go

alter table "CameraListItems"
	add constraint "CameraListItems_PK" primary key ("CameraListItemID")   


go

/* Create new table "CameraLists".                                                            */
/* "CameraLists" : Table of CameraLists                                                       */
/* 	"CameraListID" : CameraListID identifies CameraLists                                      */
/* 	"Description" : Description is of CameraLists                                             */  
create table "CameraLists" ( 
	"CameraListID" int identity not null,
	"Description" nvarchar(100) null)  

go

alter table "CameraLists"
	add constraint "CameraLists_PK" primary key ("CameraListID")   


go

/* Create new table "EventInputDevices".                                                      */
/* "EventInputDevices" : Table of EventInputDevices                                           */
/* 	"EventInputDeviceID" : EventInputDeviceID identifies EventInputDevices                    */
/* 	"CameraID" : CameraID is of EventInputDevices                                             */
/* 	"DeviceID" : The device ID of the sensor or camera that will serve as an event input for the specified camera. */  
create table "EventInputDevices" ( 
	"EventInputDeviceID" int identity not null,
	"CameraID" int not null,
	"DeviceID" int not null)  

go

alter table "EventInputDevices"
	add constraint "EventInputDevices_PK" primary key ("EventInputDeviceID")   


go

/* Create new table "MacroPermissions".                                                       */
/* "MacroPermissions" : Table of MacroPermissions                                             */
/* 	"MacroPermissionID" : MacroPermissionID identifies MacroPermissions                       */
/* 	"MacroID" : MacroID is of MacroPermissions                                                */
/* 	"RoleID" : RoleID is of MacroPermissions                                                  */
/* 	"UserID" : UserID is of MacroPermissions                                                  */
/* 	"PermissionID" : PermissionID is of MacroPermissions                                      */
/* 	"PrivLevel" : PrivLevel is of MacroPermissions                                            */  
create table "MacroPermissions" ( 
	"MacroPermissionID" int identity not null,
	"MacroID" int null,
	"RoleID" int null,
	"UserID" int null,
	"PermissionID" int null,
	"PrivLevel" int default 0 not null)  

go

alter table "MacroPermissions"
	add constraint "MacroPermissions_PK" primary key ("MacroPermissionID")   


go

/* Create new table "SitePermissions".                                                        */
/* "SitePermissions" : Table of SitePermissions                                               */
/* 	"SitePermissionID" : SitePermissionID identifies SitePermissions                          */
/* 	"SiteID" : SiteID is of SitePermissions                                                   */
/* 	"RoleID" : RoleID is of SitePermissions                                                   */
/* 	"UserID" : UserID is of SitePermissions                                                   */
/* 	"PermissionID" : PermissionID is of SitePermissions                                       */
/* 	"PrivLevel" : 0 = Undefined, 1=Allowed, 255=Denied  (other values may be used for access level resolution for certain permission types  */  
create table "SitePermissions" ( 
	"SitePermissionID" int identity not null,
	"SiteID" int null,
	"RoleID" int null,
	"UserID" int null,
	"PermissionID" int null,
	"PrivLevel" int default 0 not null)  

go

alter table "SitePermissions"
	add constraint "SitePermissions_PK" primary key ("SitePermissionID")   


go

/* Create new table "MacroCommands".                                                          */
/* "MacroCommands" : Table of MacroCommands                                                   */
/* 	"MacroCommandID" : MacroCommandID identifies MacroCommands                                */
/* 	"MacroID" : MacroID is of MacroCommands                                                   */
/* 	"ActionItemID" : ActionItemID is of MacroCommands                                         */
/* 	"MacroCommandType" : 0 - Execute Action 1 - Wait  Enum:MacroCommandType                   */
/* 	"CommandParams" : Optional. Example uses:  If command is Wait, this is the wait time in seconds, if command is Goto, this is the target MacroCommandID */
/* 	"NextCommandID" : NextCommandID is of MacroCommands                                       */
/* 	"JumpCommandID" : For conditional processing ... not for version 1.                       */  
create table "MacroCommands" ( 
	"MacroCommandID" int identity not null,
	"MacroID" int null,
	"ActionItemID" int null,
	"MacroCommandType" int default 0 not null,
	"CommandParams" nvarchar(max) null,
	"NextCommandID" int null,
	"JumpCommandID" int null)  

go

alter table "MacroCommands"
	add constraint "MacroCommands_PK" primary key ("MacroCommandID")   


go

/* Create new table "PresetTours".                                                            */
/* "PresetTours" : Only used for software preset tour definition (sequence between presets).  */
/* 	"PresetTourID" : PresetTourID identifies PresetTours                                      */
/* 	"CameraItemID" : CameraItemID is of PresetTours                                           */
/* 	"TourID" : TourID is of PresetTours                                                       */
/* 	"DwellTime" : DwellTime is of PresetTours (default time 5 secs)                           */
/* 	"Sequence" : Sequence is of PresetTours                                                   */  
create table "PresetTours" ( 
	"PresetTourID" int identity not null,
	"CameraItemID" int not null,
	"TourID" int not null,
	"DwellTime" int default 5 not null,
	"Sequence" int default 0 not null)  

go

alter table "PresetTours"
	add constraint "PresetTours_PK" primary key ("PresetTourID")   


go

/* Create new table "Tours".                                                                  */
/* "Tours" : Table of Tours                                                                   */
/* 	"TourID" : TourID identifies Tours                                                        */
/* 	"CameraID" : CameraID is of Tours                                                         */
/* 	"TourName" : TourName is of Tours                                                         */
/* 	"TourType" : 0=Software 1=Hardware 2=Pattern 3=Swing 4=Other (device-specific)  Enum:TourType */
/* 	"TourNumber" : Identifies hardware tour ID (only if TourType = 1)                         */
/* 	"TourOrder" : Determines the order of presentation in the GUI                             */  
create table "Tours" ( 
	"TourID" int identity not null,
	"CameraID" int null,
	"TourName" nvarchar(100) null,
	"TourType" int default 0 not null,
	"TourNumber" int default 0 not null,
	"TourOrder" int default 0 not null)  

go

alter table "Tours"
	add constraint "Tours_PK" primary key ("TourID")   


go

/* Create new table "CameraItems".                                                            */
/* "CameraItems" : CameraItems is used for Presets and other named items (such as Aux devices) associated with a camera. */
/* 	"CameraItemID" : CameraItemID identifies CameraItems                                      */
/* 	"CameraID" : CameraID is of CameraItems                                                   */
/* 	"Name" : Name is of CameraItems                                                           */
/* 	"Number" : Number is of CameraItems                                                       */
/* 	"Sequence" : Sequence is of CameraItems                                                   */
/* 	"ItemType" : 0 = Preset  1= Auxiliary   Enum:CameraItemType                               */
/* 	"Rotation" : Rotation is of CameraItems                                                   */  
create table "CameraItems" ( 
	"CameraItemID" int identity not null,
	"CameraID" int null,
	"Name" nvarchar(100) null,
	"Number" int default 0 not null,
	"Sequence" int default 0 not null,
	"ItemType" int default 0 not null,
	"Rotation" int null)  

go

alter table "CameraItems"
	add constraint "CameraItems_PK" primary key ("CameraItemID")   


go

/* Create new table "Sequence_x_Views".                                                       */
/* "Sequence_x_Views" : Table of Sequence_x_Views                                             */
/* 	"Sequence_x_ViewID" : Sequence_x_ViewID identifies Sequence_x_Views                       */
/* 	"SequenceID" : SequenceID is of Sequence_x_Views                                          */
/* 	"ViewLayoutID" : ViewLayoutID is of Sequence_x_Views                                      */
/* 	"CameraID" : CameraID is of Sequence_x_Views                                              */
/* 	"MapID" : MapID is of Sequence_x_Views                                                    */
/* 	"SharedFileID" : SharedFileID is of Sequence_x_Views                                      */
/* 	"ItemOrder" : Identifies the order in which sequence items will be displayed              */
/* 	"DwellTime" : The time, in seconds, the sequence item is displayed on the screen          */
/* 	"ViewSingle" : If true, tile assignments in a view will be displayed one at a time.       */  
create table "Sequence_x_Views" ( 
	"Sequence_x_ViewID" int identity not null,
	"SequenceID" int null,
	"ViewLayoutID" int null,
	"CameraID" int null,
	"MapID" int null,
	"SharedFileID" int null,
	"ItemOrder" int null,
	"DwellTime" int null,
	"ViewSingle" bit default 0 not null)  

go

alter table "Sequence_x_Views"
	add constraint "Sequence_x_Views_PK" primary key ("Sequence_x_ViewID")   


go

/* Create new table "Sequences".                                                              */
/* "Sequences" : Table of Sequences                                                           */
/* 	"SequenceID" : SequenceID identifies Sequences                                            */
/* 	"Description" : Description is of Sequences                                               */
/* 	"UserID" : UserID is of Sequences                                                         */  
create table "Sequences" ( 
	"SequenceID" int identity not null,
	"Description" nvarchar(50) not null,
	"UserID" int null)  

go

alter table "Sequences"
	add constraint "Sequences_PK" primary key ("SequenceID")   


go

/* Create new table "AlarmCategories".                                                        */
/* "AlarmCategories" : Table of AlarmCategories                                               */
/* 	"AlarmCategoryID" : AlarmCategoryID identifies AlarmCategories [SoftwareIdentity(100000)] */
/* 	"CategoryNameResID" : CategoryNameResID is of AlarmCategories                             */
/* 	"IsDeleted" : IsDeleted is of AlarmCategories                                             */
/* 	"GroupName" : GroupName is of AlarmCategories                                             */  
create table "AlarmCategories" ( 
	"AlarmCategoryID" int not null,
	"CategoryNameResID" int not null,
	"IsDeleted" bit default 0 not null,
	"GroupName" nvarchar(50) null)  

go

alter table "AlarmCategories"
	add constraint "AlarmCategories_PK" primary key ("AlarmCategoryID")   


go

/* Create new table "AlarmStatus".                                                            */
/* "AlarmStatus" : Table of AlarmStatus                                                       */
/* 	"AlarmStatusID" : AlarmStatusID identifies AlarmStatus                                    */
/* 	"AlarmStatusNameResID" : AlarmStatusNameResID is of AlarmStatus                           */
/* 	"IsDeleted" : IsDeleted is of AlarmStatus                                                 */  
create table "AlarmStatus" ( 
	"AlarmStatusID" int not null,
	"AlarmStatusNameResID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "AlarmStatus"
	add constraint "AlarmStatus_PK" primary key ("AlarmStatusID")   


go

/* Create new table "AlarmPriorities".                                                        */
/* "AlarmPriorities" : Table of AlarmPriorities                                               */
/* 	"AlarmPriorityID" :  0 - Low 1 - Medium 2 - High                                          */
/* 	"AlarmPriorityNameResID" : AlarmPriorityNameResID is of AlarmPriorities                   */
/* 	"IsDeleted" : IsDeleted is of AlarmPriorities                                             */  
create table "AlarmPriorities" ( 
	"AlarmPriorityID" int not null,
	"AlarmPriorityNameResID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "AlarmPriorities"
	add constraint "AlarmPriorities_PK" primary key ("AlarmPriorityID")   


go

/* Create new table "ActionsTaken".                                                           */
/* "ActionsTaken" : Table of ActionsTaken                                                     */
/* 	"ActionTakenID" : ActionTakenID identifies ActionsTaken [SoftwareIdentity(100000)]        */
/* 	"ActionTakenNameResID" : ActionTakenNameResID is of ActionsTaken                          */
/* 	"IsDeleted" : IsDeleted is of ActionsTaken                                                */
/* 	"TakenType" : 0=Undefined, 1=Mistaken, 2=Incident Enum:ActionTakenType                    */  
create table "ActionsTaken" ( 
	"ActionTakenID" int not null,
	"ActionTakenNameResID" int not null,
	"IsDeleted" bit default 0 not null,
	"TakenType" int null)  

go

alter table "ActionsTaken"
	add constraint "ActionsTaken_PK" primary key ("ActionTakenID")   


go

/* Create new table "ProximityCameras".                                                       */
/* "ProximityCameras" : Table of ProximityCameras                                             */
/* 	"ProximityCameraID" : ProximityCameraID identifies ProximityCameras                       */
/* 	"CameraID" : CameraID is of ProximityCameras                                              */
/* 	"RelatedCameraID" : RelatedCameraID is of ProximityCameras                                */
/* 	"Sequence" : Determines the order in which the cameras appear in the tiles in the Proximity Camera view. */
/* 	"ProximityCameraType" : 0=Normal 1=GIS 2=GISGroup Enum:ProximityCameraTypeEnum            */  
create table "ProximityCameras" ( 
	"ProximityCameraID" int identity not null,
	"CameraID" int not null,
	"RelatedCameraID" int not null,
	"Sequence" int default 0 not null,
	"ProximityCameraType" int default 0 null)  

go

alter table "ProximityCameras"
	add constraint "ProximityCameras_PK" primary key ("ProximityCameraID")   


go

/* Create new table "Filters".                                                                */
/* "Filters" : Table of Filters                                                               */
/* 	"FilterID" : FilterID identifies Filters                                                  */
/* 	"Description" : Description is of Filters                                                 */
/* 	"FilterData" : XML for serialized filter settings.                                        */
/* 	"UserID" : Optional. If specified, indicates that the Filter is private (user-specific).  */  
create table "Filters" ( 
	"FilterID" int identity not null,
	"Description" nvarchar(100) not null,
	"FilterData" nvarchar(max) not null,
	"UserID" int null)  

go

alter table "Filters"
	add constraint "Filters_PK" primary key ("FilterID")   


go

/* Create new table "WeekCoverages".                                                          */
/* "WeekCoverages" : Used to define which days of the week a schedule pattern applies to. Only used for  */
/* 	"WeekCoverageID" : WeekCoverageID identifies WeekCoverages                                */
/* 	"ScheduleID" : ScheduleID is of WeekCoverages                                             */
/* 	"Weekday" : Enum:WeekdayEnum (Sun,Mon,Tue...).                                            */
/* 	"IsAdvanced" : Used to indicate if the WeekCoverages belong to the Advanced defintion for the related scehdule. */  
create table "WeekCoverages" ( 
	"WeekCoverageID" int identity not null,
	"ScheduleID" int not null,
	"Weekday" int not null,
	"IsAdvanced" bit default 0 not null)  

go

alter table "WeekCoverages"
	add constraint "WeekCoverages_PK" primary key ("WeekCoverageID")   


go

/* Create new table "SharedFiles".                                                            */
/* "SharedFiles" : Table of SharedFiles                                                       */
/* 	"SharedFileID" : SharedFileID identifies SharedFiles                                      */
/* 	"UserID" : UserID is of SharedFiles                                                       */
/* 	"SharedType" : 0=Undefined, 1=EventAction, 2=Map, 4=Private Enum:SharedTypeEnum           */
/* 	"FileName" : The file name, including extension, without the path.                        */
/* 	"ManagedFileName" : ManagedFileName is of SharedFiles                                     */
/* 	"RelativeFolderPath" : The path of the parent folder, relative to the root shared files folder. */
/* 	"FileType" : Enum:FileType Enum for possible file types.                                  */
/* 	"FileSize" : FileSize is of SharedFiles                                                   */
/* 	"Hash" : Hash is of SharedFiles                                                           */  
create table "SharedFiles" ( 
	"SharedFileID" int identity not null,
	"UserID" int null,
	"SharedType" int null,
	"FileName" nvarchar(150) not null,
	"ManagedFileName" varchar(32) null,
	"RelativeFolderPath" nvarchar(200) null,
	"FileType" int null,
	"FileSize" int null,
	"Hash" varchar(32) null)  

go

alter table "SharedFiles"
	add constraint "SharedFiles_PK" primary key ("SharedFileID")   


go

/* Create new table "MonitoredProcs".                                                         */
/* "MonitoredProcs" : MonitoredProcesses contains information about external executables which we want to monitor with the Watchdog system. */
/* 	"MonitoredProcID" : MonitoredProcID identifies MonitoredProcs                             */
/* 	"Host" : IP or Hostname of machine on which we want to monitor the process (the machine most be running the Watchdog service). */
/* 	"FilePath" : Full path to the executable that we want to ensure is running.               */
/* 	"CmdLineArgs" : Optional cmd line args to pass to the executable when attempting to restart it. */  
create table "MonitoredProcs" ( 
	"MonitoredProcID" int identity not null,
	"Host" nvarchar(50) not null,
	"FilePath" nvarchar(255) not null,
	"CmdLineArgs" nvarchar(255) null)  

go

alter table "MonitoredProcs"
	add constraint "MonitoredProcs_PK" primary key ("MonitoredProcID")   


go

/* Create new table "SSFailovers".                                                            */
/* "SSFailovers" : Table of SSFailovers                                                       */
/* 	"SSFailoverID" : SSFailoverID identifies SSFailovers                                      */
/* 	"StorageServerID" : StorageServerID identifies which SS this failover definition is for (used for all devices for which failover is not specified). */
/* 	"DeviceID" : DeviceID identifies which Device this failover definition is for.            */
/* 	"FailoverSSID" : The StorageServerID of the server to which the failover will transfer responsibility. */
/* 	"Sequence" : If more than one failover is defined for the same StorageServer or Device, identifies the order in which they will be processed. */  
create table "SSFailovers" ( 
	"SSFailoverID" int identity not null,
	"StorageServerID" int null,
	"DeviceID" int null,
	"FailoverSSID" int null,
	"Sequence" int null)  

go

alter table "SSFailovers"
	add constraint "SSFailovers_PK" primary key ("SSFailoverID")   


go

/* Create new table "RecordingSpaces".                                                        */
/* "RecordingSpaces" : Table of RecordingSpaces                                               */
/* 	"RecordingSpaceID" : RecordingSpaceID identifies RecordingSpaces                          */
/* 	"RecordingStorageID" : RecordingStorageID is of RecordingSpaces                           */
/* 	"Usage" : 0=Recording, 1=Backup, 2=Failover, 3=Image Enum:RecordingSpaceUsage             */
/* 	"RecordingQuota" : RecordingQuota is of RecordingSpaces                                   */
/* 	"DeviceSelectionType" : 0=All Devices, 1=All Except selected device, 2=Selected device only Enum:DeviceSelectionType */
/* 	"Description" : Description is of RecordingSpaces                                         */  
create table "RecordingSpaces" ( 
	"RecordingSpaceID" int identity not null,
	"RecordingStorageID" int not null,
	"Usage" int not null,
	"RecordingQuota" int not null,
	"DeviceSelectionType" int not null,
	"Description" nvarchar(50) null)  

go

alter table "RecordingSpaces"
	add constraint "RecordingSpaces_PK" primary key ("RecordingSpaceID")   


go

/* Create new table "Alarms".                                                                 */
/* "Alarms" : Used to define Alarms. Alarm instances will be in the ActionLog/AlarmCheck tables. */
/* 	"AlarmID" : AlarmID identifies Alarms                                                     */
/* 	"AlarmName" : The display name for the Alarm                                              */
/* 	"CameraID" : CameraID is of Alarms                                                        */
/* 	"Instructions" : Instructions is of Alarms                                                */
/* 	"AlarmPriorityID" : The default priority assigned to instances of this alarm.             */
/* 	"AlarmCategoryID" : The default category to assign to instances of this alarm.            */
/* 	"IsDeleted" : IsDeleted is of Alarms                                                      */  
create table "Alarms" ( 
	"AlarmID" int identity not null,
	"AlarmName" nvarchar(40) not null,
	"CameraID" int null,
	"Instructions" nvarchar(500) null,
	"AlarmPriorityID" int default (0) not null,
	"AlarmCategoryID" int null,
	"IsDeleted" bit not null)  

go

alter table "Alarms"
	add constraint "Alarms_PK" primary key ("AlarmID")   


go

/* Create new table "Macros".                                                                 */
/* "Macros" : Table of Macros                                                                 */
/* 	"MacroID" : MacroID identifies Macros                                                     */
/* 	"MacroName" : MacroName is of Macros                                                      */
/* 	"MacroDescription" : MacroDescription is of Macros                                        */
/* 	"FirstCommandID" : FirstCommandID is of Macros                                            */
/* 	"UserID" : Identifies custom macro creator. Used for private macros created by user in Remote Client (after ver 1) */
/* 	"IsDeleted" : IsDeleted is of Macros                                                      */  
create table "Macros" ( 
	"MacroID" int identity not null,
	"MacroName" nvarchar(40) null,
	"MacroDescription" nvarchar(80) null,
	"FirstCommandID" int null,
	"UserID" int null,
	"IsDeleted" bit not null)  

go

alter table "Macros"
	add constraint "Macros_PK" primary key ("MacroID")   


go

/* Create new table "Permissions".                                                            */
/* "Permissions" : Table of Permissions                                                       */
/* 	"PermissionID" : PermissionID identifies Permissions                                      */
/* 	"Name" : Single-word name used to identify the permission in code                         */
/* 	"DisplayNameResID" : FK to Resource table, which will provide localized naming for the permissions */
/* 	"DescriptionResID" : FK to Resource table, which will provide a localized description of what this permission is for. */
/* 	"PermissionStyle" : 0=AllowDeny, 1=AccessLevel, 2=AllowIfNotDefined   Enum:PermissionStyle     If 0, PrivLevel is 0 for Deny and 1 for Allow. If 1, PrivLevel is a value from 1-10 indicating level of authority (1 is highest). If 2, same as 0, but implicit Allow if there are no permissions defined for the target. */
/* 	"PermissionType" : 0=System, 1=Site, 2=Device 3=Macro 4=ViewLayout 5=NetworkDevice Enum:PermissionTypeEnum  */
/* 	"DefaultPrivLevel" : The default value to use for this permission.                        */
/* 	"IsListPermission" : Indicates if the permission should appear in the GUI list for the corresponding permission type. */
/* 	"IsEditableByDefault" : IsEditableByDefault is of Permissions                             */  
create table "Permissions" ( 
	"PermissionID" int not null,
	"Name" nvarchar(30) not null,
	"DisplayNameResID" int null,
	"DescriptionResID" int null,
	"PermissionStyle" int default 0 not null,
	"PermissionType" int default 0 not null,
	"DefaultPrivLevel" int default 0 not null,
	"IsListPermission" bit default 1 not null,
	"IsEditableByDefault" bit default 0 not null)  

go

alter table "Permissions"
	add constraint "Permissions_PK" primary key ("PermissionID")   


go

/* Create new table "NetworkDrives".                                                          */
/* "NetworkDrives" : Table of NetworkDrives                                                   */
/* 	"NetworkDriveID" : NetworkDriveID identifies NetworkDrives                                */
/* 	"StorageServerID" : StorageServerID is of NetworkDrives                                   */
/* 	"Description" : Description is of NetworkDrives                                           */
/* 	"NetworkPath" : NetworkPath is of NetworkDrives                                           */
/* 	"NetworkLogin" : NetworkLogin is of NetworkDrives                                         */
/* 	"NetworkPassword" : Encrypted password used to access the network drive.                  */  
create table "NetworkDrives" ( 
	"NetworkDriveID" int identity not null,
	"StorageServerID" int not null,
	"Description" nvarchar(100) null,
	"NetworkPath" nvarchar(255) null,
	"NetworkLogin" nvarchar(30) null,
	"NetworkPassword" varchar(64) null)  

go

alter table "NetworkDrives"
	add constraint "NetworkDrives_PK" primary key ("NetworkDriveID")   


go

/* Create new table "Bookmarks".                                                              */
/* "Bookmarks" : Table of Bookmarks                                                           */
/* 	"BookmarkID" : BookmarkID identifies Bookmarks                                            */
/* 	"UserID" : UserID is of Bookmarks                                                         */
/* 	"CameraID" : For single-camera bookmarks created in Live, the FK to the camera            */
/* 	"Name" : Name is of Bookmarks                                                             */
/* 	"Description" : Description is of Bookmarks                                               */
/* 	"StartTime" : StartTime is of Bookmarks                                                   */
/* 	"EndTime" : EndTime is of Bookmarks                                                       */
/* 	"IsProtected" : IsProtected is of Bookmarks                                               */  
create table "Bookmarks" ( 
	"BookmarkID" int identity not null,
	"UserID" int null,
	"CameraID" int null,
	"Name" nvarchar(30) not null,
	"Description" nvarchar(100) null,
	"StartTime" datetime not null,
	"EndTime" datetime not null,
	"IsProtected" bit default 0 not null)  

go

alter table "Bookmarks"
	add constraint "Bookmarks_PK" primary key ("BookmarkID")   


go

/* Create new table "EmergencyGroupAgents".                                                   */
/* "EmergencyGroupAgents" : Table of EmergencyGroupAgents                                     */
/* 	"EmergencyGroupAgentID" : EmergencyGroupAgentID identifies EmergencyGroupAgents           */
/* 	"EmergencyGroupID" : EmergencyGroupID is of EmergencyGroupAgents                          */
/* 	"EmergencyAgentID" : EmergencyAgentID is of EmergencyGroupAgents                          */  
create table "EmergencyGroupAgents" ( 
	"EmergencyGroupAgentID" int identity not null,
	"EmergencyGroupID" int null,
	"EmergencyAgentID" int null)  

go

alter table "EmergencyGroupAgents"
	add constraint "EmergencyGroupAgents_PK" primary key ("EmergencyGroupAgentID")   


go

/* Create new table "EmergencyAgents".                                                        */
/* "EmergencyAgents" : Table of EmergencyAgents                                               */
/* 	"EmergencyAgentID" : EmergencyAgentID identifies EmergencyAgents                          */
/* 	"Description" : Description is of EmergencyAgents                                         */
/* 	"HostName" : HostName is of EmergencyAgents                                               */
/* 	"IP" : IP is of EmergencyAgents                                                           */
/* 	"Port" : Port is of EmergencyAgents                                                       */  
create table "EmergencyAgents" ( 
	"EmergencyAgentID" int identity not null,
	"Description" nvarchar(100) null,
	"HostName" nvarchar(50) null,
	"IP" varchar(15) null,
	"Port" int null)  

go

alter table "EmergencyAgents"
	add constraint "EmergencyAgents_PK" primary key ("EmergencyAgentID")   


go

/* Create new table "RecordingDevices".                                                       */
/* "RecordingDevices" : Table of RecordingDevices                                             */
/* 	"RecordingDeviceID" : RecordingDeviceID identifies RecordingDevices                       */
/* 	"DeviceID" : DeviceID is of RecordingDevices                                              */
/* 	"RecordingSpaceID" : RecordingSpaceID is of RecordingDevices                              */  
create table "RecordingDevices" ( 
	"RecordingDeviceID" int identity not null,
	"DeviceID" int not null,
	"RecordingSpaceID" int not null)  

go

alter table "RecordingDevices"
	add constraint "RecordingDevices_PK" primary key ("RecordingDeviceID")   


go

/* Create new table "RecordingStorages".                                                      */
/* "RecordingStorages" : Table of RecordingStorages                                           */
/* 	"RecordingStorageID" : RecordingStorageID identifies RecordingStorages                    */
/* 	"StorageServerID" : StorageServerID is of RecordingStorages                               */
/* 	"NetworkDriveID" : The NetworkDriveID of the network drive on which the RecordingStorage is defined. Null if using logical drive. */
/* 	"RootPath" : The drive letter of the logical drive. Ignored if using NetworkDrive.        */
/* 	"MaximumRecordSpace" : in MBs if by size, or %                                            */
/* 	"MaximumRecordUnit" : 0=By Size 1=By %                                                    */
/* 	"MinimumFreeSpace" : in MBs if by size, or %                                              */
/* 	"MinimumFreeUnit" : 0=By Size 1=By %                                                      */
/* 	"StorageUseType" : Enum:StorageUseType All,RecordingOnly,FailoverOnly,BackupOnly          */  
create table "RecordingStorages" ( 
	"RecordingStorageID" int identity not null,
	"StorageServerID" int not null,
	"NetworkDriveID" int null,
	"RootPath" nvarchar(255) not null,
	"MaximumRecordSpace" int not null,
	"MaximumRecordUnit" int not null,
	"MinimumFreeSpace" int not null,
	"MinimumFreeUnit" int not null,
	"StorageUseType" int null)  

go

alter table "RecordingStorages"
	add constraint "RecordingStorages_PK" primary key ("RecordingStorageID")   


go

/* Create new table "SendGroupAssignments".                                                   */
/* "SendGroupAssignments" : Table of SendGroupAssignments                                     */
/* 	"SendGroupAssignmentID" : SendGroupAssignmentID identifies SendGroupAssignments           */
/* 	"MessageSendGroupID" : MessageSendGroupID is of SendGroupAssignments                      */
/* 	"UserID" : UserID is of SendGroupAssignments                                              */
/* 	"RoleID" : RoleID is of SendGroupAssignments                                              */  
create table "SendGroupAssignments" ( 
	"SendGroupAssignmentID" int identity not null,
	"MessageSendGroupID" int not null,
	"UserID" int null,
	"RoleID" int null)  

go

alter table "SendGroupAssignments"
	add constraint "SendGroupAssignments_PK" primary key ("SendGroupAssignmentID")   


go

/* Create new table "UserIcons".                                                              */
/* "UserIcons" : Table of UserIcons                                                           */
/* 	"UserIconID" : UserIconID identifies UserIcons                                            */
/* 	"SharedFileID" : SharedFileID is of UserIcons                                             */
/* 	"IconImageType" : Icon Image Type: ico, jpg, gif, bmp, etc.                               */  
create table "UserIcons" ( 
	"UserIconID" int identity not null,
	"SharedFileID" int not null,
	"IconImageType" int null)  

go

alter table "UserIcons"
	add constraint "UserIcons_PK" primary key ("UserIconID")   


go

/* Create new table "MapOrgGroups".                                                           */
/* "MapOrgGroups" : Table of MapOrgGroups                                                     */
/* 	"MapOrgGroupID" : MapOrgGroupID identifies MapOrgGroups                                   */  
create table "MapOrgGroups" ( 
	"MapOrgGroupID" int identity not null,
	"MapID" int not null,
	"CustomGroupID" int not null)  

go

alter table "MapOrgGroups"
	add constraint "MapOrgGroups_PK" primary key ("MapOrgGroupID")   


go

/* Create new table "Maps".                                                                   */
/* "Maps" : Table of Maps                                                                     */
/* 	"MapID" : MapID identifies Maps                                                           */
/* 	"SharedFileID" : SharedFileID is of Maps                                                  */
/* 	"MapType" : MAP Type : WebMAP, CADMap, ImageMap, URLMap                                   */
/* 	"ZoomLevel" : ZoomLevel is of Maps                                                        */  
create table "Maps" ( 
	"MapID" int identity not null,
	"SharedFileID" int null,
	"MapType" int null,
	"MapName" nvarchar(50) null,
	"MapDescription" nvarchar(80) null,
	"CenterLat" float null,
	"CenterLong" float null,
	"ZoomLevel" int default 0 not null)  

go

alter table "Maps"
	add constraint "Maps_PK" primary key ("MapID")   


go

/* Create new table "Markers".                                                                */
/* "Markers" : Table of Markers                                                               */
/* 	"MarkerID" : MarkerID identifies Markers                                                  */
/* 	"MapID" : MapID of parent map                                                             */
/* 	"UserIconID" : Optional UserIconID to use if specified by user.                           */
/* 	"DeviceID" : DeviceID of marker target, if a Devic type [RequirePermission]               */
/* 	"ServerID" : ServerID of marker target, if Server type                                    */
/* 	"TargetMapID" : MapID of marker target, if Map type                                       */
/* 	"MarkerType" : Enum:MarkerType Camera Sensor, Relay, PTZ ...etc                           */
/* 	"Altitude" : Altitude is of Markers                                                       */
/* 	"PointX" : X component of marker position on map.                                         */
/* 	"PointY" : Y component of marker position on map.                                         */
/* 	"IsDisplayEnabled" : 1 : Enable 0 : Disable  This sets whether or not the marker is shown in Display mode. The marker is always shown in Edit mode. */
/* 	"Rotation" : Degree of rotation, from 0 - 360.                                            */
/* 	"MapLinkXml" : XML defining position and shape of map link, if using shape link instead of an icon. */
/* 	"FacilityTypeID" : FacilityTypeID is of Markers                                           */
/* 	"CoordinateType" : Enum:CoordinateType                                                    */
/* 	"SiteID" : SiteID is of Markers                                                           */
/* 	"Description" : Description is of Markers                                                 */  
create table "Markers" ( 
	"MarkerID" int identity not null,
	"MapID" int null,
	"UserIconID" int null,
	"DeviceID" int null,
	"ServerID" int null,
	"TargetMapID" int null,
	"MarkerType" int null,
	"Latitude" float null,
	"Longitude" float null,
	"Altitude" float null,
	"PointX" int null,
	"PointY" int null,
	"IsDisplayEnabled" bit default 1 null,
	"Rotation" int default 0 null,
	"MapLinkXml" nvarchar(max) null,
	"FacilityTypeID" int null,
	"CoordinateType" int null,
	"SiteID" int null,
	"Description" nvarchar(100) null)  

go

alter table "Markers"
	add constraint "Markers_PK" primary key ("MarkerID")   


go

/* Create new table "MapActions".                                                             */
/* "MapActions" : Table of MapActions                                                         */
/* 	"MapActionID" : MapActionID identifies MapActions                                         */  
create table "MapActions" ( 
	"MapActionID" int identity not null,
	"ActionItemID" int not null,
	"MarkerID" int not null)  

go

alter table "MapActions"
	add constraint "MapActions_PK" primary key ("MapActionID")   


go

/* Create new table "TileAssignments".                                                        */
/* "TileAssignments" : Table of TileAssignments                                               */
/* 	"TileAssignmentID" : TileAssignmentID identifies TileAssignments                          */
/* 	"ViewLayoutID" : FK to ViewLayouts                                                        */
/* 	"LocationX" : LocationX is of TileAssignments                                             */
/* 	"LocationY" : LocationY is of TileAssignments                                             */
/* 	"IsAutoAssign" : IsAutoAssign is of TileAssignments                                       */
/* 	"CameraID" : CameraID of camera to display in tile                                        */
/* 	"MapID" : MapID is of Map to display in tile                                              */
/* 	"SharedFileID" : SharedFileID is of TileAssignments                                       */
/* 	"Page" : 0 based index indicating what page of the viewlayout the assignment is on.       */
/* 	"PresetNo" : PresetNo is of TileAssignments                                               */
/* 	"FishEyeLensSettingsID" : FishEyeLensSettingsID is of TileAssignments                     */  
create table "TileAssignments" ( 
	"TileAssignmentID" int identity not null,
	"ViewLayoutID" int not null,
	"LocationX" int default 1 not null,
	"LocationY" int default 1 not null,
	"IsAutoAssign" bit default 0 not null,
	"CameraID" int null,
	"MapID" int null,
	"SharedFileID" int null,
	"Page" int default 0 not null,
	"PresetNo" int null,
	"FishEyeLensSettingsID" int null)  

go

alter table "TileAssignments"
	add constraint "TileAssignments_PK" primary key ("TileAssignmentID")   


go

/* Create new table "Resources".                                                              */
/* "Resources" : Table of Resources                                                           */
/* 	"ResourceID" : ResourceID identifies Resources                                            */  
create table "Resources" ( 
	"ResourceID" int not null,
	"Description" nvarchar(80) null)  

go

alter table "Resources"
	add constraint "Resources_PK" primary key ("ResourceID")   


go

/* Create new table "ResourceTexts".                                                          */
/* "ResourceTexts" : Contains localized values for text items defined in Resources.           */
/* 	"ResourceTextID" : ResourceTextID identifies ResourceTexts [SoftwareIdentity(100000)]     */
/* 	"ResourceID" : ResourceID is FK to Resources table                                        */
/* 	"LanguageID" : LanguageID is FK to Language table                                         */
/* 	"Text" : Text is of ResourceTexts                                                         */  
create table "ResourceTexts" ( 
	"ResourceTextID" int not null,
	"ResourceID" int not null,
	"LanguageID" int not null,
	"Text" nvarchar(max) null)  

go

alter table "ResourceTexts"
	add constraint "ResourceTexts_PK" primary key ("ResourceTextID")   


go

/* Create new table "Languages".                                                              */
/* "Languages" : Table of Languages                                                           */
/* 	"LanguageID" : LanguageID identifies Languages                                            */
/* 	"CultureName" : Unique culture name. This is a two digit lowercase language id ("en"), and optionally, an uppercase country id ("ko-KR"). See .Net CultureInfo class documentation for details. */
/* 	"LanguageNameResID" : LanguageNameResID is of Languages                                   */  
create table "Languages" ( 
	"LanguageID" int not null,
	"CultureName" nvarchar(15) null,
	"LanguageNameResID" int null)  

go

alter table "Languages"
	add constraint "Languages_PK" primary key ("LanguageID")   


go

/* Create new table "LayoutTiles".                                                            */
/* "LayoutTiles" : Table of LayoutTiles                                                       */
/* 	"LayoutTileID" : LayoutTileID identifies LayoutTiles                                      */
/* 	"LayoutID" : LayoutID is of LayoutTiles                                                   */
/* 	"RelativeSize" : RelativeSize is of LayoutTiles                                           */
/* 	"PositionX" : PositionY is the X value of the point identifying the upper left corner of the tile */
/* 	"PositionY" : PositionY is the Y value of the point identifying the upper left corner of the tile */  
create table "LayoutTiles" ( 
	"LayoutTileID" int identity not null,
	"LayoutID" int not null,
	"RelativeSize" int not null,
	"PositionX" int not null,
	"PositionY" int not null)  

go

alter table "LayoutTiles"
	add constraint "LayoutTiles_PK" primary key ("LayoutTileID")   


go

/* Create new table "Layouts".                                                                */
/* "Layouts" : Table of Layouts                                                               */
/* 	"LayoutID" : LayoutID identifies Layouts                                                  */
/* 	"Description" : Description is of Layouts                                                 */
/* 	"BaseSize" : The number of tiles in one dimension of the underlying grid (e.g., for a 6-tile layout with one large tile and 5 small tiles, the underlying grid is 3x3, so the base size is 3) */
/* 	"IsUserDefined" : True if layout was created by the user.                                 */  
create table "Layouts" ( 
	"LayoutID" int identity not null,
	"Description" nvarchar(30) null,
	"BaseSize" int null,
	"IsUserDefined" bit default 0 not null)  

go

alter table "Layouts"
	add constraint "Layouts_PK" primary key ("LayoutID")   


go

/* Create new table "ViewLayouts".                                                            */
/* "ViewLayouts" : Table of ViewLayouts                                                       */
/* 	"ViewLayoutID" : ViewLayoutID identifies ViewLayouts                                      */
/* 	"LayoutID" : LayoutID is of ViewLayouts                                                   */
/* 	"Description" : Description is of ViewLayouts                                             */
/* 	"BookmarkID" : If the ViewLayout is saved for a bookmark, the FK to the bookmark.         */
/* 	"CustomGroupID" : CustomGroupID is of ViewLayouts                                         */
/* 	"UserID" : Identifies the user if the ViewLayout is user-specific                         */
/* 	"DeviceID" : DeviceID is of ViewLayouts                                                   */
/* 	"ServicesCodeID" : ServicesCodeID is of ViewLayouts                                       */  
create table "ViewLayouts" ( 
	"ViewLayoutID" int identity not null,
	"LayoutID" int null,
	"Description" nvarchar(100) null,
	"BookmarkID" int null,
	"CustomGroupID" int null,
	"UserID" int null,
	"DeviceID" int null,
	"ServicesCodeID" int null)  

go

alter table "ViewLayouts"
	add constraint "ViewLayouts_PK" primary key ("ViewLayoutID")   


go

/* Create new table "Resolutions".                                                            */
/* "Resolutions" : Table of Resolutions                                                       */
/* 	"ResolutionID" : ResolutionID identifies Resolutions                                      */
/* 	"DisplayName" : DisplayName is of Resolutions                                             */
/* 	"ResolutionWidth" : ResolutionWidth is of Resolutions                                     */
/* 	"ResolutionHeight" : ResolutionHeight is of Resolutions                                   */  
create table "Resolutions" ( 
	"ResolutionID" int identity not null,
	"DisplayName" nvarchar(30) not null,
	"ResolutionWidth" int not null,
	"ResolutionHeight" int not null)  

go

alter table "Resolutions"
	add constraint "Resolutions_PK" primary key ("ResolutionID")   


go

/* Create new table "Sites".                                                                  */
/* "Sites" : Table of Sites                                                                   */
/* 	"SiteID" : SiteID identifies Sites                                                        */
/* 	"CustomGroupID" : CustomGroupID identifies the Site Group, if assigned                    */
/* 	"Name" : Name is of Sites                                                                 */
/* 	"Country" : Country is of Sites                                                           */
/* 	"State" : State is of Sites                                                               */
/* 	"City" : City is of Sites                                                                 */
/* 	"Latitude" : Latitude is of Sites                                                         */
/* 	"Longitude" : Longitude is of Sites                                                       */
/* 	"TimeZone" : TimeZone is of Sites                                                         */
/* 	"Company" : Company is of Sites                                                           */
/* 	"Address" : Address is of Sites                                                           */
/* 	"PolicePhone" : PolicePhone is of Sites                                                   */
/* 	"FirePhone" : FirePhone is of Sites                                                       */
/* 	"Phone" : Phone is of Sites                                                               */
/* 	"PrimaryContact" : PrimaryContact is of Sites                                             */
/* 	"SecondaryContact" : SecondaryContact is of Sites                                         */
/* 	"DateTimeAdded" : Date/time device was added to DB. Auto-set by server. [ReadOnly]        */
/* 	"IsDeleted" : IsDeleted is of Sites                                                       */
/* 	"AssetOwner" : AssetOwner is of Sites                                                     */
/* 	"MaintenanceCo" : MaintenanceCo is of Sites                                               */
/* 	"Description" : Description is of Sites                                                   */
/* 	"DateTimeOpened" : DateTimeOpened is of Sites                                             */
/* 	"Reserved1" : Reserved1 is of Sites                                                       */
/* 	"Reserved2" : Reserved2 is of Sites                                                       */  
create table "Sites" ( 
	"SiteID" int identity not null,
	"CustomGroupID" int null,
	"Name" nvarchar(50) null,
	"Country" nvarchar(50) null,
	"State" nvarchar(50) null,
	"City" nvarchar(50) null,
	"Latitude" float default 0 not null,
	"Longitude" float default 0 not null,
	"TimeZone" varchar(50) null,
	"Company" nvarchar(50) null,
	"Address" nvarchar(250) null,
	"PolicePhone" varchar(20) null,
	"FirePhone" varchar(20) null,
	"Phone" varchar(20) null,
	"PrimaryContact" nvarchar(100) null,
	"SecondaryContact" nvarchar(100) null,
	"DateTimeAdded" datetime default GetDate() not null,
	"IsDeleted" bit default 0 not null,
	"AssetOwner" nvarchar(50) null,
	"MaintenanceCo" nvarchar(50) null,
	"Description" nvarchar(80) null,
	"DateTimeOpened" datetime null,
	"Reserved1" nvarchar(50) null,
	"Reserved2" nvarchar(50) null)  

go

alter table "Sites"
	add constraint "Sites_PK" primary key ("SiteID")   


go

/* Create new table "CustomGroups".                                                           */
/* "CustomGroups" : Table of CustomGroups                                                     */
/* 	"CustomGroupID" : CustomGroupID identifies CustomGroups                                   */
/* 	"ParentCustomGroupID" : ParentCustomGroupID is of CustomGroups                            */
/* 	"Name" : Name is of CustomGroups                                                          */
/* 	"GroupType" : 0=Custom Group 1=Site Group 2=SMS Group 3=User Group Enum:CustomGroupType   */
/* 	"IsDeleted" : IsDeleted is of CustomGroups                                                */  
create table "CustomGroups" ( 
	"CustomGroupID" int identity not null,
	"ParentCustomGroupID" int null,
	"Name" nvarchar(50) null,
	"GroupType" int default 0 not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "CustomGroups"
	add constraint "CustomGroups_PK" primary key ("CustomGroupID")   


go

/* Create new table "EventActions".                                                           */
/* "EventActions" : Table of EventActions                                                     */
/* 	"EventActionID" : EventActionID identifies EventActions                                   */
/* 	"EventID" : EventID is of EventActions                                                    */
/* 	"ActionItemID" : ActionItemID is of EventActions                                          */
/* 	"RecordingScheduleID" : Identifies the Recording Schedule to which this EventAction mapping belongs. Only used for Config Mgr GUI. */
/* 	"ScheduleID" : ScheduleID is of EventActions                                              */  
create table "EventActions" ( 
	"EventActionID" int identity not null,
	"EventID" int null,
	"ActionItemID" int null,
	"RecordingScheduleID" int null,
	"ScheduleID" int null)  

go

alter table "EventActions"
	add constraint "EventActions_PK" primary key ("EventActionID")   


go

/* Create new table "ActionLog".                                                              */
/* "ActionLog" : ActionLog [LogTable]                                                         */
/* 	"ActionLogID" : ActionLogID identifies ActionLog                                          */
/* 	"ActionTypeID" : ActionTypeID is of ActionLog                                             */
/* 	"ActionLogXmlType" : Identifies the class which is serialized to XML in the ActionLogXml field. Enum:LogXmlTypeEnum { DeviceLog, ServerLog, UserLog, OrgGroupLog, RoleLog, EmergencyAgentLog, EmergencyGroupLog, MessageSendGroupLog, MacroLog, AlarmLog } */
/* 	"ActionLogXml" : All data for the action (source name, action type, etc.) denormalized and converted to static XML. */
/* 	"LogDateTime" : UTC set by the MCS when the Action is dispatched.                         */
/* 	"DayInt" : Calculated by default constraint function. The number of days since 2000-01-01. Used for calculating DayCount and EventID. */
/* 	"EventDayCount" : Incremented counter, set by function in default constraint, which uniquely identifies both Events and Alarms within a single day. */
/* 	"ActionResult" : Indicates result of Action. 0 - Unknown 1 = Success, 2 = Failure. The log is added when the action is dispatched, and the result is unknown at that time. */
/* 	"EventLogID" : Optional. FK to corresponding Event which triggered the Action             */
/* 	"AlarmID" : AlarmID is of ActionLog                                                       */
/* 	"TargetName" : Denormalized name of the target of the action, if applicable. (e.g., "Sony Hallway Cam 1") */
/* 	"LogDescription" : Optional text summary of the log entry.                                */
/* 	"ActionBehaviorXml" : ActionBehaviorXml defines the additional parameters needed to perform the action (e.g., for action "Goto Preset", the behavior XML would include PresetNumber param) . The type is specified in the corresponding ActionType. */
/* 	"UserID" : ID of User if the action was initiated by a user (i.e., manual action).        */
/* 	"PreRecord" : For a recording TriggerAlarm action, the PreRecord setting from the RecordingSchedule. */
/* 	"PostRecord" : For a recording TriggerAlarm action, the PostRecord setting from the RecordingSchedule. */  
create table "ActionLog" ( 
	"ActionLogID" int identity not null,
	"ActionTypeID" int null,
	"ActionLogXmlType" int not null,
	"ActionLogXml" xml not null,
	"LogDateTime" datetime not null,
	"DayInt" int not null,
	"EventDayCount" int not null,
	"ActionResult" int default 0 not null,
	"EventLogID" int null,
	"AlarmID" int null,
	"TargetName" nvarchar(50) null,
	"LogDescription" nvarchar(255) null,
	"ActionBehaviorXml" nvarchar(max) null,
	"UserID" int null,
	"PreRecord" int default 0 not null,
	"PostRecord" int default 0 not null)  

go

alter table "ActionLog"
	add constraint "ActionLog_PK" primary key ("ActionLogID")   


go

/* Create new table "EventActionRelations".                                                   */
/* "EventActionRelations" : Defines allowable mappings of actions to events, by type.         */
/* 	"EventActionRelationID" : EventActionRelationID identifies EventActionRelations           */
/* 	"EventTypeID" : EventTypeID is of EventActionRelations                                    */
/* 	"ActionTypeID" : ActionTypeID is of EventActionRelations                                  */
/* 	"IsDeleted" : IsDeleted is of EventActionRelations                                        */  
create table "EventActionRelations" ( 
	"EventActionRelationID" int identity not null,
	"EventTypeID" int null,
	"ActionTypeID" int null,
	"IsDeleted" bit default 0 not null)  

go

alter table "EventActionRelations"
	add constraint "EventActionRelations_PK" primary key ("EventActionRelationID")   


go

/* Create new table "CameraAudioConnections".                                                 */
/* "CameraAudioConnections" : Table of CameraAudioConnections                                 */
/* 	"CameraAudioConnectionID" : CameraAudioConnectionID identifies CameraAudioConnections     */
/* 	"CameraID" : CameraID is of CameraAudioConnections                                        */
/* 	"AudioID" : AudioID is of CameraAudioConnections                                          */
/* 	"IsDefault" : Is the default Audio In or Out device for the Camera if there is more than one associated. */
/* 	"IsDeleted" : IsDeleted is of CameraAudioConnections                                      */  
create table "CameraAudioConnections" ( 
	"CameraAudioConnectionID" int identity not null,
	"CameraID" int not null,
	"AudioID" int not null,
	"IsDefault" bit default 0 not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "CameraAudioConnections"
	add constraint "CameraAudioConnections_PK" primary key ("CameraAudioConnectionID")   


go

/* Create new table "Sensors".                                                                */
/* "Sensors" : Table of Sensors                                                               */
/* 	"SensorID" : SensorID identifies Sensors                                                  */
/* 	"DeviceID" : DeviceID partly identifies Sensors                                           */
/* 	"SensorIgnoreSeconds" : SensorIgnoreSeconds is of Sensors                                 */
/* 	"IsDeleted" : IsDeleted is of Sensors                                                     */  
create table "Sensors" ( 
	"SensorID" int identity not null,
	"DeviceID" int not null,
	"SensorIgnoreSeconds" int null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Sensors"
	add constraint "Sensors_PK" primary key ("SensorID")   


go

/* Create new table "MessageSendGroups".                                                      */
/* "MessageSendGroups" : Table of MessageSendGroups                                           */
/* 	"MessageSendGroupID" : MessageSendGroupID identifies MessageSendGroups                    */
/* 	"Description" : Description is of MessageSendGroups                                       */  
create table "MessageSendGroups" ( 
	"MessageSendGroupID" int identity not null,
	"Description" nvarchar(100) null)  

go

alter table "MessageSendGroups"
	add constraint "MessageSendGroups_PK" primary key ("MessageSendGroupID")   


go

/* Create new table "EmergencyGroups".                                                        */
/* "EmergencyGroups" : Table of EmergencyGroups                                               */
/* 	"EmergencyGroupID" : EmergencyGroupID identifies EmergencyGroups                          */
/* 	"Description" : Description is of EmergencyGroups                                         */  
create table "EmergencyGroups" ( 
	"EmergencyGroupID" int identity not null,
	"Description" nvarchar(100) null)  

go

alter table "EmergencyGroups"
	add constraint "EmergencyGroups_PK" primary key ("EmergencyGroupID")   


go

/* Create new table "EventLog".                                                               */
/* "EventLog" : EventLog [LogTable]                                                           */
/* 	"EventLogID" : EventLogID identifies EventLog                                             */
/* 	"EventTypeID" : EventTypeID is of EventLog                                                */
/* 	"DeviceID" : The source Device ID, if it's a device event.                                */
/* 	"UserID" : The source User ID, if it's a user event.                                      */
/* 	"ServerID" : The source Server ID, if it's a server event.                                */
/* 	"EventLogXmlType" : Identifies the class which is serialized to XML in the EventLogXml field.  Enum:LogXmlTypeEnum { DeviceLog, ServerLog, UserLog, OrgGroupLog, RoleLog, EmergencyAgentLog, EmergencyGroupLog, MessageSendGroupLog, MacroLog, AlarmLog } */
/* 	"EventLogXml" : All data for the event (source name, event type, etc.) denormalized and converted to static XML. */
/* 	"LogDateTime" : Date and Time the event log entry was added.                              */
/* 	"LogTimeOfDay" : Only the Time portion of the LogDateTime. Stored in a separate field to allow faster lookups based only on time of day across multiple days.  [TimeOnlyField] */
/* 	"DayInt" : Calculated by default constraint function. The number of days since 2000-01-01. Used for calculating DayCount and EventID. */
/* 	"EventDayCount" : Incremented counter, set by a trigger function, which uniquely identifies both Events and Alarms within a single day. */
/* 	"SourceName" : Denormalized name of the source of the event (e.g., Device Name, Server Name, etc). */
/* 	"LogDescription" : Optional text summary of the log entry.                                */
/* 	"ScheduleID" : ScheduleID is of EventLog                                                  */
/* 	"VideoAnalyticsLogID" : VideoAnalyticsLogID is of EventLog                                */
/* 	"RecognitionServerLogID" : RecognitionServerLogID is of EventLog                          */
/* 	"HostID" : HostID is of EventLog                                                          */
/* 	"DateTimeChecked" : DateTimeChecked is of EventLog                                        */
/* 	"EventData1" : EventData1 is of EventLog                                                  */
/* 	"EventData2" : EventData2 is of EventLog                                                  */  
create table "EventLog" ( 
	"EventLogID" int identity not null,
	"EventTypeID" int not null,
	"DeviceID" int null,
	"UserID" int null,
	"ServerID" int null,
	"EventLogXmlType" int not null,
	"EventLogXml" xml not null,
	"LogDateTime" datetime not null,
	"LogTimeOfDay" datetime not null,
	"DayInt" int not null,
	"EventDayCount" int not null,
	"SourceName" nvarchar(50) null,
	"LogDescription" nvarchar(255) null,
	"ScheduleID" int null,
	"VideoAnalyticsLogID" int null,
	"RecognitionServerLogID" int null,
	"HostID" int null,
	"DateTimeChecked" datetime null,
	"EventData1" nvarchar(50) null,
	"EventData2" nvarchar(50) null)  

go

alter table "EventLog"
	add constraint "EventLog_PK" primary key ("EventLogID")   


go

/* Create new table "Events".                                                                 */
/* "Events" : Table of Events                                                                 */
/* 	"EventID" : EventID identifies Events                                                     */
/* 	"EventTypeID" : The type of event                                                         */
/* 	"DeviceID" : The Device that was the source of the Event  (e.g., Camera1.MotionDetected)  */
/* 	"UserID" : The User that was the source of the Event (e.g., User1.Login)                  */
/* 	"ServerID" : The Server that was the source of the Event (e.g., Server1.Restarted)        */
/* 	"ScheduleID" : The Schedule that was the source of the Event (Rise/Fall)                  */
/* 	"IsDeleted" : IsDeleted is of Events                                                      */  
create table "Events" ( 
	"EventID" int identity not null,
	"EventTypeID" int null,
	"DeviceID" int null,
	"UserID" int null,
	"ServerID" int null,
	"ScheduleID" int null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Events"
	add constraint "Events_PK" primary key ("EventID")   


go

/* Create new table "DefaultUserSettings".                                                    */
/* "DefaultUserSettings" : Table of DefaultUserSettings                                       */
/* 	"DefaultUserSettingID" : DefaultUserSettingID identifies DefaultUserSettings              */
/* 	"Attribute" : Attribute is of DefaultUserSettings                                         */
/* 	"Value" : Value is of DefaultUserSettings                                                 */  
create table "DefaultUserSettings" ( 
	"DefaultUserSettingID" int identity not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null)  

go

alter table "DefaultUserSettings"
	add constraint "DefaultUserSettings_PK" primary key ("DefaultUserSettingID")   


go

/* Create new table "DefaultSystemSettings".                                                  */
/* "DefaultSystemSettings" : Table of DefaultSystemSettings                                   */
/* 	"DefaultSystemSettingID" : DefaultSystemSettingID identifies DefaultSystemSettings        */
/* 	"Attribute" : Attribute is of DefaultSystemSettings                                       */
/* 	"Value" : Value is of DefaultSystemSettings                                               */  
create table "DefaultSystemSettings" ( 
	"DefaultSystemSettingID" int identity not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null)  

go

alter table "DefaultSystemSettings"
	add constraint "DefaultSystemSettings_PK" primary key ("DefaultSystemSettingID")   


go

/* Create new table "SystemSettings".                                                         */
/* "SystemSettings" : Global settings for the installation.                                   */
/* 	DBVersion=2016.05.10                                                                      */
/* 	"SystemSettingID" : SystemSettingID identifies SystemSettings                             */
/* 	"Attribute" : Attribute is of SystemSettings                                              */
/* 	"Value" : Value is of SystemSettings                                                      */  
create table "SystemSettings" ( 
	"SystemSettingID" int identity not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null)  

go

alter table "SystemSettings"
	add constraint "SystemSettings_PK" primary key ("SystemSettingID")   


go

/* Create new table "DeviceModels".                                                           */
/* "DeviceModels" : The models table.  Contains model specific settings for each manufactures camera which we support */
/* 	"DeviceModelID" : DeviceModelID identifies DeviceModels [SoftwareIdentity(100000)]        */
/* 	"DeviceTypeID" : Foreign key to DeviceType table, which identifies what type of IP device it is (Camera, PTZ Camera, Dome Camera, Video Streamer, etc.). This will also affect how icons for the device will display in the GUI. */
/* 	"ManufacturerID" : foreign key to manufacturer                                            */
/* 	"ModelName" : ModelName is of DeviceModels                                                */
/* 	"IsDeleted" : IsDeleted is of DeviceModels                                                */  
create table "DeviceModels" ( 
	"DeviceModelID" int not null,
	"DeviceTypeID" int not null,
	"ManufacturerID" int null,
	"ModelName" nvarchar(30) not null,
	"IsDeleted" bit default 0 not null) ON 'PRIMARY'  

go

alter table "DeviceModels"
	add constraint "DeviceModels_PK" primary key nonclustered ("DeviceModelID")   


go

/* Create new table "Manufacturers".                                                          */
/* "Manufacturers" : Table of Manufacturers                                                   */
/* 	"ManufacturerID" : ManufacturerID identifies Manufacturers [SoftwareIdentity(100000)]     */
/* 	"Name" : Name of Manufacturer (e.g., Sony)                                                */
/* 	"IsDeleted" : IsDeleted is of Manufacturers                                               */  
create table "Manufacturers" ( 
	"ManufacturerID" int not null,
	"Name" nvarchar(80) null,
	"IsDeleted" bit default 0 not null) ON 'PRIMARY'  

go

alter table "Manufacturers"
	add constraint "Manufacturers_PK" primary key nonclustered ("ManufacturerID")   


go

/* Create new table "UserSettings".                                                           */
/* "UserSettings" : User specific settings                                                    */
/* 	These are stored in much the same way as a cookie in an ASP page.  Attribute -> Value pairs  */
/* 	"Attribute" : The name of the setting.                                                    */
/* 	"Value" : The value of the setting.                                                       */  
create table "UserSettings" ( 
	"UserSettingID" int identity not null,
	"UserID" int not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null) ON 'PRIMARY'  

go

alter table "UserSettings"
	add constraint "UserSettings_PK" primary key nonclustered ("UserSettingID")   


go

/* Create new table "StorageServers".                                                         */
/* "StorageServers" : License data specific to each storage server                            */
/* 	"StorageServerID" : StorageServerID identifies StorageServers                             */
/* 	"Name" : User defined name for this server                                                */
/* 	"StreamingAddress" : StreamingAddress is of StorageServers                                */
/* 	"TCPLivePort" : TCPLivePort is of StorageServers                                          */
/* 	"TCPPlaybackPort" : TCPPlaybackPort is of StorageServers                                  */
/* 	"ExportPort" : ExportPort is of StorageServers                                            */
/* 	"MaximumRecordDays" : MaximumRecordDays is of Cameras ( 0 = Unlimited, Other = Max Recording days for current camera. ) */
/* 	"MinimumRecordDays" : MinimumRecordDays is of StorageServers                              */
/* 	"RecompressDays" : RecompressDays is of StorageServers ( 0 is disable )                   */
/* 	"RecompressFrameRate" : RecompressFrameRate is of StorageServers                          */
/* 	"IsRemoteServer" : IsRemoteServer is of StorageServers                                    */
/* 	"RemoteLogin" : RemoteLogin is of StorageServers                                          */
/* 	"RemotePassword" : Encrypted MD5 hash of password for remote login to storage server.     */
/* 	"MaxFailoverRecording" : MaxFailoverRecording is of StorageServers                        */
/* 	"MaxFailoverStreaming" : MaxFailoverStreaming is of StorageServers                        */
/* 	"IsDeleted" : IsDeleted is of StorageServers                                              */  
create table "StorageServers" ( 
	"StorageServerID" int identity not null,
	"ServerID" int not null,
	"Name" nvarchar(80) not null,
	"StreamingAddress" varchar(50) null,
	"TCPLivePort" int not null,
	"TCPPlaybackPort" int not null,
	"ExportPort" int null,
	"MaximumRecordDays" int default 0 not null,
	"MinimumRecordDays" int null,
	"RecompressDays" int default 0 not null,
	"RecompressFrameRate" int default 0 not null,
	"IsRemoteServer" bit default 0 not null,
	"RemoteLogin" nvarchar(20) null,
	"RemotePassword" varchar(32) null,
	"MaxFailoverRecording" int null,
	"MaxFailoverStreaming" int null,
	"IsDeleted" bit default 0 not null) ON 'PRIMARY'  

go

alter table "StorageServers"
	add constraint "StorageServerLicenses_PK" primary key nonclustered ("StorageServerID")   


go

/* Create new table "Cameras".                                                                */
/* "Cameras" : Table of Cameras                                                               */
/* 	"CameraID" : Unique identifer for Video                                                   */
/* 	"DeviceID" : DeviceID partly identifies Cameras                                           */
/* 	"VideoAnalysisSettingID" : VideoAnalysisSettingID is of Cameras                           */
/* 	"ConnectionType" : Protocol to use for Live Stream. 0 - Auto (Default), 1 - UDP Multi, 2 - UDP Unicast, 3 - TCP Unicast */
/* 	"BrightnessAdjust" : amount to adjust brightness                                          */
/* 	"ContrastAdjust" : amount to adjust Contrast                                              */
/* 	"HueAdjust" : amount to adjust hue                                                        */
/* 	"SaturationAdjust" : amount to adjust Saturation                                          */
/* 	"PreEventRecording" : minutes to record prior to an event occuring                        */
/* 	"PostEventRecording" : minutes to record after an event has occured                       */
/* 	"ManualRecordingLength" : How long to record if user manually starts recording            */
/* 	"PTZEnabled" : PTZEnabled is of Cameras                                                   */
/* 	"MulticastIP" : Multicast IP (must be in multicast range)                                 */
/* 	"MulticastPort" : Multicast port                                                          */
/* 	"MotionIgnoreSeconds" : MotionIgnoreSeconds is of Cameras                                 */
/* 	"VADetectType" : Specifies the type of motion detection to use: Disable, Hardware, SoftwareMotion, UDPVCAPCOpen Enum:VADetectType */
/* 	"LowFrameRate" : LowFrameRate is of Cameras                                               */
/* 	"LowResolutionID" : LowResolutionID is of Cameras                                         */
/* 	"NormalFrameRate" : NormalFrameRate is of Cameras                                         */
/* 	"NormalResolutionID" : NormalResolutionID is of Cameras                                   */
/* 	"LiveFrameRate" : Frame rate of stream to Client for Live Video                           */
/* 	"LiveResolutionID" : Resolution of stream to Client for Live Video                        */
/* 	"HardwareFrameRate" : Camera configuration FR. This is only used for setting the Camera's desired framerate via the DSI, if supported. Not used for recording. */
/* 	"HardwareResolutionID" : Camera configuration resolution. This is only used for setting the Camera's desired resolution via the DSI, if supported. Not used for recording. */
/* 	"EnableTourTypes" : Bit mask indicating Tour Types user wants to see available for this camera. [Flags] 0x00000001 : Preset Tour, 0x00000002 : Pattern Tour, 0x00000004 : Swing, 0x00000008 : Other Tour, 0x00000010 : SW Preset Tour */
/* 	"IsRecordDayOverride" : RecordDayInherited is of Cameras ( 0 = Inherited MaximumRecordDays from StorageServer, 1 = Override StorageServer setting  ) */
/* 	"MaximumRecordDays" : MaximumRecordDays is of Cameras ( 0 = IUnlimited, Other = Max Recording days for current camera. ) */
/* 	"UseRecompress" : UseRecompress is of Cameras                                             */
/* 	"RecognitionSettingID" : RecognitionSettingID is of Cameras                               */
/* 	"LiveStreamNo" : LiveStreamNo is of Cameras                                               */
/* 	"RecordStreamNo" : RecordStreamNo is of Cameras                                           */
/* 	"VAStreamNo" : VAStreamNo is of Cameras                                                   */
/* 	"TrackingPTZCameraID" : TrackingPTZCameraID is of Cameras                                 */
/* 	"HomePresetNo" : HomePresetNo is of Cameras                                               */
/* 	"MaxZoomLevel" : MaxZoomLevel is of Cameras                                               */
/* 	"DefaultPTZSpeed" : DefaultPTZSpeed is of Cameras                                         */
/* 	"TrackingHoldTime" : TrackingHoldTime is of Cameras                                       */
/* 	"IsFailoverRecording" : IsFailoverRecording is of Cameras                                 */
/* 	"FailoverRecordStreamNo" : FailoverRecordStreamNo is of Cameras                           */
/* 	"IsFailoverRecordLowFrameRate" : IsFailoverRecordLowFrameRate is of Cameras               */
/* 	"CameraCode" : CameraCode is of Cameras                                                   */
/* 	"Rotation" : Degree of rotation, from 0 - 360.                                            */
/* 	"IsHardwareAreaZoom" : IsHardwareAreaZoom is of Cameras                                   */
/* 	"FishEyeLensSettingsID" : FishEyeLensSettingsID is of Cameras                             */
/* 	"IsDeleted" : IsDeleted is of Cameras                                                     */  
create table "Cameras" ( 
	"CameraID" int identity not null,
	"DeviceID" int not null,
	"VideoAnalysisSettingID" int null,
	"ConnectionType" int null,
	"BrightnessAdjust" int null,
	"ContrastAdjust" int null,
	"HueAdjust" int null,
	"SaturationAdjust" int null,
	"PreEventRecording" int null,
	"PostEventRecording" int null,
	"ManualRecordingLength" int null,
	"PTZEnabled" bit null,
	"MulticastIP" nvarchar(15) null,
	"MulticastPort" int null,
	"MotionIgnoreSeconds" int default 5 null,
	"VADetectType" int null,
	"LowFrameRate" int null,
	"LowResolutionID" int null,
	"NormalFrameRate" int null,
	"NormalResolutionID" int null,
	"LiveFrameRate" int null,
	"LiveResolutionID" int null,
	"HardwareFrameRate" int null,
	"HardwareResolutionID" int null,
	"EnableTourTypes" int default 0 not null,
	"IsRecordDayOverride" bit default 0 not null,
	"MaximumRecordDays" int default 0 not null,
	"UseRecompress" bit default 1 not null,
	"RecognitionSettingID" int null,
	"LiveStreamNo" int null,
	"RecordStreamNo" int null,
	"VAStreamNo" int null,
	"TrackingPTZCameraID" int null,
	"HomePresetNo" int null,
	"MaxZoomLevel" int null,
	"DefaultPTZSpeed" int null,
	"TrackingHoldTime" int null,
	"IsFailoverRecording" bit null,
	"FailoverRecordStreamNo" int null,
	"IsFailoverRecordLowFrameRate" bit null,
	"CameraCode" nvarchar(64) null,
	"Rotation" int null,
	"IsHardwareAreaZoom" bit null,
	"FishEyeLensSettingsID" int null,
	"IsDeleted" bit default 0 not null) ON 'PRIMARY'  

go

alter table "Cameras"
	add constraint "Videos_PK" primary key nonclustered ("CameraID")   


go

/* Create new table "DeviceTypes".                                                            */
/* "DeviceTypes" : Table of DeviceTypes                                                       */
/* 	"DeviceTypeID" : DeviceTypeID identifies DeviceTypes                                      */
/* 	"DescriptionResID" : Text to display for the device type (e.g., "Dome Camera", "Dome Camera with PTZ" */
/* 	"SortOrder" : Only for display order in GUI                                               */
/* 	"IsDeleted" : IsDeleted is of DeviceTypes                                                 */  
create table "DeviceTypes" ( 
	"DeviceTypeID" int not null,
	"DescriptionResID" int not null,
	"SortOrder" int null,
	"IsDeleted" bit default 0 not null) ON 'PRIMARY'  

go

alter table "DeviceTypes"
	add constraint "DeviceTypes_PK" primary key nonclustered ("DeviceTypeID")   


go

/* Create new table "Devices".                                                                */
/* "Devices" : Table of Devices                                                               */
/* 	"DeviceID" : DeviceID identifies Devices                                                  */
/* 	"DeviceModelID" : DeviceModelID is of Devices                                             */
/* 	"DeviceName" : DeviceName - User editable, but defaults to the Manufacturer + Device Name + Increment NodeColumn(Device Name) */
/* 	"Description" : Optional user-defined display name of the device for the GUI.  NodeColumn(Description) */
/* 	"ParentDeviceID" : For analog devices, the DeviceID of the IP Device it's connected to    */
/* 	"CustomGroupID" : FK to OrganizationGroup. Every device can be assigned to only one group, which determines how it will appear in the Organization View in the GUI. If not set, will appear as "Unassigned" */
/* 	"StorageServerID" : StorageServerID is of Devices                                         */
/* 	"InteropServerID" : InteropServerID is of Devices                                         */
/* 	"ChannelNo" : For analog devices attached to a video server, the channel # on the video server */
/* 	"Enabled" : Is the device available for use within the system? Disabled devices do not count against a license. */
/* 	"NetAddress" : IP or Domain Name of Devices NodeColumn(Network Address)                   */
/* 	"Port" : Port to connect on (for Network Devices)  NodeColumn(Port)                       */
/* 	"SearchPort" : Port to connect on for search (for Network Devices)                        */
/* 	"LoginName" : LoginName is of Devices                                                     */
/* 	"Password" : Encrypted password for the device.                                           */
/* 	"ConfigURL" : ConfigURL is of Devices                                                     */
/* 	"SiteID" : SiteID is of Devices                                                           */
/* 	"DeviceCode" : Management Code                                                            */
/* 	"DateTimeAdded" : Date/time device was added to DB. Auto-set by server. [ReadOnly]        */
/* 	"DeviceStatus" : Enum:DeviceStatusType None, Installing, Recovering                       */
/* 	"IsDeleted" : Indicates that the record has been marked as deleted, but is kept for archival integrity. */
/* 	"DateTimeInstalled" : Date/time device was installed.                                     */
/* 	"StreamURL" : StreamURL is of Devices                                                     */
/* 	"ClipBackupPort" : ClipBackupPort is of Devices                                           */
/* 	"HealthCheckPort" : HealthCheckPort is of Devices                                         */  
create table "Devices" ( 
	"DeviceID" int identity not null,
	"DeviceModelID" int not null,
	"DeviceName" nvarchar(40) not null,
	"Description" nvarchar(80) null,
	"ParentDeviceID" int null,
	"CustomGroupID" int null,
	"StorageServerID" int null,
	"InteropServerID" int null,
	"ChannelNo" int null,
	"Enabled" bit default 1 not null,
	"NetAddress" varchar(50) null,
	"Port" int null,
	"SearchPort" int null,
	"LoginName" nvarchar(20) null,
	"Password" varchar(64) null,
	"ConfigURL" nvarchar(80) null,
	"SiteID" int null,
	"DeviceCode" nvarchar(64) null,
	"DateTimeAdded" datetime default GetDate() not null,
	"DeviceStatus" int null,
	"IsDeleted" bit default 0 not null,
	"DateTimeInstalled" datetime null,
	"StreamURL" nvarchar(80) null,
	"ClipBackupPort" int null,
	"HealthCheckPort" int null) ON 'PRIMARY'  

go

alter table "Devices"
	add constraint "Devices_PK" primary key nonclustered ("DeviceID")   


go

/* Create new table "Servers".                                                                */
/* "Servers" : Table of Servers                                                               */
/* 	"Name" : Name is of Servers                                                               */
/* 	"ServerType" : Enum:ServerType                                                            */
/* 	"Priority" : failover priority of server                                                  */
/* 	"HostName" : host name the server the MS will fill in which ever one isn't input.   NodeColumn(Hostname) */
/* 	"ServiceInstanceName" : ServiceInstanceName is of Servers                                 */
/* 	"IP" :  ip address of the server the MS will fill in which ever one isn't input.    NodeColumn(IP Address) */
/* 	"SiteID" : SiteID is of Servers                                                           */
/* 	"IsGatewayMCS" : Indicates that the server is the Gateway MCS, which is responsible for server connection management. */
/* 	"DateTimeAdded" : Date/time server was added to DB. Auto-set by server. [ReadOnly]        */
/* 	"FailoverStartOn" : Enum:FailStartReasonType Unspecific, Software, Hardware, Storage      */
/* 	"FailoverCheckDuration" : FailoverCheckDuration is of Servers                             */
/* 	"OSPlatformType" : Enum:OSPlatformType                                                    */
/* 	"PrimaryServerID" : PrimaryServerID is of Servers                                         */
/* 	"Enabled" : Indicates whether or not the server is licensed and functional.               */
/* 	"DateTimeInstalled" : DateTimeInstalled is of Servers                                     */
/* 	"IsDeleted" : IsDeleted is of Servers                                                     */  
create table "Servers" ( 
	"ServerID" int identity not null,
	"Name" nvarchar(80) null,
	"ServerType" int not null,
	"Priority" int not null,
	"HostName" nvarchar(50) null,
	"ServiceInstanceName" nvarchar(80) null,
	"IP" varchar(15) null,
	"Port" int not null,
	"SiteID" int null,
	"IsGatewayMCS" bit default 0 not null,
	"DateTimeAdded" datetime default GetDate() not null,
	"FailoverStartOn" int null,
	"FailoverCheckDuration" int null,
	"OSPlatformType" int null,
	"PrimaryServerID" int null,
	"Enabled" bit default 1 not null,
	"DateTimeInstalled" datetime null,
	"IsDeleted" bit default 0 not null) ON 'PRIMARY'  

go

alter table "Servers"
	add constraint "Servers_PK" primary key nonclustered ("ServerID")   


go

/* Create new table "ServerSettings".                                                         */
/* "ServerSettings" : Server settings                                                         */
/* 	"ServerID" : ServerID is of ServerSettings                                                */
/* 	"Attribute" : how often to sync cached data to database                                   */
/* 	"Value" : how often to refresh permissions to the UI/MCS                                  */  
create table "ServerSettings" ( 
	"ServerSettingID" int identity not null,
	"ServerID" int not null,
	"Attribute" varchar(100) null,
	"Value" nvarchar(255) null) ON 'PRIMARY'  

go

alter table "ServerSettings"
	add constraint "ServerSettings_PK" primary key nonclustered ("ServerSettingID")   


go

/* Create new table "Users".                                                                  */
/* "Users" : Table of Users                                                                   */
/* 	"UserID" : unique id                                                                      */
/* 	"UserName" : NodeColumn(User Name)                                                        */
/* 	"Password" : Encrypted MD5 hash of password. Only applies to non-AD logins (passwords are not stored for AD login) */
/* 	"FirstName" : NodeColumn(First Name)                                                      */
/* 	"LastName" : NodeColumn(Last Name)                                                        */
/* 	"Description" : Optional descriptive text (e.g., "Junsik is a swell guy!")                */
/* 	"ActiveDirectoryLogin" : True if we are to use AD for login, false to use local password  */
/* 	"Email" : Optional email address of user, used for sending messages                       */
/* 	"Telephone" : Telephone number                                                            */
/* 	"Mobile" : Mobile phone number                                                            */
/* 	"DateTimeAdded" : Date/time user was added to DB. Auto-set by server. [ReadOnly]          */
/* 	"IsDeleted" : IsDeleted is of Users                                                       */
/* 	"PasswordRuleID" : PasswordRuleID is of Users                                             */
/* 	"PasswordChangedTime" : PasswordChangedTime is of Users                                   */
/* 	"SmartPoliceID" : SmartPoliceID is of Users                                               */
/* 	"CustomGroupID" : CustomGroupID is of Users                                               */  
create table "Users" ( 
	"UserID" int identity not null,
	"UserName" nvarchar(30) not null,
	"Password" varchar(32) null,
	"FirstName" nvarchar(20) null,
	"LastName" nvarchar(20) null,
	"Description" nvarchar(100) null,
	"ActiveDirectoryLogin" bit null,
	"LanguageID" int null,
	"Email" nvarchar(100) null,
	"Telephone" varchar(30) null,
	"Mobile" varchar(30) null,
	"DateTimeAdded" datetime default GetDate() not null,
	"IsDeleted" bit default 0 not null,
	"PasswordRuleID" int null,
	"PasswordChangedTime" datetime null,
	"SmartPoliceID" int null,
	"CustomGroupID" int null) ON 'PRIMARY'  

go

alter table "Users"
	add constraint "User_PK" primary key nonclustered ("UserID")   


go

/* Create new table "ActionItems".                                                            */
/* "ActionItems" : Table of ActionItems                                                       */
/* 	"ActionItemID" : ActionItemID identifies ActionItems                                      */
/* 	"ParentAlarmID" : ID of the Alarm for which this action is a child.                       */
/* 	"DeviceID" : DeviceID is of ActionItems                                                   */
/* 	"UserID" : UserID is of ActionItems                                                       */
/* 	"RoleID" : RoleID is of ActionItems                                                       */
/* 	"ServerID" : ServerID is of ActionItems                                                   */
/* 	"MessageSendGroupID" : MessageSendGroupID is of ActionItems                               */
/* 	"EmergencyGroupID" : EmergencyGroupID is of ActionItems                                   */
/* 	"EmergencyAgentID" : EmergencyAgentID is of ActionItems                                   */
/* 	"AlarmID" : If the ActionType is TriggerAlarm, then this identifies the Alarm to trigger. */
/* 	"MacroID" : If the ActionType is TriggerMacro, then this identifies the Macro to execute. */
/* 	"TourID" : TourID is of ActionItems                                                       */
/* 	"ActionEnabled" : ActionEnabled is of ActionItems                                         */
/* 	"Priority" : Used for conflict resolution when multiple conflicting actions are executed at the same time (i.e., PTZ Goto Preset 1(cam1) starts before action PTZ Tour(cam1) is finished, and they have same target). */
/* 	"ActionBehaviorXml" : XML defining detailed parameters and action behavior                */
/* 	"RecordingScheduleID" : RecordingScheduleID is of ActionItems                             */
/* 	"SharedFileID" : SharedFileID is of ActionItems                                           */
/* 	"Sequence" : Used for cases where items need to be ordered in the GUI, such as Alarm actions. */
/* 	"Duration" : If the action requires a certain amount of time to execute (e.g., PTZ tour), the duration is used for processing conflicting requests. */
/* 	"IsDeleted" : IsDeleted is of ActionItems                                                 */  
create table "ActionItems" ( 
	"ActionItemID" int identity not null,
	"ActionTypeID" int null,
	"ActionDescription" nvarchar(80) null,
	"ParentAlarmID" int null,
	"DeviceID" int null,
	"UserID" int null,
	"RoleID" int null,
	"ServerID" int null,
	"MessageSendGroupID" int null,
	"EmergencyGroupID" int null,
	"EmergencyAgentID" int null,
	"AlarmID" int null,
	"MacroID" int null,
	"TourID" int null,
	"ActionEnabled" bit null,
	"Priority" int null,
	"ActionBehaviorXml" nvarchar(max) null,
	"RecordingScheduleID" int null,
	"SharedFileID" int null,
	"Sequence" int default 0 not null,
	"Duration" int default 0 not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "ActionItems"
	add constraint "ActionItems_PK" primary key ("ActionItemID")   


go

/* Create new table "ActionTypes".                                                            */
/* "ActionTypes" : Table of ActionTypes                                                       */
/* 	"ActionTypeID" : ActionTypeID identifies ActionTypes                                      */
/* 	"ActionTypeNameResID" : Human readable description of action                              */
/* 	"ActionGroupID" : ActionGroupID is of ActionTypes                                         */
/* 	"ActionHandlerType" : 0 - MCS 1 - SS 2- Client (indicates which system will perform the action) Enum:ActionHandlerType */
/* 	"ActionBehaviorType" : Identifies the class serialized in ActionBehaviorXML (ActionItems table)  Enum:ActionBehaviorType */
/* 	"LogByDefault" : 0=Do not log  1=Log (default).                                           */
/* 	"AllowCustomLogSetting" : If true, we will permit the user to override the default log setting via SystemSettings. */
/* 	"IsAlarmAction" : Can this action type be triggered by alarms?                            */
/* 	"IsMacroAction" : Can this action type be used in Macros?                                 */
/* 	"FirstSupportingDBVersion" : The DB Version (stored in SystemSettings) of the first version supporting this ActionType */
/* 	"IsDeleted" : IsDeleted is of ActionTypes                                                 */  
create table "ActionTypes" ( 
	"ActionTypeID" int not null,
	"ActionTypeNameResID" int null,
	"ActionGroupID" int null,
	"ActionHandlerType" int not null,
	"ActionBehaviorType" int null,
	"LogByDefault" bit default 1 not null,
	"AllowCustomLogSetting" bit default 0 not null,
	"IsAlarmAction" bit default 0 not null,
	"IsMacroAction" bit default 0 not null,
	"FirstSupportingDBVersion" nvarchar(20) null,
	"IsDeleted" bit default 0 not null)  

go

alter table "ActionTypes"
	add constraint "ActionTypes_PK" primary key ("ActionTypeID")   


go

/* Create new table "NetworkDeviceModels".                                                    */
/* "NetworkDeviceModels" : The models table.  Contains model specific settings for each manufactures camera which we support */
/* 	"NetworkDeviceModelID" : NetworkDeviceModelID identifies NetworkDeviceModels [SoftwareIdentity(100000)] */
/* 	"DeviceModelID" : DeviceModelID partly identifies NetworkDeviceModels                     */
/* 	"DSIDeviceTypeID" : DSIDeviceTypeID is of NetworkDeviceModels                             */
/* 	"DSIDeviceModelID" : DSIDeviceModelID is of NetworkDeviceModels                           */
/* 	"DefaultLoginName" : Default login id set by manufacturer (used for first-time connection) */
/* 	"DefaultPassword" : Encrypted default password set by manufacturer (used for first-time connection) */
/* 	"DefaultPort" : Default port set by manufacturer (used for first-time connection)         */
/* 	"DefaultSearchPort" : DefaultSearchPort is of NetworkDeviceModels                         */
/* 	"DefaultConfigURL" : Default config url to use with this model                            */
/* 	"MaxCameraCount" : MaxCameraCount is of NetworkDeviceModels                               */
/* 	"MaxAudioInCount" : MaxAudioInCount is of NetworkDeviceModels                             */
/* 	"MaxAudioOutCount" : MaxAudioOutCount is of NetworkDeviceModels                           */
/* 	"MaxSensorCount" : MaxSensorCount is of NetworkDeviceModels                               */
/* 	"MaxRelayCount" : MaxRelayCount is of NetworkDeviceModels                                 */
/* 	"SupportsAbsolutePosition" : Only true for IP Cameras with PTZ that support absolute position. Used for On-Screen Compass feature. */
/* 	"SupportsMotionDetection" : Indicates tha the camera supports hardware motion detection.  */
/* 	"SupportsControlFrameRate" : Indicates that the camera's frame rate can be changed via the DSI. */
/* 	"SupportsControlResolution" : Indicates that the camera's resolution can be changed via the DSI. */
/* 	"MaxPresetCount" : MaxPresetCount is of NetworkDeviceModels                               */
/* 	"SupportsMenu" : SupportsMenu is of NetworkDeviceModels                                   */
/* 	"SupportsPTZ" : SupportsPTZ is of NetworkDeviceModels                                     */
/* 	"MaxAuxiliaryCount" : MaxAuxiliaryCount is of NetworkDeviceModels                         */
/* 	"SupportsLight" : SupportsLight is of NetworkDeviceModels                                 */
/* 	"SupportsWiper" : SupportsWiper is of NetworkDeviceModels                                 */
/* 	"MaxPresetTourCount" : MaxPresetTourCount is of NetworkDeviceModels                       */
/* 	"MaxPatternTourCount" : MaxPatternTourCount is of NetworkDeviceModels                     */
/* 	"MaxSwingCount" : MaxSwingCount is of NetworkDeviceModels                                 */
/* 	"MaxOtherTourCount" : MaxOtherTourCount is of NetworkDeviceModels                         */
/* 	"MaxStreamCount" : MaxStreamCount is of NetworkDeviceModels                               */
/* 	"SupportDualLiveStream" : SupportDualLiveStream is of NetworkDeviceModels                 */
/* 	"SingleLiveStreamNo" : SingleLiveStreamNo is of NetworkDeviceModels                       */
/* 	"DivisionLiveStreamNo" : DivisionLiveStreamNo is of NetworkDeviceModels                   */
/* 	"SupportVideoAnalysis" : SupportVideoAnalysis is of NetworkDeviceModels                   */
/* 	"SupportPTZSpeed" : SupportPTZSpeed is of NetworkDeviceModels                             */
/* 	"IsVariableUnitCount" : IsVariableUnitCount is of NetworkDeviceModels                     */
/* 	"SupportSearchPort" : Is device support search port?                                      */
/* 	"DefaultSetupPort" : DefaultSetupPort is of NetworkDeviceModels                           */
/* 	"SupportSetupPort" : SupportSetupPort is of NetworkDeviceModels                           */
/* 	"SupportStreamURL" : SupportStreamURL is of NetworkDeviceModels                           */
/* 	"SupportHardwareAreaZoom" : SupportHardwareAreaZoom is of NetworkDeviceModels             */
/* 	"SupportClipBackup" : SupportClipBackup is of NetworkDeviceModels                         */
/* 	"ClipBackupPort" : ClipBackupPort is of NetworkDeviceModels                               */
/* 	"SupportHealthCheck" : SupportHealthCheck is of NetworkDeviceModels                       */
/* 	"HealthCheckPort" : HealthCheckPort is of NetworkDeviceModels                             */  
create table "NetworkDeviceModels" ( 
	"NetworkDeviceModelID" int not null,
	"DeviceModelID" int not null,
	"DSIDeviceTypeID" int null,
	"DSIDeviceModelID" int null,
	"DefaultLoginName" nvarchar(20) null,
	"DefaultPassword" varchar(64) null,
	"DefaultPort" int null,
	"DefaultSearchPort" int null,
	"DefaultConfigURL" nvarchar(80) null,
	"MaxCameraCount" int default 0 not null,
	"MaxAudioInCount" int default 0 not null,
	"MaxAudioOutCount" int default 0 not null,
	"MaxSensorCount" int default 0 not null,
	"MaxRelayCount" int default 0 not null,
	"SupportsAbsolutePosition" bit default 0 not null,
	"SupportsMotionDetection" bit default 0 not null,
	"SupportsControlFrameRate" bit default 0 not null,
	"SupportsControlResolution" bit default 0 not null,
	"MaxPresetCount" int default 0 not null,
	"SupportsMenu" bit default 0 not null,
	"SupportsPTZ" bit default 0 not null,
	"MaxAuxiliaryCount" int default 0 not null,
	"SupportsLight" bit default 0 not null,
	"SupportsWiper" bit default 0 not null,
	"MaxPresetTourCount" int default 0 not null,
	"MaxPatternTourCount" int default 0 not null,
	"MaxSwingCount" int default 0 not null,
	"MaxOtherTourCount" int default 0 not null,
	"MaxStreamCount" int not null,
	"SupportDualLiveStream" bit not null,
	"SingleLiveStreamNo" int not null,
	"DivisionLiveStreamNo" int not null,
	"SupportVideoAnalysis" bit not null,
	"SupportPTZSpeed" bit not null,
	"IsVariableUnitCount" bit not null,
	"SupportSearchPort" bit default 0 not null,
	"DefaultSetupPort" int null,
	"SupportSetupPort" bit null,
	"SupportStreamURL" bit null,
	"SupportHardwareAreaZoom" bit null,
	"SupportClipBackup" bit null,
	"ClipBackupPort" int null,
	"SupportHealthCheck" bit null,
	"HealthCheckPort" int null) ON 'PRIMARY'  

go

alter table "NetworkDeviceModels"
	add constraint "NetworkDeviceModels_PK" primary key nonclustered ("NetworkDeviceModelID")   


go

/* Create new table "EventTypes".                                                             */
/* "EventTypes" : Table of EventTypes                                                         */
/* 	"EventGroupID" : EventGroupID is of EventTypes                                            */
/* 	"LogByDefault" : 0=Do not log  1=Log (default).                                           */
/* 	"AllowCustomLogSetting" : If true, we will permit the user to override the default log setting via SystemSettings. */
/* 	"FirstSupportingDBVersion" : The DB Version (stored in SystemSettings) of the first version supporting this EventType */
/* 	"IsDeleted" : IsDeleted is of EventTypes                                                  */
/* 	"InSystemLog" : Determines if the logged event is included in display of System Log Viewer */
/* 	"InAlarmLog" : InAlarmLog is of EventTypes                                                */  
create table "EventTypes" ( 
	"EventTypeID" int not null,
	"EventGroupID" int not null,
	"EventTypeNameResID" int not null,
	"LogByDefault" bit default 1 not null,
	"AllowCustomLogSetting" bit default 0 not null,
	"FirstSupportingDBVersion" nvarchar(20) null,
	"IsDeleted" bit default 0 not null,
	"InSystemLog" bit default 0 not null,
	"InAlarmLog" bit not null)  

go

alter table "EventTypes"
	add constraint "EventTypes_PK" primary key ("EventTypeID")   


go

/* Create new table "EventGroups".                                                            */
/* "EventGroups" : EventGroups table indicate                                                 */
/* 	"EventGroupID" : EventGroupID identifies EventGroups                                      */
/* 	"EventGroupNameResID" : MS, MCS, SS, Camera, Audio, Sensor, Relay                         */
/* 	"IsDeleted" : IsDeleted is of EventGroups                                                 */  
create table "EventGroups" ( 
	"EventGroupID" int not null,
	"EventGroupNameResID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "EventGroups"
	add constraint "EventGroups_PK" primary key ("EventGroupID")   


go

/* Create new table "Relays".                                                                 */
/* "Relays" : Table of Relays                                                                 */
/* 	"RelayID" : RelayID identifies Relays                                                     */
/* 	"DeviceID" : DeviceID partly identifies Relays                                            */
/* 	"IsDeleted" : IsDeleted is of Relays                                                      */  
create table "Relays" ( 
	"RelayID" int identity not null,
	"DeviceID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Relays"
	add constraint "Relays_PK" primary key ("RelayID")   


go

/* Create new table "ActionGroups".                                                           */
/* "ActionGroups" : Table of ActionGroups                                                     */
/* 	"ActionGroupID" : ActionGroupID identifies ActionGroups                                   */
/* 	"ActionGroupNameResID" : Human readable description of action                             */
/* 	"IsDeleted" : IsDeleted is of ActionGroups                                                */  
create table "ActionGroups" ( 
	"ActionGroupID" int not null,
	"ActionGroupNameResID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "ActionGroups"
	add constraint "ActionGroups_PK" primary key ("ActionGroupID")   


go

/* Create new table "Audios".                                                                 */
/* "Audios" : Table of Audios                                                                 */
/* 	"AudioID" : AudioID identifies Audios                                                     */
/* 	"DeviceID" : DeviceID partly identifies Audios                                            */
/* 	"IsDeleted" : IsDeleted is of Audios                                                      */  
create table "Audios" ( 
	"AudioID" int identity not null,
	"DeviceID" int not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Audios"
	add constraint "Audios_PK" primary key ("AudioID")   


go

/* Create new table "Roles".                                                                  */
/* "Roles" : Table of Roles                                                                   */
/* 	"RoleName" : display name for this role                                                   */
/* 	"Description" : Description is of Roles                                                   */
/* 	"Administrator" : Is this the built-in Administrator role?                                */
/* 	"DateTimeAdded" : Date/time role was added to DB. Auto-set by server. [ReadOnly]          */
/* 	"ActiveDirectoryRole" : True if role was created based on import from Active Directory.   */
/* 	"IsDeleted" : IsDeleted is of Roles                                                       */
/* 	"PasswordRuleID" : PasswordRuleID is of Roles                                             */  
create table "Roles" ( 
	"RoleID" int identity not null,
	"RoleName" nvarchar(80) null,
	"Description" nvarchar(80) null,
	"Administrator" bit default 0 not null,
	"DateTimeAdded" datetime default GetDate() not null,
	"ActiveDirectoryRole" bit default 0 not null,
	"IsDeleted" bit default 0 not null,
	"PasswordRuleID" int null)  

go

alter table "Roles"
	add constraint "Roles_PK" primary key ("RoleID")   


go

/* Create new table "DevicePermissions".                                                      */
/* "DevicePermissions" : Table of DevicePermissions                                           */
/* 	"DevicePermissionID" : DevicePermissionID identifies DevicePermissions                    */
/* 	"DeviceID" : DeviceID is of DevicePermissions                                             */
/* 	"RoleID" : RoleID is of DevicePermissions                                                 */
/* 	"UserID" : UserID is of DevicePermissions                                                 */
/* 	"PermissionID" : PermissionID is of DevicePermissions                                     */
/* 	"PrivLevel" : PrivLevel is of DevicePermissions                                           */  
create table "DevicePermissions" ( 
	"DevicePermissionID" int identity not null,
	"DeviceID" int not null,
	"RoleID" int null,
	"UserID" int null,
	"PermissionID" int not null,
	"PrivLevel" int default 0 not null)  

go

alter table "DevicePermissions"
	add constraint "DevicePermissions_PK" primary key ("DevicePermissionID")   


go

/* Create new table "UserRoles".                                                              */
/* "UserRoles" : Table of UserRoles                                                           */
/* 	"UserID" : UserID is of UserRoles                                                         */
/* 	"RoleID" : RoleID is of UserRoles                                                         */  
create table "UserRoles" ( 
	"UserRoleID" int identity not null,
	"UserID" int not null,
	"RoleID" int not null)  

go

alter table "UserRoles"
	add constraint "UserRoles_PK" primary key ("UserRoleID")   


go

/* Create new table "ActiveDirectoryRoles".                                                   */
/* "ActiveDirectoryRoles" : Table of ActiveDirectoryRoles                                     */
/* 	"ActiveDirectoryRoleID" : primary key                                                     */
/* 	"ActiveDirectoryGroupName" : ActiveDirectory Group Name                                   */
/* 	"RoleID" : RoleID is of ActiveDirectoryRoles                                              */  
create table "ActiveDirectoryRoles" ( 
	"ActiveDirectoryRoleID" int identity not null,
	"ActiveDirectoryGroupName" nvarchar(80) null,
	"RoleID" int null)  

go

alter table "ActiveDirectoryRoles"
	add constraint "ActiveDirectoryRoles_PK" primary key ("ActiveDirectoryRoleID")   


go

/* Create new table "TimeCoverages".                                                          */
/* "TimeCoverages" : Table of TimeCoverages                                                   */
/* 	"TimeCoverageID" : TimeCoverageID identifies TimeCoverages                                */
/* 	"WeekCoverageID" : Optional. Specifies that the TimeCoverage applies only to a certain weekday for weekly sched patterns where different days have different TimeCoverages. */
/* 	"ScheduleID" : ScheduleID is of TimeCoverages                                             */
/* 	"TimeFrom" : TimeFrom is of TimeCoverages  [TimeOnlyField]                                */
/* 	"TimeTo" : TimeTo is of TimeCoverages [TimeOnlyField]                                     */
/* 	"IsDayAfter" : Only used for monthly and yearly range times that span more than one day.  */
/* 	"IsAdvanced" : Used to indicate if the TimeCoverages belong to the Advanced defintion for the related scehdule. */  
create table "TimeCoverages" ( 
	"TimeCoverageID" int identity not null,
	"WeekCoverageID" int null,
	"ScheduleID" int not null,
	"TimeFrom" datetime null,
	"TimeTo" datetime null,
	"IsDayAfter" bit default 0 not null,
	"IsAdvanced" bit default 0 not null)  

go

alter table "TimeCoverages"
	add constraint "TimeCoverages_PK" primary key ("TimeCoverageID")   


go

/* Create new table "SystemPermissions".                                                      */
/* "SystemPermissions" : Table of SystemPermissions                                           */
/* 	"RoleID" : RoleID is of SystemPermissions                                                 */
/* 	"PermissionID" : PermissionID is of SystemPermissions                                     */
/* 	"PrivLevel" : PrivLevel is of SystemPermissions                                           */  
create table "SystemPermissions" ( 
	"SystemPermissionID" int identity not null,
	"RoleID" int null,
	"UserID" int null,
	"PermissionID" int not null,
	"PrivLevel" int default 0 not null)  

go

alter table "SystemPermissions"
	add constraint "SystemPermissions_PK" primary key ("SystemPermissionID")   


go

/* Create new table "ConnectionHistory".                                                      */
/* "ConnectionHistory" : Table of ConnectionHistory                                           */
/* 	"ConnectionHistoryID" : ConnectionHistoryID identifies ConnectionHistory                  */
/* 	"DeviceID" : DeviceID is of ConnectionHistory                                             */
/* 	"StorageServerID" : StorageServerID is of ConnectionHistory                               */
/* 	"Start" : Timestamp when Camera was assigned to connection.                               */
/* 	"Stop" : Timestamp when Camera connection was ended.                                      */
/* 	"IsDeleted" : IsDeleted is of ConnectionHistory                                           */  
create table "ConnectionHistory" ( 
	"ConnectionHistoryID" int identity not null,
	"DeviceID" int not null,
	"StorageServerID" int not null,
	"Start" datetime null,
	"Stop" datetime null,
	"IsDeleted" bit default 0 not null)  

go

alter table "ConnectionHistory"
	add constraint "ConnectionHistory_PK" primary key ("ConnectionHistoryID")   


go

/* Create new table "BackupStorages".                                                         */
/* "BackupStorages" : Table of BackupStorages                                                 */
/* 	"BackupStorageID" : BackupStorageID identifies BackupStorages                             */
/* 	"BackupID" : BackupID is of BackupStorages                                                */
/* 	"RecordingStorageID" : RecordingStorageID is of BackupStorages                            */
/* 	"Sequence" : Low number has high priority                                                 */
/* 	"TargetMedia" : 0=CDRom, 1=Fixed, 2=Network, 3=Removable, 4:Other Enum:BackupTargetMediaEnum */
/* 	"TargetPath" : Null if using SS RecordingStorage (TargetMedia 0 or 1)                     */
/* 	"NetLogin" : NetLogin is of BackupStorages                                                */
/* 	"NetPassword" : Encrypted password used to login to the BackupStorage device.             */  
create table "BackupStorages" ( 
	"BackupStorageID" int identity not null,
	"BackupID" int not null,
	"RecordingStorageID" int null,
	"Sequence" int null,
	"TargetMedia" int null,
	"TargetPath" nvarchar(200) null,
	"NetLogin" nvarchar(20) null,
	"NetPassword" varchar(64) null)  

go

alter table "BackupStorages"
	add constraint "BackupStorages_PK" primary key ("BackupStorageID")   


go

/* Create new table "Backups".                                                                */
/* "Backups" : Table of Backups                                                               */
/* 	"BackupID" : BackupID identifies Backups                                                  */
/* 	"StorageServerID" : StorageServerID is of Backups                                         */
/* 	"Description" : Description                                                               */
/* 	"BackupType" : 0 = Manual, 1 = Reservation, 2 = Schedule Backup, 3=Auto Backup Enum:BackupTypeEnum (Note: Reservation is the same as a manual, except waiting to start until the ReservedTime) */
/* 	"BackupCameras" : BackupCamera List  (Comma-separated list of DeviceIDs)                  */
/* 	"IsIncludeViewer" : 0 = Exclude Backup Viewer, 1 = Include Backup Viewer                  */
/* 	"FromTime" : Backup Period (Start Time)  - only for Manual/Reservation backups            */
/* 	"ToTime" : Backup Period (End Time)   - only for Manual/Reservation backups               */
/* 	"RequestingUserID" : UserID of user who initiated a Manual or Reservation backup          */
/* 	"RequestingIP" : RequestingIP is the IP address of client requesting a Manual or Reservation backup */  
create table "Backups" ( 
	"BackupID" int identity not null,
	"StorageServerID" int not null,
	"Description" nvarchar(100) null,
	"BackupType" smallint not null,
	"BackupCameras" nvarchar(max) not null,
	"IsIncludeViewer" bit default 0 not null,
	"FromTime" datetime null,
	"ToTime" datetime null,
	"RequestingUserID" int null,
	"RequestingIP" nvarchar(15) null)  

go

alter table "Backups"
	add constraint "Backups_PK" primary key ("BackupID")   


go

/* Create new table "StartedBackups".                                                         */
/* "StartedBackups" : Table of StartedBackups                                                 */
/* 	"StartedBackupID" : StartedBackupID identifies StartedBackups                             */
/* 	"BackupID" : BackupID is of StartedBackups                                                */
/* 	"ReservedTime" : Time that a Reservation backup is scheduled to start (Note: this can include the date as well to schedule for a later day) */
/* 	"StartTime" : Time the backup process starts                                              */
/* 	"FinishTime" : Time the backup process finishes                                           */
/* 	"Status" : 0 - Not Started 1 - In Progress 2 - Success 3 - Failed Enum:BackupStatusEnum   */
/* 	"BackupFileCount" : Number of files backed up                                             */
/* 	"BackupFileSize" : File size, in KB, of files backed up                                   */
/* 	"FailureReason" : If the backup failed. Text description of failure (perhaps e            */  
create table "StartedBackups" ( 
	"StartedBackupID" int identity not null,
	"BackupID" int not null,
	"ReservedTime" datetime null,
	"StartTime" datetime null,
	"FinishTime" datetime null,
	"Status" int default 0 not null,
	"BackupFileCount" int null,
	"BackupFileSize" int null,
	"FailureReason" nvarchar(100) null)  

go

alter table "StartedBackups"
	add constraint "StartedBackups_PK" primary key ("StartedBackupID")   


go

/* Create new table "AlarmChecks".                                                            */
/* "AlarmChecks" : AlarmChecks [LogTable]                                                     */
/* 	"AlarmCheckID" : AlarmCheckID identifies AlarmChecks                                      */
/* 	"ActionLogID" : Identifies the alarm action.                                              */
/* 	"UserID" : Who changed the status?                                                        */
/* 	"CheckDateTime" : The time it was processed by the user.                                  */
/* 	"CheckTimeOfDay" : Only the Time portion of the CheckDateTime. Stored in a separate field to allow faster lookups based only on time of day across multiple days. [TimeOnlyField] */
/* 	"Notes" : User-entered notes about the alarm event.                                       */
/* 	"AlarmStatusID" : User-set priority. Defaults to Pending                                  */
/* 	"ActionTakenID" : User-set priority.                                                      */
/* 	"AlarmPriorityID" : Priority for Alarm instance inherited from Alarms table. Can be modified by user. */
/* 	"AlarmCategoryID" : AlarmCategoryID is of AlarmChecks                                     */
/* 	"CompletedTime" : CompletedTime is of AlarmChecks                                         */
/* 	"CompletedNote" : CompletedNote is of AlarmChecks                                         */  
create table "AlarmChecks" ( 
	"AlarmCheckID" int identity not null,
	"ActionLogID" int null,
	"UserID" int null,
	"CheckDateTime" datetime null,
	"CheckTimeOfDay" datetime null,
	"Notes" nvarchar(500) null,
	"AlarmStatusID" int default (1) null,
	"ActionTakenID" int null,
	"AlarmPriorityID" int null,
	"AlarmCategoryID" int null,
	"CompletedTime" datetime null,
	"CompletedNote" nvarchar(500) null)  

go

alter table "AlarmChecks"
	add constraint "AlarmChecks_PK" primary key ("AlarmCheckID")   


go

/* Create new table "VideoAnalysisSettings".                                                  */
/* "VideoAnalysisSettings" : Table of VideoAnalysisSettings                                   */
/* 	"VideoAnalysisSettingID" : VideoAnalysisSettingID identifies VideoAnalysisSettings        */
/* 	"AnalyzerDataXml" : VideoAnalyzer Setup Data(XML)                                         */
/* 	"AlarmFilter" : Bitset data, ex) None = 0, AreaIntrusion = 1, WrongDirection = 2, MissingLeft = 4, Loitering = 8, VirtualFence = 16, FlowCounter = 32, Sabotage = 64, FaceDetection = 128 */
/* 	"UseSignalPosition" : For sensitivity check                                               */
/* 	"SignalPositionX" : X of specific point in image                                          */
/* 	"SignalPositionY" : Y of specific point in image                                          */
/* 	"AnalysisSettingType" : 0 = UDP 1 = UDPWidthTracking 2= SoftwareMotionDetection           */  
create table "VideoAnalysisSettings" ( 
	"VideoAnalysisSettingID" int identity not null,
	"AnalyzerDataXml" nvarchar(max) null,
	"AlarmFilter" int default 0 not null,
	"UseSignalPosition" bit default 0 not null,
	"SignalPositionX" int null,
	"SignalPositionY" int null,
	"AnalysisSettingType" int not null)  

go

alter table "VideoAnalysisSettings"
	add constraint "VideoAnalysisSettings_PK" primary key ("VideoAnalysisSettingID")   


go

/* Create new table "SearchVideoAnalysisSettings".                                            */
/* "SearchVideoAnalysisSettings" : Table of SearchVideoAnalysisSettings                       */
/* 	"SearchVideoAnalysisSettingID" : SearchVideoAnalysisSettingID identifies SearchVideoAnalysisSettings */
/* 	"VideoAnalysisSettingID" : VideoAnalysisSettingID is of SearchVideoAnalysisSettings       */
/* 	"CameraID" : CameraID is of SearchVideoAnalysisSettings                                   */
/* 	"UserID" : Optional. If specified, indicates that the Analysis Settings are private (user-specific). */
/* 	"Name" : Name is of SearchVideoAnalysisSettings                                           */
/* 	"VAType" : Specifies the type of video analysis to use: Motion, Advance Enum:VAType       */  
create table "SearchVideoAnalysisSettings" ( 
	"SearchVideoAnalysisSettingID" int identity not null,
	"VideoAnalysisSettingID" int not null,
	"CameraID" int not null,
	"UserID" int null,
	"Name" nvarchar(40) null,
	"VAType" int null)  

go

alter table "SearchVideoAnalysisSettings"
	add constraint "SearchVideoAnalysisSettings_PK" primary key ("SearchVideoAnalysisSettingID")   


go

/* Create new table "RecordingSchedules".                                                     */
/* "RecordingSchedules" : Table of RecordingSchedules                                         */
/* 	"RecordingScheduleID" : RecordingScheduleID identifies RecordingSchedules                 */
/* 	"CameraID" : CameraID is of RecordingSchedules                                            */
/* 	"ScheduleID" : ScheduleID is of RecordingSchedules                                        */
/* 	"IsContinuousRecord" : Will this recording schedule use continuous recording?             */
/* 	"IsAudioRecord" : IsAudioRecord is of RecordingSchedules                                  */
/* 	"IsVCAMetaRecord" : IsVCAMetaRecord is of RecordingSchedules                              */
/* 	"ConserveSpaceContinuous" : Use reduced-frame-rate recording for continous recording?     */
/* 	"FrameRateMJPEG" : The frame rate to use for reduced-frame-rate recording for M-JPEG streams. MPG4 will use key-frames only for reduced-frame recording. */
/* 	"HasMotionInput" : True if motion on the camera serves as an event input for recording or raising an alarm.  */
/* 	"HasSensorInput" : True if one or more sensors will serve as event inputs for recording or raising an alarm. */
/* 	"HasOtherCameraInput" : True if motion on another camera will serve as an event input for recording. */
/* 	"HasMetadataInput" : HasMetadataInput is of RecordingSchedules                            */
/* 	"ConserveSpaceEvent" : Use reduced-frame-rate recording for event recording?              */
/* 	"RaiseAlarm" : True if motion or sensor event input triggers an alarm.                    */
/* 	"PreRecord" : The number of seconds to record prior to the event (motion or sensor).      */
/* 	"PostRecord" : The number of seconds to record after the event occurs.                    */
/* 	"Priority" : Determines the order in which Schedules appear in the list, which is used to resolve conflicts (Top schedule wins) */
/* 	"IsDefault" : True if this is the default recording schedule for the camera (cannot be deleted). */
/* 	"IsDeleted" : IsDeleted is of RecordingSchedules                                          */  
create table "RecordingSchedules" ( 
	"RecordingScheduleID" int identity not null,
	"CameraID" int not null,
	"ScheduleID" int not null,
	"IsContinuousRecord" bit default 0 not null,
	"IsAudioRecord" bit default 0 not null,
	"IsVCAMetaRecord" bit default 0 not null,
	"ConserveSpaceContinuous" bit default 0 not null,
	"FrameRateMJPEG" int default 10 not null,
	"HasMotionInput" bit default 0 not null,
	"HasSensorInput" bit default 0 not null,
	"HasOtherCameraInput" bit default 0 not null,
	"HasMetadataInput" bit default 0 not null,
	"ConserveSpaceEvent" bit default 0 not null,
	"RaiseAlarm" bit default 0 not null,
	"PreRecord" int default 0 not null,
	"PostRecord" int not null,
	"Priority" int not null,
	"IsDefault" bit default 0 not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "RecordingSchedules"
	add constraint "RecordingSchedules_PK" primary key ("RecordingScheduleID")   


go

/* Create new table "Schedules".                                                              */
/* "Schedules" : Table of Schedules                                                           */
/* 	"ScheduleID" : ScheduleID identifies Schedules                                            */
/* 	"ScheduleName" : ScheduleName is of Schedules                                             */
/* 	"ScheduleType" : 0 = Schedule, 1 = ScheduledEvent, 2= Template Enum:ScheduleType          */
/* 	"IsAdvanced" : If false, show weekly schedule with no recurrence. If true, show advanced single-day interface with recurrence support. */
/* 	"UseRecurrence" : True if the schedule should use recurrence. If false, will use specific dates. */
/* 	"RecurrencePattern" : Enum:Recurrence None, Daily, Weekly, Monthly, Yearly, Specific      */
/* 	"DateCoveragePeriod" : Enum:DateCoverageValue -1=None, 1=Day of Every Month, 2=Special Weekday every month ( Ex:The fourth Wednesday of every month ), 3=Special Day of Special Month (Ex: Day 10 of March), 4=Special Weekday of Special Month (Ex: The first wednesday of march) */
/* 	"TimeCoveragePeriod" : Enum:TimeCoverageValue -1=None, 1=Range, 2=Sunrise to Sunset       */
/* 	"WeekNumber" : (First, Second, ...)                                                       */
/* 	"YearNumber" : YearNumber is of Schedules                                                 */
/* 	"MonthNumber" : Enum:MonthEnum                                                            */
/* 	"DayNumber" : Day of the month                                                            */
/* 	"UseSunriseToSunset" : Indicates that the schedule is On between Sunrise and Sunset (+/- the offset) */
/* 	"SunriseOffset" : SunriseOffset is of DetailSchedules (Minute)                            */
/* 	"SunsetOffset" : SunsetOffset is of DetailSchedules (Minute)                              */
/* 	"CalendarType" : Enum:CalendarType 1=Solar, 2=Lunar                                       */
/* 	"RecurrenceStart" : Date recurrence should start.                                         */
/* 	"RecurrenceRangeType" : None, Count, EndDate  Enum:RecurrenceRangeType                    */
/* 	"RecurrenceCount" : If RecurrenceRangeType is Count, the number of occurences             */
/* 	"RecurrenceEndDate" : If RecurrenceRangeType is EndDate, the last day the Schedule will apply */
/* 	"DateTimeAdded" : Date/time schedule was added to DB. Auto-set by server. [ReadOnly]      */
/* 	"IsDefault" : True if this is the built-in 24 hour schedule used as the schedule for Default Recording Schedule. Cannot be deleted. */
/* 	"TimeZone" : Only applies to ScheduledEvents. Prevents site-baed time-zone processing of the schedule. Will only process the specified time zone. */
/* 	"IsUserDefined" : False if the schedule is pre-loaded built-in data. These can still be deleted, but it allows us to distinguish during installation. Default is true. */
/* 	"IsDeleted" : IsDeleted is of Schedules                                                   */  
create table "Schedules" ( 
	"ScheduleID" int identity not null,
	"ScheduleName" nvarchar(40) null,
	"ScheduleType" int default 0 not null,
	"IsAdvanced" bit default 0 not null,
	"UseRecurrence" bit default 0 not null,
	"RecurrencePattern" int default -1 not null,
	"DateCoveragePeriod" int default -1 not null,
	"TimeCoveragePeriod" int default -1 not null,
	"WeekNumber" int null,
	"YearNumber" int null,
	"MonthNumber" int default 0 not null,
	"DayNumber" int null,
	"UseSunriseToSunset" bit default 0 not null,
	"SunriseOffset" int null,
	"SunsetOffset" int null,
	"CalendarType" int default 1 not null,
	"RecurrenceStart" datetime null,
	"RecurrenceRangeType" int null,
	"RecurrenceCount" int null,
	"RecurrenceEndDate" datetime null,
	"DateTimeAdded" datetime default GetDate() not null,
	"IsDefault" bit default 0 not null,
	"TimeZone" varchar(50) null,
	"IsUserDefined" bit default 1 not null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Schedules"
	add constraint "DetailSchedule_PK" primary key ("ScheduleID")   


go

/* Create new table "SpecificDates".                                                          */
/* "SpecificDates" : Table of SpecificDates                                                   */
/* 	"SpecificDateID" : SpecificDateID identifies SpecificDates                                */
/* 	"ScheduleID" : ScheduleID is of SpecificDates                                             */  
create table "SpecificDates" ( 
	"SpecificDateID" int identity not null,
	"ScheduleID" int not null,
	"SpecificDay" datetime not null)  

go

alter table "SpecificDates"
	add constraint "SpecificDates_PK" primary key ("SpecificDateID")   


go

/* Create new table "MetadataDeviceModels".                                                   */
/* "MetadataDeviceModels" : Table of MetadataDeviceModels                                     */
/* 	"MetadataDeviceModelID" : MetadataDeviceModelID identifies MetadataDeviceModels           */
/* 	"DeviceModelID" : DeviceModelID is of MetadataDeviceModels                                */
/* 	"DSIDeviceTypeID" : DSIDeviceTypeID is of MetadataDeviceModels                            */
/* 	"DSIDeviceModelID" : DSIDeviceModelID is of MetadataDeviceModels                          */
/* 	"DefaultLoginName" : Default login id set by manufacturer (used for first-time connection) */
/* 	"DefaultPassword" : Encrypted default password set by manufacturer (used for first-time connection) */
/* 	"DefaultPort" : Default port set by manufacturer (used for first-time connection)         */
/* 	"SupportProtocols" : Bit mask indicating MetadataProtocolTypes. [Flags] 0x00000000 : Undefined, 0x00000001 : TCP Server, 0x00000002 : TCP Client, 0x00000004 : UDP Server, 0x00000008 : UDP Client */  
create table "MetadataDeviceModels" ( 
	"MetadataDeviceModelID" int identity not null,
	"DeviceModelID" int not null,
	"DSIDeviceTypeID" int null,
	"DSIDeviceModelID" int null,
	"DefaultLoginName" nvarchar(20) null,
	"DefaultPassword" varchar(64) null,
	"DefaultPort" int null,
	"SupportProtocols" int null)  

go

alter table "MetadataDeviceModels"
	add constraint "MetadataDeviceModels_PK" primary key ("MetadataDeviceModelID")   


go

/* Create new table "MetadataGroupMembers".                                                   */
/* "MetadataGroupMembers" : User specific settings                                            */
/* 	These are stored in much the same way as a cookie in an ASP page.  Attribute -> Value pairs  */
/* 	"CameraID" : CameraID is of MetadataGroupMembers                                          */
/* 	"TerminalID" : TerminalID is of MetadataGroupMembers                                      */  
create table "MetadataGroupMembers" ( 
	"MetadataGroupMemberID" int identity not null,
	"DeviceID" int not null,
	"CameraID" int not null,
	"TerminalID" int null) ON 'PRIMARY'  

go

alter table "MetadataGroupMembers"
	add constraint "MetadataGroupMembers_PK" primary key nonclustered ("MetadataGroupMemberID")   


go

/* Create new table "MetadataSettings".                                                       */
/* "MetadataSettings" : Metadata specific settings                                            */
/* 	These are stored in much the same way as a cookie in an ASP page.  Attribute -> Value pairs  */
/* 	"MetadataGroupMemberID" : MetadataGroupMemberID is of MetadataSettings                    */
/* 	"Attribute" : The name of the setting.                                                    */
/* 	"Value" : The value of the setting.                                                       */  
create table "MetadataSettings" ( 
	"MetadataSettingID" int identity not null,
	"MetadataGroupMemberID" int not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null) ON 'PRIMARY'  

go

alter table "MetadataSettings"
	add constraint "MetadataSettings_PK" primary key nonclustered ("MetadataSettingID")   


go

/* Create new table "MetadataDeviceModelSettings".                                            */
/* "MetadataDeviceModelSettings" : MetadataDeviceModel specific settings                      */
/* 	These are stored in much the same way as a cookie in an ASP page.  Attribute -> Value pairs  */
/* 	"Attribute" : The name of the setting.                                                    */
/* 	"Value" : The value of the setting.                                                       */  
create table "MetadataDeviceModelSettings" ( 
	"MetadataDeviceModelSettingID" int identity not null,
	"MetadataDeviceModelID" int not null,
	"Attribute" varchar(100) not null,
	"Value" nvarchar(255) null) ON 'PRIMARY'  

go

alter table "MetadataDeviceModelSettings"
	add constraint "MetadataDeviceModelSettings_PK" primary key nonclustered ("MetadataDeviceModelSettingID")   


go

/* Create new table "Recognitions".                                                           */
/* "Recognitions" : Recognitions [LogTable]                                                   */
/* 	"RecognitionID" : RecognitionID identifies Recognitions                                   */
/* 	"CameraID" : CameraID is of Recognitions                                                  */
/* 	"UserID" : 사용자 정보                                                                         */
/* 	"RecognitionStartDateTime" : 번호판 인식 최초 시간                                                 */
/* 	"RecognitionEndDateTime" : 위반 시간                                                          */
/* 	"RegistrationNumber" : RegistrationNumber is of Recognitions                              */
/* 	"RecognitionStatesID" : RecognitionStatesID is of Recognitions                            */
/* 	"RecognitionConfirmed" : RecognitionConfirmed is of Recognitions                          */
/* 	"RecognitionPosX" : RecognitionPosX is of Recognitions                                    */
/* 	"RecognitionPosY" : RecognitionPosY is of Recognitions                                    */
/* 	"RecognitionWidth" : RecognitionWidth is of Recognitions                                  */
/* 	"RecognitionHeight" : RecognitionHeight is of Recognitions                                */
/* 	"RecognitionAreaLineID" : RecognitionAreaLineID is of Recognitions                        */  
create table "Recognitions" ( 
	"RecognitionID" int identity not null,
	"CameraID" int not null,
	"UserID" int null,
	"RecognitionStartDateTime" datetime not null,
	"RecognitionEndDateTime" datetime null,
	"RegistrationNumber" nvarchar(20) not null,
	"RecognitionStatesID" int null,
	"RecognitionConfirmed" bit null,
	"RecognitionPosX" float null,
	"RecognitionPosY" float null,
	"RecognitionWidth" float null,
	"RecognitionHeight" float null,
	"RecognitionAreaLineID" int null)  

go

alter table "Recognitions"
	add constraint "Recognitions_PK" primary key ("RecognitionID")   


go

/* Create new table "RecognitionImages".                                                      */
/* "RecognitionImages" : RecognitionImages [LogTable]                                         */
/* 	"RecognitionImageID" : RecognitionImageID identifies RecognitionImages                    */
/* 	"RecognitionID" : RecognitionID is of RecognitionImages                                   */
/* 	"SavedFileID" : SavedFileID partly identifies RecognitionImages                           */  
create table "RecognitionImages" ( 
	"RecognitionImageID" int identity not null,
	"RecognitionID" int not null,
	"SavedFileID" int not null)  

go

alter table "RecognitionImages"
	add constraint "RecognitionImages_PK" primary key ("RecognitionImageID")   


go

/* Create new table "SavedFiles".                                                             */
/* "SavedFiles" : SavedFiles [LogTable]                                                       */
/* 	"SavedFileID" : SavedFileID identifies SavedFiles                                         */
/* 	"EventLogID" : EventLogID is of SavedFiles                                                */
/* 	"ServerID" : ServerID is of SavedFiles                                                    */
/* 	"DeviceID" : DeviceID is of SavedFiles                                                    */
/* 	"SavedFileType" : 0=Undefined, 1=Registration Number, 2=Video Detection Enum:SavedFileType */
/* 	"FileName" : The file name, including extension, without the path.                        */
/* 	"FolderPath" : The path of the folder. (Ex: E:\RegistrationNumbers)                       */
/* 	"FileSize" : FileSize is of SavedFiles                                                    */
/* 	"FileType" : Enum:FileType Enum for possible file types.                                  */
/* 	"SavedTime" : SavedTime is of SavedFiles                                                  */
/* 	"ManagedFileName" : ManagedFileName is of SavedFiles                                      */
/* 	"Hash" : Hash is of SavedFiles                                                            */  
create table "SavedFiles" ( 
	"SavedFileID" int identity not null,
	"EventLogID" int null,
	"ServerID" int null,
	"DeviceID" int null,
	"SavedFileType" int not null,
	"FileName" nvarchar(150) not null,
	"FolderPath" nvarchar(200) null,
	"FileSize" int null,
	"FileType" int null,
	"SavedTime" datetime null,
	"ManagedFileName" varchar(32) null,
	"Hash" varchar(32) null)  

go

alter table "SavedFiles"
	add constraint "SavedFiles_PK" primary key ("SavedFileID")   


go

/* Create new table "ServiceCodes".                                                           */
/* "ServiceCodes" : Table of ServiceCodes                                                     */
/* 	"ServiceCodeID" : ServiceCodeID identifies ServiceCodes                                   */
/* 	"ServiceCodeNameResID" : ServiceCodeNameResID is of ServiceCodes                          */
/* 	"Color" : Color is of ServiceCodes                                                        */  
create table "ServiceCodes" ( 
	"ServiceCodeID" int not null,
	"ServiceCodeNameResID" int not null,
	"Color" varchar(50) not null)  

go

alter table "ServiceCodes"
	add constraint "ServiceCodes_PK" primary key ("ServiceCodeID")   


go

/* Create new table "ViewLayoutPermissions".                                                  */
/* "ViewLayoutPermissions" : Table of ViewLayoutPermissions                                   */
/* 	"ViewLayoutPermissionID" : ViewLayoutPermissionID identifies ViewLayoutPermissions        */
/* 	"ViewLayoutID" : ViewLayoutID is of ViewLayoutPermissions                                 */
/* 	"UserID" : UserID is of ViewLayoutPermissions                                             */
/* 	"RoleID" : RoleID is of ViewLayoutPermissions                                             */
/* 	"PermissionID" : PermissionID is of ViewLayoutPermissions                                 */
/* 	"PrivLevel" : PrivLevel is of ViewPermissions                                             */  
create table "ViewLayoutPermissions" ( 
	"ViewLayoutPermissionID" int identity not null,
	"ViewLayoutID" int not null,
	"UserID" int null,
	"RoleID" int null,
	"PermissionID" int not null,
	"PrivLevel" int default 0 not null)  

go

alter table "ViewLayoutPermissions"
	add constraint "ViewLayoutPermissions_PK" primary key ("ViewLayoutPermissionID")   


go

/* Create new table "RecognitionAreaSettings".                                                */
/* "RecognitionAreaSettings" : Tables of RecognitionAreaSettings                              */
/* 	"RecognitionAreaSettingID" : RecognitionAreaSettingID identifies RecognitionAreaSettings  */
/* 	"CameraID" : CameraID is of RecognitionAreaSettings                                       */
/* 	"HomePresetNo" : HomePresetNo is of RecognitionAreaSettings                               */
/* 	"Description" : Description is of RecognitionAreaSettings                                 */  
create table "RecognitionAreaSettings" ( 
	"RecognitionAreaSettingID" int identity not null,
	"CameraID" int not null,
	"HomePresetNo" int null,
	"Description" nvarchar(80) null)  

go

alter table "RecognitionAreaSettings"
	add constraint "RecognitionAreaSettings_PK" primary key ("RecognitionAreaSettingID")   


go

/* Create new table "RecognitionAreaLines".                                                   */
/* "RecognitionAreaLines" : Tables of RecognitionAreaLines                                    */
/* 	"RecognitionAreaLineID" : RecognitionAreaLineID identifies RecognitionAreaLines           */
/* 	"RecognitionAreaSettingID" : RecognitionAreaSettingID is of RecognitionAreaLines          */
/* 	"PresetNo" : PresetNo is of RecognitionAreaLines                                          */
/* 	"Position1x" : Position1x is of RecognitionAreaLines                                      */
/* 	"Position1y" : Position1y is of RecognitionAreaLines                                      */
/* 	"Position2x" : Position2x is of RecognitionAreaLines                                      */
/* 	"Position2y" : Position2y is of RecognitionAreaLines                                      */
/* 	"Position3x" : Position3x is of RecognitionAreaLines                                      */
/* 	"Position3y" : Position3y is of RecognitionAreaLines                                      */
/* 	"Position4x" : Position4x is of RecognitionAreaLines                                      */
/* 	"Position4y" : Position4y is of RecognitionAreaLines                                      */
/* 	"AbsolutePan" : AbsolutePan is of RecognitionAreaLines                                    */
/* 	"AbsoluteTilt" : AbsoluteTilt is of RecognitionAreaLines                                  */
/* 	"AbsoluteZoom" : AbsoluteZoom is of RecognitionAreaLines                                  */
/* 	"AbsoluteFocus" : AbsoluteFocus is of RecognitionAreaLines                                */
/* 	"IsCenterCoordinates" : IsCenterCoordinates is of RecognitionAreaLines                    */
/* 	"IsSchoolZone" : IsSchoolZone is of RecognitionAreaLines                                  */
/* 	"RecognitionInterval" : RecognitionInterval is of RecognitionAreaLines                    */
/* 	"RecognitionTimeInterval1" : RecognitionTimeInterval1 is of RecognitionAreaLines          */
/* 	"RecognitionTimeInterval2" : RecognitionTimeInterval2 is of RecognitionAreaLines          */
/* 	"AutoZoomRate1" : AutoZoomRate1 is of RecognitionAreaLines                                */
/* 	"AutoZoomRate2" : AutoZoomRate2 is of RecognitionAreaLines                                */
/* 	"TruckVehicleInterval" : TruckVehicleInterval is of RecognitionAreaLines                  */
/* 	"SUVVehicleInterval" : SUVVehicleInterval is of RecognitionAreaLines                      */
/* 	"BusinessVehicleInterval" : BusinessVehicleInterval is of RecognitionAreaLines            */
/* 	"ScheduleID" : ScheduleID is of RecognitionAreaLines                                      */  
create table "RecognitionAreaLines" ( 
	"RecognitionAreaLineID" int identity not null,
	"RecognitionAreaSettingID" int not null,
	"PresetNo" int null,
	"Position1x" int null,
	"Position1y" int null,
	"Position2x" int null,
	"Position2y" int null,
	"Position3x" int null,
	"Position3y" int null,
	"Position4x" int null,
	"Position4y" int null,
	"AbsolutePan" int null,
	"AbsoluteTilt" int null,
	"AbsoluteZoom" int null,
	"AbsoluteFocus" int null,
	"IsCenterCoordinates" bit null,
	"IsSchoolZone" bit null,
	"RecognitionInterval" int null,
	"RecognitionTimeInterval1" int null,
	"RecognitionTimeInterval2" int null,
	"AutoZoomRate1" int null,
	"AutoZoomRate2" int null,
	"TruckVehicleInterval" int null,
	"SUVVehicleInterval" int null,
	"BusinessVehicleInterval" int null,
	"ScheduleID" int null)  

go

alter table "RecognitionAreaLines"
	add constraint "RecognitionAreaLines_PK" primary key ("RecognitionAreaLineID")   


go

/* Create new table "RecognitionSettings".                                                    */
/* "RecognitionSettings" : Tables of RecognitionSettings                                      */
/* 	"RecognitionSettingID" : RecognitionSettingID identifies RecognitionSettings              */
/* 	"IsDefaultSystemSetting" : IsDefaultSystemSetting is of RecognitionSettings               */
/* 	"RecognitionInterval" : RecognitionInterval is of RecognitionSettings                     */
/* 	"RecognitionTimeInterval1" : RecognitionTimeInterval1 is of RecognitionSettings           */
/* 	"RecognitionTimeInterval2" : RecognitionTimeInterval2 is of RecognitionSettings           */
/* 	"RecognitionTimeInterval3" : RecognitionTimeInterval3 is of RecognitionSettings           */
/* 	"RecognitionTimeInterval4" : RecognitionTimeInterval4 is of RecognitionSettings           */
/* 	"RecognitionTimeInterval5" : RecognitionTimeInterval5 is of RecognitionSettings           */
/* 	"AutoZoomRate1" : AutoZoomRate1 is of RecognitionSettings                                 */
/* 	"AutoZoomRate2" : AutoZoomRate2 is of RecognitionSettings                                 */
/* 	"AutoZoomRate3" : AutoZoomRate3 is of RecognitionSettings                                 */
/* 	"AutoZoomRate4" : AutoZoomRate4 is of RecognitionSettings                                 */
/* 	"AutoZoomRate5" : AutoZoomRate5 is of RecognitionSettings                                 */
/* 	"TourTimeInterval" : TourTimeInterval is of RecognitionSettings                           */
/* 	"UseAreaSemiAutoMode" : UseAreaSemiAutoMode is of RecognitionSettings                     */
/* 	"UseAbsoluteSemiAutoMode" : UseAbsoluteSemiAutoMode is of RecognitionSettings             */
/* 	"UseAutoMode" : UseAutoMode is of RecognitionSettings                                     */
/* 	"UseNonAbsoluteAutoMode" : UseNonAbsoluteAutoMode is of RecognitionSettings               */
/* 	"UseTourMode" : UseTourMode is of RecognitionSettings                                     */
/* 	"UniqueCode" : UniqueCode is of RecognitionSettings                                       */
/* 	"IsSchoolZone" : IsSchoolZone is of RecognitionSettings                                   */
/* 	"TruckVehicleInterval" : TruckVehicleInterval is of RecognitionSettings                   */
/* 	"SUVVehicleInterval" : SUVVehicleInterval is of RecognitionSettings                       */
/* 	"BusinessVehicleInterval" : BusinessVehicleInterval is of RecognitionSettings             */
/* 	"RecognitionOptionXml" : RecognitionOptionXml is of RecognitionSettings                   */  
create table "RecognitionSettings" ( 
	"RecognitionSettingID" int identity not null,
	"IsDefaultSystemSetting" bit not null,
	"RecognitionInterval" int null,
	"RecognitionTimeInterval1" int null,
	"RecognitionTimeInterval2" int null,
	"RecognitionTimeInterval3" int null,
	"RecognitionTimeInterval4" int null,
	"RecognitionTimeInterval5" int null,
	"AutoZoomRate1" int null,
	"AutoZoomRate2" int null,
	"AutoZoomRate3" int null,
	"AutoZoomRate4" int null,
	"AutoZoomRate5" int null,
	"TourTimeInterval" int null,
	"UseAreaSemiAutoMode" bit null,
	"UseAbsoluteSemiAutoMode" bit null,
	"UseAutoMode" bit null,
	"UseNonAbsoluteAutoMode" bit null,
	"UseTourMode" bit null,
	"UniqueCode" nvarchar(30) null,
	"IsSchoolZone" bit null,
	"TruckVehicleInterval" int null,
	"SUVVehicleInterval" int null,
	"BusinessVehicleInterval" int null,
	"RecognitionOptionXml" xml null)  

go

alter table "RecognitionSettings"
	add constraint "RecognitionSettings_PK" primary key ("RecognitionSettingID")   


go

/* Create new table "RecognitionStates".                                                      */
/* "RecognitionStates" : Table of RecognitionStates                                           */
/* 	"RecognitionStateID" : RecognitionStateID identifies RecognitionStates                    */
/* 	"RecognitionStateNameResID" : RecognitionStatusNameResID is of RecognitionStatus (0: 단속 완료, 1: 계도 처리, 2: 단속 확정, 3: 취소 보관) */
/* 	"IsDeleted" : IsDeleted is of RecognitionStates                                           */  
create table "RecognitionStates" ( 
	"RecognitionStateID" int not null,
	"RecognitionStateNameResID" int not null,
	"IsDeleted" bit not null)  

go

alter table "RecognitionStates"
	add constraint "RecognitionStates_PK" primary key ("RecognitionStateID")   


go

/* Create new table "AuxiliaryDevices".                                                       */
/* "AuxiliaryDevices" : Table of AuxiliaryDevices                                             */
/* 	"AuxiliaryDeviceID" : AuxiliaryDeviceID identifies AuxiliaryDevices                       */
/* 	"ConnectionType" : 0: Socket, 1: Serial                                                   */
/* 	"AuxiliaryDeviceIPAddress" : AuxiliaryDeviceIPAddress is of AuxiliaryDevices              */
/* 	"AuxiliaryDevicePort" : AuxiliaryDevicePort is of AuxiliaryDevices                        */
/* 	"BaudRate" : BaudRate is of AuxiliaryDevices                                              */
/* 	"DataBit" : DataBit is of AuxiliaryDevices                                                */
/* 	"Parity" : Parity is of AuxiliaryDevices                                                  */
/* 	"StopBits" : StopBits is of AuxiliaryDevices                                              */
/* 	"Flow" : Flow is of AuxiliaryDevices                                                      */
/* 	"Description" : Description is of AuxiliaryDevices                                        */
/* 	"DeviceModelID" : DeviceModelID is of AuxiliaryDevices                                    */
/* 	"ElectronicDisplayID" : ElectronicDisplayID is of AuxiliaryDevices                        */
/* 	"DeviceID" : DeviceID is of AuxiliaryDevices                                              */  
create table "AuxiliaryDevices" ( 
	"AuxiliaryDeviceID" int identity not null,
	"ConnectionType" int null,
	"AuxiliaryDeviceIPAddress" nvarchar(50) null,
	"AuxiliaryDevicePort" nvarchar(20) null,
	"BaudRate" int null,
	"DataBit" int null,
	"Parity" nvarchar(10) null,
	"StopBits" nvarchar(10) null,
	"Flow" nvarchar(10) null,
	"Description" nvarchar(30) null,
	"DeviceModelID" int null,
	"ElectronicDisplayID" int null,
	"DeviceID" int null)  

go

alter table "AuxiliaryDevices"
	add constraint "AuxiliaryDevices_PK" primary key ("AuxiliaryDeviceID")   


go

/* Create new table "RecognitionStatistics".                                                  */
/* "RecognitionStatistics" : RecognitionStatistics [LogTable]                                 */
/* 	"RecognitionStatisticID" : RecognitionStatisticID identifies RecognitionStatistics        */
/* 	"CameraID" : CameraID is of RecognitionStatistics                                         */
/* 	"UserID" : UserID is of RecognitionStatistics                                             */
/* 	"RecognitionStatisticDateTime" : RecognitionStatisticDateTime is of RecognitionStatistics */
/* 	"SharedFileID" : SharedFileID is of RecognitionStatistics                                 */  
create table "RecognitionStatistics" ( 
	"RecognitionStatisticID" int identity not null,
	"CameraID" int not null,
	"UserID" int not null,
	"RecognitionStatisticDateTime" datetime not null,
	"SharedFileID" int null)  

go

alter table "RecognitionStatistics"
	add constraint "RecognitionStatistics_PK" primary key ("RecognitionStatisticID")   


go

/* Create new table "TrackingCoordinatesSettings".                                            */
/* "TrackingCoordinatesSettings" : Tables of RecognitionAreaLines                             */
/* 	"TrackingCoordinatesSettingID" : TrackingCoordinatesSettingID identifies TrackingCoordinatesSettings */
/* 	"CameraID" : CameraID is of TrackingCoordinatesSettings                                   */
/* 	"PositionNumber" : PositionNumber is of TrackingCoordinatesSettings                       */
/* 	"AbsolutePan" : AbsolutePan is of TrackingCoordinatesSettings                             */
/* 	"AbsoluteTilt" : AbsoluteTilt is of TrackingCoordinatesSettings                           */
/* 	"AbsoluteZoom" : AbsoluteZoom is of TrackingCoordinatesSettings                           */
/* 	"AbsoluteFocus" : AbsoluteFocus is of TrackingCoordinatesSettings                         */
/* 	"PresetNo" : PresetNo is of TrackingCoordinatesSettings                                   */
/* 	"TolerancePan" : TolerancePan is of TrackingCoordinatesSettings                           */
/* 	"ToleranceTilt" : ToleranceTilt is of TrackingCoordinatesSettings                         */
/* 	"AdditionalParams" : AdditionalParams is of TrackingCoordinatesSettings                   */  
create table "TrackingCoordinatesSettings" ( 
	"TrackingCoordinatesSettingID" int identity not null,
	"CameraID" int not null,
	"PositionNumber" int null,
	"AbsolutePan" int null,
	"AbsoluteTilt" int null,
	"AbsoluteZoom" int null,
	"AbsoluteFocus" int null,
	"PresetNo" int null,
	"TolerancePan" int null,
	"ToleranceTilt" int null,
	"AdditionalParams" nvarchar(max) null)  

go

alter table "TrackingCoordinatesSettings"
	add constraint "TrackingCoordinatesSettings_PK" primary key ("TrackingCoordinatesSettingID")   


go

/* Create new table "StreamingRelayServers".                                                  */
/* "StreamingRelayServers" : Table of StreamingRelayServers                                   */
/* 	"StreamingRelayServerID" : StreamingRelayServerID identifies StreamingRelayServers        */
/* 	"StorageServerID" : StorageServerID is of StreamingRelayServers                           */
/* 	"RelayServerLocalAdress" : If more than one failover is defined for the same StorageServer or Device, identifies the order in which they will be processed. */
/* 	"RelayServerPublicAddress" : RelayServerPublicAddress is of StreamingRelayServers         */
/* 	"RelayServerPort" : RelayServerPort is of StreamingRelayServers                           */  
create table "StreamingRelayServers" ( 
	"StreamingRelayServerID" int identity not null,
	"StorageServerID" int not null,
	"RelayServerLocalAdress" varchar(50) not null,
	"RelayServerPublicAddress" varchar(50) not null,
	"RelayServerPort" int not null)  

go

alter table "StreamingRelayServers"
	add constraint "StreamingRelayServers_PK" primary key ("StreamingRelayServerID")   


go

/* Create new table "VideoAnalyticsLog".                                                      */
/* "VideoAnalyticsLog" : VideoAnalyticsLogs [LogTable]                                        */
/* 	"VideoAnalyticsLogID" : VideoAnalyticsLogID identifies VideoAnalyticsLog                  */
/* 	"ObjClassID" : Object Class ID                                                            */
/* 	"ObjClassName" : Object Class Name                                                        */
/* 	"ObjHeight" : Object Height                                                               */
/* 	"ObjSpeed" : Object Speed                                                                 */
/* 	"ZoneName" : ZoneName of object detected                                                  */
/* 	"ObjColor1" : Threshold of Black                                                          */
/* 	"ObjColor2" : Threshold of Brown                                                          */
/* 	"ObjColor3" : Threshold of Gray                                                           */
/* 	"ObjColor4" : Threshold of Blue                                                           */
/* 	"ObjColor5" : Threshold of Green                                                          */
/* 	"ObjColor6" : Threshold of Cyan                                                           */
/* 	"ObjColor7" : Threshold of Red                                                            */
/* 	"ObjColor8" : Threshold of Pink                                                           */
/* 	"ObjColor9" : Threshold of Yellow                                                         */
/* 	"ObjColor10" : Threshold of White                                                         */
/* 	"ObjAreaLeft" : 영상분석된 객체의 영역정보 ( Left : 가상좌표계 - 0x00 ~ 0xffff )                           */
/* 	"ObjAreaTop" : 영상분석된 객체의 영역정보 ( Top: 가상좌표계 - 0x00 ~ 0xffff )                              */
/* 	"ObjAreaRight" : 영상분석된 객체의 영역정보 ( Right: 가상좌표계 - 0x00 ~ 0xffff )                          */
/* 	"ObjAreaBottom" : 영상분석된 객체의 영역정보 ( Bottom: 가상좌표계 - 0x00 ~ 0xffff )                        */
/* 	"ObjRecoAreaLeft" : LPR 의 경우 번호판 영역정보 ( Left : 가상좌표계 - 0x00 ~ 0xffff )                    */
/* 	"ObjRecoAreaTop" : LPR 의 경우 번호판 영역정보 ( Top : 가상좌표계 - 0x00 ~ 0xffff )                      */
/* 	"ObjRecoAreaRight" : LPR 의 경우 번호판 영역정보 ( Right : 가상좌표계 - 0x00 ~ 0xffff )                  */
/* 	"ObjRecoAreaBottom" : LPR 의 경우 번호판 영역정보 ( Bottom : 가상좌표계 - 0x00 ~ 0xffff )                */
/* 	"ObjLineCount" : 영상분석된 카운터 정보                                                             */
/* 	"ObjRecoName" : LPR 의 경우 인식된 번호판                                                          */  
create table "VideoAnalyticsLog" ( 
	"VideoAnalyticsLogID" int identity not null,
	"ObjClassID" int null,
	"ObjClassName" nvarchar(50) null,
	"ObjHeight" int null,
	"ObjSpeed" int null,
	"ZoneName" nvarchar(50) null,
	"ObjColor1" int null,
	"ObjColor2" int null,
	"ObjColor3" int null,
	"ObjColor4" int null,
	"ObjColor5" int null,
	"ObjColor6" int null,
	"ObjColor7" int null,
	"ObjColor8" int null,
	"ObjColor9" int null,
	"ObjColor10" int null,
	"ObjAreaLeft" int null,
	"ObjAreaTop" int null,
	"ObjAreaRight" int null,
	"ObjAreaBottom" int null,
	"ObjRecoAreaLeft" int null,
	"ObjRecoAreaTop" int null,
	"ObjRecoAreaRight" int null,
	"ObjRecoAreaBottom" int null,
	"ObjLineCount" int null,
	"ObjRecoName" nvarchar(50) null)  

go

alter table "VideoAnalyticsLog"
	add constraint "VideoAnalyticsLog_PK" primary key ("VideoAnalyticsLogID")   


go

/* Create new table "GISSchedules".                                                           */
/* "GISSchedules" : Table of GISSchedules                                                     */
/* 	"GISScheduleID" : GISScheduleID identifies GISSchedules                                   */
/* 	"ScheduleID" : ScheduleID is of GISSchedules                                              */
/* 	"UserID" : UserID is of GISSchedules                                                      */
/* 	"GISRadarSequenceGroupID" : GISRadarSequenceGroupID is of GISSchedules                    */
/* 	"Priority" : Priority is of GISSchedules                                                  */  
create table "GISSchedules" ( 
	"GISScheduleID" int identity not null,
	"ScheduleID" int not null,
	"UserID" int not null,
	"GISRadarSequenceGroupID" int not null,
	"Priority" int not null)  

go

alter table "GISSchedules"
	add constraint "GISSchedules_PK" primary key ("GISScheduleID")   


go

/* Create new table "GISRadarSequenceGroups".                                                 */
/* "GISRadarSequenceGroups" : Table of GISRadarSequenceGroups                                 */
/* 	"GISRadarSequenceGroupID" : GISRadarSequenceGroupID identifies GISRadarSequenceGroups     */
/* 	"SequenceGroupName" : SequenceGroupName is of GISRadarSequenceGroups                      */
/* 	"Radius" : Radius is of GISRadarSequenceGroups                                            */
/* 	"Interval" : Interval for scheduled patrol.                                               */
/* 	"IsIncreaseRadius" : Allow or deny increase of radar radius.                              */
/* 	"RadarRotationCount" : The rotation count of radar for while stay at specific point.      */
/* 	"UseRadarRotationCount" : Use or not use the rotation count of radar.                     */  
create table "GISRadarSequenceGroups" ( 
	"GISRadarSequenceGroupID" int identity not null,
	"SequenceGroupName" nvarchar(255) not null,
	"Radius" int not null,
	"Interval" int null,
	"IsIncreaseRadius" bit not null,
	"RadarRotationCount" int null,
	"UseRadarRotationCount" bit not null)  

go

alter table "GISRadarSequenceGroups"
	add constraint "GISRadarSequenceGroups_PK" primary key ("GISRadarSequenceGroupID")   


go

/* Create new table "GISRadarSequences".                                                      */
/* "GISRadarSequences" : Table of GISRadarSequences                                           */
/* 	"GISRadarSequenceID" : GISRadarSequenceID partly identifies GISRadarSequences             */
/* 	"Latitude" : Latitude is of GISRadarSequences                                             */
/* 	"Longitude" : Longitude is of GISRadarSequences                                           */
/* 	"Sequence" : Sequence is of GISRadarSequences                                             */
/* 	"Altitude" : Altitude is of GISRadarSequences                                             */
/* 	"GISRadarSequenceGroupID" : GISRadarSequenceGroupID is of GISRadarSequences               */  
create table "GISRadarSequences" ( 
	"GISRadarSequenceID" int identity not null,
	"Latitude" float not null,
	"Longitude" float not null,
	"Sequence" int not null,
	"Altitude" float null,
	"GISRadarSequenceGroupID" int not null)  

go

alter table "GISRadarSequences"
	add constraint "GISRadarSequences_PK" primary key ("GISRadarSequenceID")   


go

/* Create new table "Hosts".                                                                  */
/* "Hosts" : Table of Hosts                                                                   */
/* 	"HostID" : HostID identifies Hosts                                                        */
/* 	"HostTypeID" : HostTypeID is of Hosts                                                     */
/* 	"NetAddress" : NetAddress is of Hosts                                                     */
/* 	"Description" : Description is of Hosts                                                   */
/* 	"DateTimeAdded" : Date/time CMS was added to DB. Auto-set by server. [ReadOnly]           */
/* 	"LastDateTimeDisconnected" : Date/time CMS was disconnected from server.                  */
/* 	"UserID" : Logined user id.                                                               */
/* 	"ServerID" : Logined server id.                                                           */
/* 	"IsDeleted" : IsDeleted is of Hosts                                                       */  
create table "Hosts" ( 
	"HostID" int identity not null,
	"HostTypeID" int not null,
	"NetAddress" varchar(50) not null,
	"Description" nvarchar(80) null,
	"DateTimeAdded" datetime default GetDate() not null,
	"LastDateTimeDisconnected" datetime null,
	"UserID" int null,
	"ServerID" int null,
	"IsDeleted" bit default 0 not null)  

go

alter table "Hosts"
	add constraint "Hosts_PK" primary key ("HostID")   


go

/* Create new table "EndPointLog".                                                            */
/* "EndPointLog" : EndPointLog [LogTable]                                                     */
/* 	"EndPointLogID" : EndPointLogID identifies EndPointLog                                    */
/* 	"EventTypeID" : EventTypeID is of EndPointLog                                             */
/* 	"HostID" : HostID is of EndPointLog                                                       */
/* 	"UserID" : UserID is of EndPointLog                                                       */
/* 	"DeviceID" : DeviceID is of EndPointLog                                                   */
/* 	"EndPointFileID" : EndPointFileID is of EndPointLog                                       */
/* 	"EventDateTime" : EventDateTime is of EndPointLog                                         */
/* 	"Description" : Description is of EndPointLog                                             */
/* 	"LogDateTime" : Date and Time the event log entry was added.                              */  
create table "EndPointLog" ( 
	"EndPointLogID" int identity not null,
	"EventTypeID" int null,
	"HostID" int null,
	"UserID" int null,
	"DeviceID" int null,
	"EndPointFileID" int null,
	"EventDateTime" datetime not null,
	"Description" nvarchar(255) null,
	"LogDateTime" datetime not null)  

go

alter table "EndPointLog"
	add constraint "EndPointLog_PK" primary key ("EndPointLogID")   


go

/* Create new table "GISSafetyServices".                                                      */
/* "GISSafetyServices" : GISSafetyServices [LogTable]                                         */
/* 	"GISSafetyServiceID" : GISSafetyServiceID identifies GISSafetyServices                    */
/* 	"SOSEmergencyNumber" : 호출 번호                                                              */
/* 	"SOSTerminalNumber" : 단말기 번호                                                              */
/* 	"SOSCallTime" : 호출 시간                                                                     */
/* 	"SOSUserName" : 사용자                                                                       */
/* 	"SOSUserSex" : 성별                                                                         */
/* 	"SOSYearOfBirth" : 출생년도                                                                   */
/* 	"SOSGroup" : 소속                                                                           */
/* 	"SOSFirstAddress" : 주소1                                                                   */
/* 	"SOSSecondAddress" : 주소2                                                                  */
/* 	"SOSNewAddress" : 새주소                                                                     */
/* 	"IsMountainOfAddress" : 산                                                                 */
/* 	"ParentName" : 보호자 성명                                                                     */
/* 	"ParentContactNumber" : 보호자 연락처                                                           */
/* 	"SOSLatitude" : 위도                                                                        */
/* 	"SOSLongitude" : 경도                                                                       */
/* 	"SOSAltitude" : 고도                                                                        */
/* 	"SOSOperator" : 처리자                                                                       */
/* 	"SOSResultTime" : 처리 시간                                                                   */
/* 	"SOSLocationCity" : 시도                                                                    */
/* 	"SOSLocationGu" : 시군구                                                                     */
/* 	"SOSLocationDong" : 읍면동                                                                   */
/* 	"SOSAddressBunji" : 번지                                                                    */
/* 	"SOSAddressHo" : 호                                                                        */
/* 	"InformationLink" : 링크 정보                                                                 */
/* 	"Notes" : 처리 내용                                                                           */
/* 	"GISSafetyStateID" : GISSafetyStateID is of GISSafetyServices                             */  
create table "GISSafetyServices" ( 
	"GISSafetyServiceID" int identity not null,
	"SOSEmergencyNumber" nvarchar(30) null,
	"SOSTerminalNumber" nvarchar(30) null,
	"SOSCallTime" datetime null,
	"SOSUserName" nvarchar(30) null,
	"SOSUserSex" bit null,
	"SOSYearOfBirth" int null,
	"SOSGroup" nvarchar(30) null,
	"SOSFirstAddress" nvarchar(100) null,
	"SOSSecondAddress" nvarchar(100) null,
	"SOSNewAddress" nvarchar(100) null,
	"IsMountainOfAddress" bit null,
	"ParentName" nvarchar(30) null,
	"ParentContactNumber" nvarchar(30) null,
	"SOSLatitude" float null,
	"SOSLongitude" float null,
	"SOSAltitude" float null,
	"SOSOperator" nvarchar(30) null,
	"SOSResultTime" datetime null,
	"SOSLocationCity" nvarchar(30) null,
	"SOSLocationGu" nvarchar(30) null,
	"SOSLocationDong" nvarchar(30) null,
	"SOSAddressBunji" int null,
	"SOSAddressHo" int null,
	"InformationLink" nvarchar(100) null,
	"Notes" nvarchar(max) null,
	"GISSafetyStateID" int null)  

go

alter table "GISSafetyServices"
	add constraint "GISSafetyServices_PK" primary key ("GISSafetyServiceID")   


go

/* Create new table "GISSafetyStates".                                                        */
/* "GISSafetyStates" : Table of GISSafetyStates                                               */
/* 	"GISSafetyStateID" : GISSafetyStateID identifies GISSafetyStates                          */
/* 	"GISSafetyStateNameResID" : GISSafetyStateNameResID is of GISSafetyStates                 */
/* 	"IsDeleted" : IsDeleted is of GISSafetyStates                                             */  
create table "GISSafetyStates" ( 
	"GISSafetyStateID" int identity not null,
	"GISSafetyStateNameResID" int not null,
	"IsDeleted" bit not null)  

go

alter table "GISSafetyStates"
	add constraint "GISSafetyStates_PK" primary key ("GISSafetyStateID")   


go

/* Create new table "GISSOSCoordinates".                                                      */
/* "GISSOSCoordinates" : GISSOSCoordinates [LogTable]                                         */
/* 	"GISSOSCoordinateID" : GISSOSCoordinateID identifies GISSOSCoordinates                    */
/* 	"GISCallTime" : U-안전서비스 호출 시간                                                             */
/* 	"GISLatitude" : U-안전서비스 위도                                                                */
/* 	"GISLongitude" : U-안전서비스 경도                                                               */
/* 	"GISAltitude" : U-안전서비스 고도                                                                */
/* 	"GISSafetyServiceID" : GISSafetyServiceID is of GISSOSCoordinates                         */  
create table "GISSOSCoordinates" ( 
	"GISSOSCoordinateID" int identity not null,
	"GISCallTime" datetime not null,
	"GISLatitude" float not null,
	"GISLongitude" float not null,
	"GISAltitude" float null,
	"GISSafetyServiceID" int not null)  

go

alter table "GISSOSCoordinates"
	add constraint "GISSOSCoordinates_PK" primary key ("GISSOSCoordinateID")   


go

/* Create new table "AdministrativeDistricts".                                                */
/* "AdministrativeDistricts" : Table of AdministrativeDistricts                               */
/* 	"AdministrativeDistrictID" : AdministrativeDistrictID identifies AdministrativeDistricts  */
/* 	"DistrictLatitude" : 동 위도                                                                 */
/* 	"DistrictLongitude" : 동 경도                                                                */
/* 	"DistrictAltitude" : 동 고도                                                                 */
/* 	"SiteID" : SiteID is of AdministrativeDistricts                                           */  
create table "AdministrativeDistricts" ( 
	"AdministrativeDistrictID" int identity not null,
	"DistrictLatitude" float null,
	"DistrictLongitude" float null,
	"DistrictAltitude" float null,
	"SiteID" int null)  

go

alter table "AdministrativeDistricts"
	add constraint "AdministrativeDistricts_PK" primary key ("AdministrativeDistrictID")   


go

/* Create new table "AssetHistorys".                                                          */
/* "AssetHistorys" : AssetHistorys [LogTable]                                                 */
/* 	"AssetHistoryID" : AssetHistoryID identifies AssetHistorys                                */
/* 	"SiteID" : SiteID is of AssetHistorys                                                     */
/* 	"DeviceID" : DeviceID is of AssetHistorys                                                 */
/* 	"AssetChangeType" : Enum:AssetChangeTypeEnum Install, Remove, Destroy                     */
/* 	"DateTimeChanged" : DateTimeChanged is of AssetHistorys                                   */
/* 	"Description" : Description is of AssetHistorys                                           */  
create table "AssetHistorys" ( 
	"AssetHistoryID" int identity not null,
	"SiteID" int not null,
	"DeviceID" int not null,
	"AssetChangeType" int not null,
	"DateTimeChanged" datetime not null,
	"Description" nvarchar(80) null)  

go

alter table "AssetHistorys"
	add constraint "AssetHistorys_PK" primary key ("AssetHistoryID")   


go

/* Create new table "RecognitionServerLogs".                                                  */
/* "RecognitionServerLogs" : RecognitionServerLogs [LogTable]                                 */
/* 	"RecognitionServerLogID" : RecognitionServerLogID identifies RecognitionServerLogs        */
/* 	"RecognitionObjectName" : RecognitionObjectName is of RecognitionServerLogs               */
/* 	"PlateLeftTopX" : PlateLeftTopX is of RecognitionServerLogs                               */
/* 	"PlateLeftTopY" : PlateLeftTopY is of RecognitionServerLogs                               */
/* 	"PlateRightBottomX" : PlateRightBottomX is of RecognitionServerLogs                       */
/* 	"PlateRightBottomY" : PlateRightBottomY is of RecognitionServerLogs                       */
/* 	"Latitude" : Latitude is of RecognitionServerLogs                                         */
/* 	"Longitude" : Longitude is of RecognitionServerLogs                                       */
/* 	"Description" : Description is of RecognitionServerLogs                                   */
/* 	"Gender" : Gender is of RecognitionServerLogs                                             */
/* 	"Age" : Age is of RecognitionServerLogs                                                   */
/* 	"RecognitionRate" : RecognitionRate is of RecognitionServerLogs                           */
/* 	"CommandResult" : CommandResult is of RecognitionServerLogs                               */
/* 	"SavedFileID" : SavedFileID is of RecognitionServerLogs                                   */
/* 	"RecognitionViolationTypeID" : RecognitionViolationTypeID is of RecognitionServerLogs     */  
create table "RecognitionServerLogs" ( 
	"RecognitionServerLogID" int identity not null,
	"RecognitionObjectName" nvarchar(30) null,
	"PlateLeftTopX" int null,
	"PlateLeftTopY" int null,
	"PlateRightBottomX" int null,
	"PlateRightBottomY" int null,
	"Latitude" float null,
	"Longitude" float null,
	"Description" nvarchar(100) null,
	"Gender" nvarchar(10) null,
	"Age" int null,
	"RecognitionRate" int null,
	"CommandResult" nvarchar(30) null,
	"SavedFileID" int null,
	"RecognitionViolationTypeID" int null)  

go

alter table "RecognitionServerLogs"
	add constraint "RecognitionServerLogs_PK" primary key ("RecognitionServerLogID")   


go

/* Create new table "RecognitionViolationTypes".                                              */
/* "RecognitionViolationTypes" : Table of RecognitionViolationTypes                           */
/* 	"RecognitionViolationTypeID" : RecognitionViolationTypeID identifies RecognitionViolationTypes */
/* 	"ViolationTypeNameResID" : ViolationTypeNameResID is of RecognitionViolationTypes         */
/* 	"IsDeleted" : IsDeleted is of RecognitionViolationTypes                                   */  
create table "RecognitionViolationTypes" ( 
	"RecognitionViolationTypeID" int not null,
	"ViolationTypeNameResID" int not null,
	"IsDeleted" bit not null)  

go

alter table "RecognitionViolationTypes"
	add constraint "RecognitionViolationTypes_PK" primary key ("RecognitionViolationTypeID")   


go

/* Create new table "SmartPolices".                                                           */
/* "SmartPolices" : SmartPolices                                                              */
/* 	"SmartPoliceID" : SmartPoliceID identifies SmartPolices                                   */
/* 	"MobileProjectKey" : MobileProjectKey is of SmartPolices                                  */
/* 	"MobileRegisterKey" : MobileRegisterKey is of SmartPolices                                */
/* 	"MobileName" : MobileName is of SmartPolices                                              */
/* 	"DateTimeAdded" : DateTimeAdded is of SmartPolices                                        */
/* 	"CameraID" : CameraID is of SmartPolices                                                  */  
create table "SmartPolices" ( 
	"SmartPoliceID" int identity not null,
	"MobileProjectKey" nvarchar(255) not null,
	"MobileRegisterKey" nvarchar(255) not null,
	"MobileName" nvarchar(30) null,
	"DateTimeAdded" datetime null,
	"CameraID" int null)  

go

alter table "SmartPolices"
	add constraint "SmartPolices_PK" primary key ("SmartPoliceID")   


go

/* Create new table "ExceptionVehicles".                                                      */
/* "ExceptionVehicles" : Table of ExceptionVehicles                                           */
/* 	"ExceptionVehicleID" : ExceptionVehicleID identifies ExceptionVehicles                    */
/* 	"RegistrationNumber" : RegistrationNumber is of ExceptionVehicles                         */
/* 	"RegistrationDateTime" : RegistrationDateTime is of ExceptionVehicles                     */
/* 	"VehicleTypeName" : VehicleType is of ExceptionVehicles(ex: Sonata, K5, SM)               */
/* 	"Description" : Description is of ExceptionVehicles                                       */  
create table "ExceptionVehicles" ( 
	"ExceptionVehicleID" int identity not null,
	"RegistrationNumber" nvarchar(20) not null,
	"RegistrationDateTime" datetime not null,
	"VehicleTypeName" nvarchar(50) null,
	"Description" nvarchar(255) null)  

go

alter table "ExceptionVehicles"
	add constraint "ExceptionVehicles_PK" primary key ("ExceptionVehicleID")   


go

/* Create new table "RecognitionIgnoreLines".                                                 */
/* "RecognitionIgnoreLines" : Tables of RecognitionIgnoreLines                                */
/* 	"RecognitionIgnoreLineID" : RecognitionIgnoreLineID identifies RecognitionIgnoreLines     */
/* 	"RecognitionAreaLineID" : RecognitionAreaLineID is of RecognitionIgnoreLines              */
/* 	"Position1x" : Position1x is of RecognitionIgnoreLines                                    */
/* 	"Position1y" : Position1y is of RecognitionIgnoreLines                                    */
/* 	"Position2x" : Position2x is of RecognitionIgnoreLines                                    */
/* 	"Position2y" : Position2y is of RecognitionIgnoreLines                                    */
/* 	"Position3x" : Position3x is of RecognitionIgnoreLines                                    */
/* 	"Position3y" : Position3y is of RecognitionIgnoreLines                                    */
/* 	"Position4x" : Position4x is of RecognitionIgnoreLines                                    */
/* 	"Position4y" : Position4y is of RecognitionIgnoreLines                                    */  
create table "RecognitionIgnoreLines" ( 
	"RecognitionIgnoreLineID" int identity not null,
	"RecognitionAreaLineID" int null,
	"Position1x" int null,
	"Position1y" int null,
	"Position2x" int null,
	"Position2y" int null,
	"Position3x" int null,
	"Position3y" int null,
	"Position4x" int null,
	"Position4y" int null)  

go

alter table "RecognitionIgnoreLines"
	add constraint "RecognitionIgnoreLines_PK" primary key ("RecognitionIgnoreLineID")   


go

/* Create new table "FaceRegistrations".                                                      */
/* "FaceRegistrations" : Tables of RecognitionAreaSettings                                    */
/* 	"FaceRegistrationsID" : FaceRegistrationsID identifies FaceRegistrations                  */
/* 	"Name" : Name is of FaceRegistrations                                                     */
/* 	"Gender" : Gender is of FaceRegistrations                                                 */
/* 	"Birthday" : Birthday is of FaceRegistrations                                             */
/* 	"Address" : Address is of FaceRegistrations                                               */
/* 	"Notes" : Notes is of FaceRegistrations                                                   */
/* 	"FaceRegisterType" : 0=Undefined, 1=MissingChild, 2=Criminal Enum:FaceRegistrationType    */
/* 	"IncidentDateTime" : IncidentDateTime is of FaceRegistrations                             */
/* 	"AdditionalInfomation" : AdditionalInfomation is of FaceRegistrations                     */
/* 	"DateTimeAdded" : DateTimeAdded is of FaceRegistrations                                   */  
create table "FaceRegistrations" ( 
	"FaceRegistrationsID" int identity not null,
	"Name" nvarchar(50) not null,
	"Gender" nvarchar(20) null,
	"Birthday" datetime null,
	"Address" nvarchar(100) null,
	"Notes" nvarchar(500) null,
	"FaceRegisterType" int null,
	"IncidentDateTime" datetime null,
	"AdditionalInfomation" xml null,
	"DateTimeAdded" datetime not null)  

go

alter table "FaceRegistrations"
	add constraint "FaceRegistrations_PK" primary key ("FaceRegistrationsID")   


go

/* Create new table "FaceRegistrationImages".                                                 */
/* "FaceRegistrationImages" : Tables of RecognitionAreaSettings                               */
/* 	"FaceRegistrationImagesID" : FaceRegistrationImagesID identifies FaceRegistrationImages   */
/* 	"FaceRegistrationsID" : FaceRegistrationsID is of FaceRegistrationImages                  */
/* 	"SharedFileID" : SharedFileID is of FaceRegistrationImages                                */
/* 	"DefaultImage" : DefaultImage is of FaceRegistrationImages                                */  
create table "FaceRegistrationImages" ( 
	"FaceRegistrationImagesID" int identity not null,
	"FaceRegistrationsID" int null,
	"SharedFileID" int null,
	"DefaultImage" bit null)  

go

alter table "FaceRegistrationImages"
	add constraint "FaceRegistrationImages_PK" primary key ("FaceRegistrationImagesID")   


go

/* Create new table "RecognitionSchedules".                                                   */
/* "RecognitionSchedules" : Table of RecognitionSchedules                                     */
/* 	"RecognitionSchedulesID" : RecognitionSchedulesID identifies RecognitionSchedules         */
/* 	"ScheduleID" : ScheduleID is of RecognitionSchedules                                      */
/* 	"CameraID" : CameraID is of RecognitionSchedules                                          */  
create table "RecognitionSchedules" ( 
	"RecognitionSchedulesID" int identity not null,
	"ScheduleID" int not null,
	"CameraID" int not null)  

go

alter table "RecognitionSchedules"
	add constraint "RecognitionSchedules_PK" primary key ("RecognitionSchedulesID")   


go

/* Create new table "ElectronicDisplays".                                                     */
/* "ElectronicDisplays" : Table of AuxiliaryDevices                                           */
/* 	"ElectronicDisplayID" : ElectronicDisplayID identifies ElectronicDisplays                 */
/* 	"DwellTime" : DwellTime is of ElectronicDisplays(sec)                                     */
/* 	"RoomMessage1" : RoomMessage1 is of ElectronicDisplays                                    */
/* 	"RoomMessage2" : RoomMessage2 is of ElectronicDisplays                                    */
/* 	"RoomMessage3" : RoomMessage3 is of ElectronicDisplays                                    */
/* 	"RoomMessage4" : RoomMessage4 is of ElectronicDisplays                                    */
/* 	"RoomMessage5" : RoomMessage5 is of ElectronicDisplays                                    */
/* 	"MessageType1" : 0=Ordinary 1=Publicize 2=Recognition Enum:RoomMessageType                */
/* 	"MessageType2" : 0=Ordinary 1=Publicize 2=Recognition Enum:RoomMessageType                */
/* 	"MessageType3" : 0=Ordinary 1=Publicize 2=Recognition Enum:RoomMessageType                */
/* 	"MessageType4" : 0=Ordinary 1=Publicize 2=Recognition Enum:RoomMessageType                */
/* 	"MessageType5" : 0=Ordinary 1=Publicize 2=Recognition Enum:RoomMessageType                */
/* 	"ColorOption1" : ColorOption1 is of ElectronicDisplays                                    */
/* 	"ColorOption2" : ColorOption2 is of ElectronicDisplays                                    */
/* 	"ColorOption3" : ColorOption3 is of ElectronicDisplays                                    */
/* 	"ColorOption4" : ColorOption4 is of ElectronicDisplays                                    */
/* 	"ColorOption5" : ColorOption5 is of ElectronicDisplays                                    */  
create table "ElectronicDisplays" ( 
	"ElectronicDisplayID" int identity not null,
	"DwellTime" int null,
	"RoomMessage1" nvarchar(255) null,
	"RoomMessage2" nvarchar(255) null,
	"RoomMessage3" nvarchar(255) null,
	"RoomMessage4" nvarchar(255) null,
	"RoomMessage5" nvarchar(255) null,
	"MessageType1" int null,
	"MessageType2" int null,
	"MessageType3" int null,
	"MessageType4" int null,
	"MessageType5" int null,
	"ColorOption1" nvarchar(255) null,
	"ColorOption2" nvarchar(255) null,
	"ColorOption3" nvarchar(255) null,
	"ColorOption4" nvarchar(255) null,
	"ColorOption5" nvarchar(255) null)  

go

alter table "ElectronicDisplays"
	add constraint "ElectronicDisplays_PK" primary key ("ElectronicDisplayID")   


go

/* Create new table "FishEyeLensSettings".                                                    */
/* "FishEyeLensSettings" : Table of FishEyeLensSettings                                       */
/* 	"FishEyeLensSettingsID" : FishEyeLensSettingsID identifies FishEyeLensSettings            */
/* 	"CameraType" : 0=None 1=Oncam 2=Panogenics 3=ImmerVision 4=Vivotek 5=Generic CameraTypeEnum */
/* 	"ViewType" : 0=Vcam 1=Panorama 2=Panorama180 3=Panorama360 4=Panorama2x180 5=Quad 6=Rectilinear 7=FullViewPanorama 8=DualViewPanorama 9=FullHDPanorama ViewTypeEnum */
/* 	"MountType" : 0=Wall 1=Ceiling 2=Table 3=Auto 4=Floor 5=Ground MountTypeEnum              */
/* 	"ProjectionType" : 0=Linear 1=Spherical 2=Side 3=Angle ProjectionTypeEnum                 */
/* 	"LensType" : LensType is of FishEyeLensSettings                                           */
/* 	"LastPanValue" : LastPanValue is of FishEyeLensSettings                                   */
/* 	"LastTiltValue" : LastTiltValue is of FishEyeLensSettings                                 */
/* 	"LastZoomValue" : LastZoomValue is of FishEyeLensSettings                                 */  
create table "FishEyeLensSettings" ( 
	"FishEyeLensSettingsID" int identity not null,
	"CameraType" int null,
	"ViewType" int null,
	"MountType" int null,
	"ProjectionType" int null,
	"LensType" int null,
	"LastPanValue" float null,
	"LastTiltValue" float null,
	"LastZoomValue" float null)  

go

alter table "FishEyeLensSettings"
	add constraint "FishEyeLensSettings_PK" primary key ("FishEyeLensSettingsID")   


go

/* Add the remaining keys, constraints and indexes for the table "FailureChecks".             */
create index "IDX_FailureCheck_FailureID" on "FailureChecks" (
	"FailureID")  


go

create index "IDX_FailureCheck_IsDeleted" on "FailureChecks" (
	"IsDeleted")  


go

/* Add the remaining keys, constraints and indexes for the table "Failures".                  */
create index "IDX_Failures_DateTimeAdded" on "Failures" (
	"DateTimeAdded")  


go

create index "IDX_Failures_IsDeleted" on "Failures" (
	"IsDeleted")  


go

/* Add the remaining keys, constraints and indexes for the table "HealthCheckFailures".       */
create index "IDX_HealthCheckFailure_DateTimeFailure" on "HealthCheckFailures" (
	"DateTimeFailure")  


go

/* Add the remaining keys, constraints and indexes for the table "ResourceChecks".            */
create index "IDX_ResourceCheck_DateTimeChecked" on "ResourceChecks" (
	"DateTimeChecked")  


go

/* Add the remaining keys, constraints and indexes for the table "SignalStatuses".            */
create index "IDX_SignalStatus_DeviceID" on "SignalStatuses" (
	"DeviceID")  


go

create index "IDX_SignalStatus_DateTimeChecked" on "SignalStatuses" (
	"DateTimeChecked")  


go

create index "IDX_SignalStatus_StatisticsPeriod" on "SignalStatuses" (
	"StatisticsPeriod")  


go

/* Add the remaining keys, constraints and indexes for the table "StorageStatuses".           */
create index "IDX_StorageStatus_DeviceID" on "StorageStatuses" (
	"DeviceID")  


go

create index "IDX_StorageStatus_ServerID" on "StorageStatuses" (
	"ServerID")  


go

create index "IDX_StorageStatus_DateTimeChecked" on "StorageStatuses" (
	"DateTimeChecked")  


go

create index "IDX_StorageStatus_StatisticsPeriod" on "StorageStatuses" (
	"StatisticsPeriod")  


go

/* Add the remaining keys, constraints and indexes for the table "RecordingStatuses".         */
create index "IDX_RecordingStatus_DeviceID" on "RecordingStatuses" (
	"DeviceID")  


go

create index "IDX_RecordingStatus_DateTimeChecked" on "RecordingStatuses" (
	"DateTimeChecked")  


go

create index "IDX_RecordingStatus_StatisticsPeriod" on "RecordingStatuses" (
	"StatisticsPeriod")  


go

/* Add the remaining keys, constraints and indexes for the table "HealthChecks".              */
create index "IDX_HealthCheck_DeviceID" on "HealthChecks" (
	"DeviceID")  


go

create index "IDX_HealthCheck_ServerID" on "HealthChecks" (
	"ServerID")  


go

create index "IDX_HealthCheck_CheckEndTime" on "HealthChecks" (
	"CheckEndTime")  


go

create index "IDX_HealthCheck_StatisticsPeriod" on "HealthChecks" (
	"StatisticsPeriod")  


go

/* Add the remaining keys, constraints and indexes for the table "EndPointFiles".             */
create index "IDX_EndPointFiles_DeviceID" on "EndPointFiles" (
	"DeviceID")  


go

create index "IDX_EndPointFiles_FileDateTime" on "EndPointFiles" (
	"FileDateTime")  


go

create index "IDX_EndPointFiles_FileKey" on "EndPointFiles" (
	"FileKey")  


go

/* Add the remaining keys, constraints and indexes for the table "ActionLog".                 */
create index "IDX_ActionLog_DayInt" on "ActionLog" (
	"DayInt")  


go

create index "IDX_ActionLog_EventLogID" on "ActionLog" (
	"EventLogID")  


go

create index "IDX_ActionLog_AlarmID" on "ActionLog" (
	"AlarmID")  


go

/* Add the remaining keys, constraints and indexes for the table "EventLog".                  */
create index "IDX_EventLog_DayInt" on "EventLog" (
	"DayInt")  


go

create index "IDX_EventLog_DeviceID" on "EventLog" (
	"DeviceID")  


go

create index "IDX_EventLog_EventTypeID" on "EventLog" (
	"EventTypeID")  


go

/* Add the remaining keys, constraints and indexes for the table "Cameras".                   */
create index "IDX_Cameras_DeviceID" on "Cameras" (
	"DeviceID")  


go

/* Add the remaining keys, constraints and indexes for the table "AlarmChecks".               */
create index "IDX_AlarmChecks_ActionLogID" on "AlarmChecks" (
	"ActionLogID")  


go

/* Add the remaining keys, constraints and indexes for the table "RecordingSchedules".        */
create index "IDX_RecordingSchedules_CameraID" on "RecordingSchedules" (
	"CameraID")  


go

/* Add the remaining keys, constraints and indexes for the table "VideoAnalyticsLog".         */
create index "IDX_VideoAnalyticsLog_ObjRecoName" on "VideoAnalyticsLog" (
	"ObjRecoName")  


go

/* Add the remaining keys, constraints and indexes for the table "EndPointLog".               */
create index "IDX_EndPointLog_HostID" on "EndPointLog" (
	"HostID")  


go

create index "IDX_EndPointLog_UserID" on "EndPointLog" (
	"UserID")  


go

create index "IDX_EndPointLog_DeviceID" on "EndPointLog" (
	"DeviceID")  


go

create index "IDX_EndPointLog_EventDateTime" on "EndPointLog" (
	"EventDateTime")  


go

create index "IDX_EndPointLog_EndPointFileID" on "EndPointLog" (
	"EndPointFileID")  


go

/* Add the remaining keys, constraints and indexes for the table "RecognitionServerLogs".     */
create index "IDX_RecognitionServerLogs_RecognitionObjectName" on "RecognitionServerLogs" (
	"RecognitionObjectName")  


go

/* Add the remaining keys, constraints and indexes for the table "ExceptionVehicles".         */
create index "I1" on "ExceptionVehicles" (
	"RegistrationNumber")  


go

/* Add foreign key constraints to table "EventDataTypes".                                     */
alter table "EventDataTypes"
	add constraint "EventTypes_EventDataTypes_FK1" foreign key (
		"EventTypeID")
	 references "EventTypes" (
		"EventTypeID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "FailureChecks".                                      */
alter table "FailureChecks"
	add constraint "Failures_FailureChecks_FK1" foreign key (
		"FailureID")
	 references "Failures" (
		"FailureID") on update no action on delete cascade  

go

alter table "FailureChecks"
	add constraint "AlarmStatus_FailureChecks_FK1" foreign key (
		"AlarmStatusID")
	 references "AlarmStatus" (
		"AlarmStatusID") on update no action on delete set null  

go

alter table "FailureChecks"
	add constraint "Users_FailureChecks_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete set null  

go

/* Add foreign key constraints to table "Failures".                                           */
alter table "Failures"
	add constraint "Devices_Failures_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "Failures"
	add constraint "Servers_Failures_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "HealthCheckFailures".                                */
alter table "HealthCheckFailures"
	add constraint "RecordingStatuses_HealthCheckFailures_FK1" foreign key (
		"RecordingStatusID")
	 references "RecordingStatuses" (
		"RecordingStatusID") on update no action on delete no action  

go

alter table "HealthCheckFailures"
	add constraint "SignalStatuses_HealthCheckFailures_FK1" foreign key (
		"SignalStatusID")
	 references "SignalStatuses" (
		"SignalStatusID") on update no action on delete no action  

go

alter table "HealthCheckFailures"
	add constraint "StorageStatuses_HealthCheckFailures_FK1" foreign key (
		"StorageStatusID")
	 references "StorageStatuses" (
		"StorageStatusID") on update no action on delete no action  

go

/* Add foreign key constraints to table "ResourceChecks".                                     */
alter table "ResourceChecks"
	add constraint "SystemSpecs_ResourceChecks_FK1" foreign key (
		"SystemSpecID")
	 references "SystemSpecs" (
		"SystemSpecID") on update no action on delete cascade  

go

alter table "ResourceChecks"
	add constraint "Devices_ResourceChecks_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

alter table "ResourceChecks"
	add constraint "Hosts_ResourceChecks_FK1" foreign key (
		"HostID")
	 references "Hosts" (
		"HostID") on update no action on delete no action  

go

/* Add foreign key constraints to table "SystemSpecs".                                        */
alter table "SystemSpecs"
	add constraint "Devices_SystemSpecs_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "SystemSpecs"
	add constraint "Hosts_SystemSpecs_FK1" foreign key (
		"HostID")
	 references "Hosts" (
		"HostID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "SignalStatuses".                                     */
alter table "SignalStatuses"
	add constraint "HealthChecks_SignalStatuses_FK1" foreign key (
		"HealthCheckID")
	 references "HealthChecks" (
		"HealthCheckID") on update no action on delete cascade  

go

alter table "SignalStatuses"
	add constraint "Devices_SignalStatuses_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

/* Add foreign key constraints to table "StorageStatuses".                                    */
alter table "StorageStatuses"
	add constraint "HealthChecks_StorageStatuses_FK1" foreign key (
		"HealthCheckID")
	 references "HealthChecks" (
		"HealthCheckID") on update no action on delete cascade  

go

alter table "StorageStatuses"
	add constraint "Servers_StorageStatuses_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete no action  

go

alter table "StorageStatuses"
	add constraint "Devices_StorageStatuses_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecordingStatuses".                                  */
alter table "RecordingStatuses"
	add constraint "HealthChecks_RecordingStatuses_FK1" foreign key (
		"HealthCheckID")
	 references "HealthChecks" (
		"HealthCheckID") on update no action on delete cascade  

go

alter table "RecordingStatuses"
	add constraint "Devices_RecordingStatuses_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

/* Add foreign key constraints to table "HealthChecks".                                       */
alter table "HealthChecks"
	add constraint "Servers_HealthChecks_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

alter table "HealthChecks"
	add constraint "Devices_HealthChecks_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "AlarmOrgGroups".                                     */
alter table "AlarmOrgGroups"
	add constraint "AlarmCategories_AlarmOrgGroups_FK1" foreign key (
		"AlarmCategoryID")
	 references "AlarmCategories" (
		"AlarmCategoryID") on update no action on delete no action  

go

alter table "AlarmOrgGroups"
	add constraint "SharedFiles_AlarmOrgGroups_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete no action  

go

alter table "AlarmOrgGroups"
	add constraint "CustomGroups_AlarmOrgGroups_FK1" foreign key (
		"CustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete no action  

go

/* Add foreign key constraints to table "NetAddressFilters".                                  */
alter table "NetAddressFilters"
	add constraint "Users_NetAddressFilters_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "NetAddressFilters"
	add constraint "Roles_NetAddressFilters_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "NetAddressFilters"
	add constraint "HostTypes_NetAddressFilters_FK1" foreign key (
		"HostTypeID")
	 references "HostTypes" (
		"HostTypeID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "EndPointFiles".                                      */
alter table "EndPointFiles"
	add constraint "Devices_EndPointFiles_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

alter table "EndPointFiles"
	add constraint "Servers_EndPointFiles_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "DevicePermissionSettings".                           */
alter table "DevicePermissionSettings"
	add constraint "DevicePermissions_DevicePermissionSettings_FK1" foreign key (
		"DevicePermissionID")
	 references "DevicePermissions" (
		"DevicePermissionID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "PTZCalibrationZoomSettings".                         */
alter table "PTZCalibrationZoomSettings"
	add constraint "PTZCalibrationSettings_PTZCalibrationZoomSettings_FK1" foreign key (
		"PTZCalibrationSettingID")
	 references "PTZCalibrationSettings" (
		"PTZCalibrationSettingID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "PTZCalibrationSettings".                             */
alter table "PTZCalibrationSettings"
	add constraint "Cameras_PTZCalibrationSettings_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "GISBookmarks".                                       */
alter table "GISBookmarks"
	add constraint "Markers_GISBookmarks_FK1" foreign key (
		"MarkerID")
	 references "Markers" (
		"MarkerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "FacilityAttributes".                                 */
alter table "FacilityAttributes"
	add constraint "FacilityTypes_FacilityAttributes_FK1" foreign key (
		"FacilityTypeID")
	 references "FacilityTypes" (
		"FacilityTypeID") on update no action on delete no action  

go

/* Add foreign key constraints to table "FacilityValues".                                     */
alter table "FacilityValues"
	add constraint "FacilityAttributes_FacilityValues_FK1" foreign key (
		"FacilityAttributesID")
	 references "FacilityAttributes" (
		"FacilityAttributesID") on update no action on delete no action  

go

alter table "FacilityValues"
	add constraint "Markers_FacilityValues_FK1" foreign key (
		"MarkerID")
	 references "Markers" (
		"MarkerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "TrackingCameraConnections".                          */
alter table "TrackingCameraConnections"
	add constraint "Cameras_TrackingCameraConnections_FK1" foreign key (
		"TrackingCameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

alter table "TrackingCameraConnections"
	add constraint "Cameras_TrackingCameraConnections_FK2" foreign key (
		"FixedCameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

/* Add foreign key constraints to table "FailoverHistorys".                                   */
alter table "FailoverHistorys"
	add constraint "StorageServers_FailoverHistorys_FK1" foreign key (
		"FailedSSID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

alter table "FailoverHistorys"
	add constraint "StorageServers_FailoverHistorys_FK2" foreign key (
		"FailoverSSID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "FailoverDevices".                                    */
alter table "FailoverDevices"
	add constraint "Devices_FailoverDevices_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

alter table "FailoverDevices"
	add constraint "FailoverHistorys_FailoverDevices_FK1" foreign key (
		"FailoverHistoryID")
	 references "FailoverHistorys" (
		"FailoverHistoryID") on update no action on delete no action  

go

/* Add foreign key constraints to table "DeviceSettings".                                     */
alter table "DeviceSettings"
	add constraint "Devices_DeviceSettings_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Licenses".                                           */
alter table "Licenses"
	add constraint "Servers_Licenses_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "CameraListItems".                                    */
alter table "CameraListItems"
	add constraint "CameraLists_CameraListItems_FK1" foreign key (
		"CameraListID")
	 references "CameraLists" (
		"CameraListID") on update no action on delete cascade  

go

alter table "CameraListItems"
	add constraint "Cameras_CameraListItems_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "EventInputDevices".                                  */
alter table "EventInputDevices"
	add constraint "Cameras_EventInputDevices_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

alter table "EventInputDevices"
	add constraint "Devices_EventInputDevices_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MacroPermissions".                                   */
alter table "MacroPermissions"
	add constraint "Roles_MacroPermissions_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "MacroPermissions"
	add constraint "Users_MacroPermissions_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "MacroPermissions"
	add constraint "Permissions_MacroPermissions_FK1" foreign key (
		"PermissionID")
	 references "Permissions" (
		"PermissionID") on update no action on delete cascade  

go

alter table "MacroPermissions"
	add constraint "Macros_MacroPermissions_FK1" foreign key (
		"MacroID")
	 references "Macros" (
		"MacroID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "SitePermissions".                                    */
alter table "SitePermissions"
	add constraint "Sites_SitePermissions_FK1" foreign key (
		"SiteID")
	 references "Sites" (
		"SiteID") on update no action on delete cascade  

go

alter table "SitePermissions"
	add constraint "Roles_SitePermissions_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "SitePermissions"
	add constraint "Users_SitePermissions_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "SitePermissions"
	add constraint "Permissions_SitePermissions_FK1" foreign key (
		"PermissionID")
	 references "Permissions" (
		"PermissionID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MacroCommands".                                      */
alter table "MacroCommands"
	add constraint "Macros_MacroCommands_FK1" foreign key (
		"MacroID")
	 references "Macros" (
		"MacroID") on update no action on delete no action  

go

alter table "MacroCommands"
	add constraint "ActionItems_MacroCommands_FK1" foreign key (
		"ActionItemID")
	 references "ActionItems" (
		"ActionItemID") on update no action on delete cascade  

go

alter table "MacroCommands"
	add constraint "MacroCommands_Next_MacroCommands_FK" foreign key (
		"NextCommandID")
	 references "MacroCommands" (
		"MacroCommandID") on update no action on delete no action  

go

alter table "MacroCommands"
	add constraint "MacroCommands_Jump_MacroCommands_FK" foreign key (
		"JumpCommandID")
	 references "MacroCommands" (
		"MacroCommandID") on update no action on delete no action  

go

/* Add foreign key constraints to table "PresetTours".                                        */
alter table "PresetTours"
	add constraint "Tours_PresetTours_FK1" foreign key (
		"TourID")
	 references "Tours" (
		"TourID") on update no action on delete cascade  

go

alter table "PresetTours"
	add constraint "CameraItems_PresetTours_FK1" foreign key (
		"CameraItemID")
	 references "CameraItems" (
		"CameraItemID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Tours".                                              */
alter table "Tours"
	add constraint "Cameras_Tours_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "CameraItems".                                        */
alter table "CameraItems"
	add constraint "Cameras_CameraItems_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Sequence_x_Views".                                   */
alter table "Sequence_x_Views"
	add constraint "Sequences_Sequence_x_Views_FK1" foreign key (
		"SequenceID")
	 references "Sequences" (
		"SequenceID") on update no action on delete cascade  

go

alter table "Sequence_x_Views"
	add constraint "ViewLayouts_Sequence_x_Views_FK1" foreign key (
		"ViewLayoutID")
	 references "ViewLayouts" (
		"ViewLayoutID") on update no action on delete cascade  

go

alter table "Sequence_x_Views"
	add constraint "Cameras_Sequence_x_Views_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

alter table "Sequence_x_Views"
	add constraint "Maps_Sequence_x_Views_FK1" foreign key (
		"MapID")
	 references "Maps" (
		"MapID") on update no action on delete cascade  

go

alter table "Sequence_x_Views"
	add constraint "SharedFiles_Sequence_x_Views_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Sequences".                                          */
alter table "Sequences"
	add constraint "Users_Sequences_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "ProximityCameras".                                   */
alter table "ProximityCameras"
	add constraint "Cameras_ProximityCameras_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

alter table "ProximityCameras"
	add constraint "Cameras_ProximityCameras_FK2" foreign key (
		"RelatedCameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Filters".                                            */
alter table "Filters"
	add constraint "Users_Filters_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "WeekCoverages".                                      */
alter table "WeekCoverages"
	add constraint "Schedules_WeekCoverages_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "SharedFiles".                                        */
alter table "SharedFiles"
	add constraint "Users_SharedFiles_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete no action  

go

/* Add foreign key constraints to table "SSFailovers".                                        */
alter table "SSFailovers"
	add constraint "StorageServers_SSFailovers_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

alter table "SSFailovers"
	add constraint "Devices_SSFailovers_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "SSFailovers"
	add constraint "StorageServers_SSFailovers_FK2" foreign key (
		"FailoverSSID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecordingSpaces".                                    */
alter table "RecordingSpaces"
	add constraint "RecordingStorages_RecordingSpaces_FK1" foreign key (
		"RecordingStorageID")
	 references "RecordingStorages" (
		"RecordingStorageID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Alarms".                                             */
alter table "Alarms"
	add constraint "AlarmPriorities_Alarms_FK1" foreign key (
		"AlarmPriorityID")
	 references "AlarmPriorities" (
		"AlarmPriorityID") on update no action on delete cascade  

go

alter table "Alarms"
	add constraint "AlarmCategories_Alarms_FK1" foreign key (
		"AlarmCategoryID")
	 references "AlarmCategories" (
		"AlarmCategoryID") on update no action on delete cascade  

go

alter table "Alarms"
	add constraint "Cameras_Alarms_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Macros".                                             */
alter table "Macros"
	add constraint "MacroCommands_Macros_FK1" foreign key (
		"FirstCommandID")
	 references "MacroCommands" (
		"MacroCommandID") on update no action on delete set null  

go

alter table "Macros"
	add constraint "Users_Macros_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete no action  

go

/* Add foreign key constraints to table "NetworkDrives".                                      */
alter table "NetworkDrives"
	add constraint "StorageServers_NetworkDrives_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Bookmarks".                                          */
alter table "Bookmarks"
	add constraint "Users_Bookmarks_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "Bookmarks"
	add constraint "Cameras_Bookmarks_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "EmergencyGroupAgents".                               */
alter table "EmergencyGroupAgents"
	add constraint "EmergencyGroups_EmergencyGroupAgents_FK1" foreign key (
		"EmergencyGroupID")
	 references "EmergencyGroups" (
		"EmergencyGroupID") on update no action on delete cascade  

go

alter table "EmergencyGroupAgents"
	add constraint "EmergencyAgents_EmergencyGroupAgents_FK1" foreign key (
		"EmergencyAgentID")
	 references "EmergencyAgents" (
		"EmergencyAgentID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "RecordingDevices".                                   */
alter table "RecordingDevices"
	add constraint "Devices_RecordingDevices_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "RecordingDevices"
	add constraint "RecordingSpaces_RecordingDevices_FK1" foreign key (
		"RecordingSpaceID")
	 references "RecordingSpaces" (
		"RecordingSpaceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "RecordingStorages".                                  */
alter table "RecordingStorages"
	add constraint "StorageServers_RecordingStorages_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete cascade  

go

alter table "RecordingStorages"
	add constraint "NetworkDrives_RecordingStorages_FK1" foreign key (
		"NetworkDriveID")
	 references "NetworkDrives" (
		"NetworkDriveID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "SendGroupAssignments".                               */
alter table "SendGroupAssignments"
	add constraint "Users_SendGroupAssignments_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "SendGroupAssignments"
	add constraint "Roles_SendGroupAssignments_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "SendGroupAssignments"
	add constraint "MessageSendGroups_SendGroupAssignments_FK1" foreign key (
		"MessageSendGroupID")
	 references "MessageSendGroups" (
		"MessageSendGroupID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "UserIcons".                                          */
alter table "UserIcons"
	add constraint "SharedFiles_UserIcons_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MapOrgGroups".                                       */
alter table "MapOrgGroups"
	add constraint "Maps_MapOrgGroups_FK1" foreign key (
		"MapID")
	 references "Maps" (
		"MapID") on update no action on delete cascade  

go

alter table "MapOrgGroups"
	add constraint "CustomGroups_MapOrgGroups_FK1" foreign key (
		"CustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Maps".                                               */
alter table "Maps"
	add constraint "SharedFiles_Maps_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Markers".                                            */
alter table "Markers"
	add constraint "Servers_Markers_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

alter table "Markers"
	add constraint "Devices_Markers_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "Markers"
	add constraint "Maps_Markers_FK1" foreign key (
		"MapID")
	 references "Maps" (
		"MapID") on update no action on delete cascade  

go

alter table "Markers"
	add constraint "UserIcons_Markers_FK1" foreign key (
		"UserIconID")
	 references "UserIcons" (
		"UserIconID") on update no action on delete set null  

go

alter table "Markers"
	add constraint "Maps_Markers_FK2" foreign key (
		"TargetMapID")
	 references "Maps" (
		"MapID") on update no action on delete no action  

go

alter table "Markers"
	add constraint "FacilityTypes_Markers_FK1" foreign key (
		"FacilityTypeID")
	 references "FacilityTypes" (
		"FacilityTypeID") on update no action on delete no action  

go

alter table "Markers"
	add constraint "Sites_Markers_FK1" foreign key (
		"SiteID")
	 references "Sites" (
		"SiteID") on update no action on delete no action  

go

/* Add foreign key constraints to table "MapActions".                                         */
alter table "MapActions"
	add constraint "ActionItems_MapActions_FK1" foreign key (
		"ActionItemID")
	 references "ActionItems" (
		"ActionItemID") on update no action on delete cascade  

go

alter table "MapActions"
	add constraint "Markers_MapActions_FK1" foreign key (
		"MarkerID")
	 references "Markers" (
		"MarkerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "TileAssignments".                                    */
alter table "TileAssignments"
	add constraint "ViewLayouts_TileAssignments_FK1" foreign key (
		"ViewLayoutID")
	 references "ViewLayouts" (
		"ViewLayoutID") on update no action on delete cascade  

go

alter table "TileAssignments"
	add constraint "Cameras_TileAssignments_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

alter table "TileAssignments"
	add constraint "Maps_TileAssignments_FK1" foreign key (
		"MapID")
	 references "Maps" (
		"MapID") on update no action on delete cascade  

go

alter table "TileAssignments"
	add constraint "SharedFiles_TileAssignments_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete cascade  

go

alter table "TileAssignments"
	add constraint "FishEyeLensSettings_TileAssignments_FK1" foreign key (
		"FishEyeLensSettingsID")
	 references "FishEyeLensSettings" (
		"FishEyeLensSettingsID") on update no action on delete no action  

go

/* Add foreign key constraints to table "ResourceTexts".                                      */
alter table "ResourceTexts"
	add constraint "Languages_ResourceTexts_FK1" foreign key (
		"LanguageID")
	 references "Languages" (
		"LanguageID") on update no action on delete cascade  

go

alter table "ResourceTexts"
	add constraint "Resources_ResourceTexts_FK1" foreign key (
		"ResourceID")
	 references "Resources" (
		"ResourceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "LayoutTiles".                                        */
alter table "LayoutTiles"
	add constraint "Layouts_LayoutTiles_FK1" foreign key (
		"LayoutID")
	 references "Layouts" (
		"LayoutID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "ViewLayouts".                                        */
alter table "ViewLayouts"
	add constraint "Layouts_ViewLayouts_FK1" foreign key (
		"LayoutID")
	 references "Layouts" (
		"LayoutID") on update no action on delete cascade  

go

alter table "ViewLayouts"
	add constraint "Bookmarks_ViewLayouts_FK1" foreign key (
		"BookmarkID")
	 references "Bookmarks" (
		"BookmarkID") on update no action on delete no action  

go

alter table "ViewLayouts"
	add constraint "CustomGroups_ViewLayouts_FK1" foreign key (
		"CustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete cascade  

go

alter table "ViewLayouts"
	add constraint "Users_ViewLayouts_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete no action  

go

alter table "ViewLayouts"
	add constraint "Devices_ViewLayouts_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "ViewLayouts"
	add constraint "ServiceCodes_ViewLayouts_FK1" foreign key (
		"ServicesCodeID")
	 references "ServiceCodes" (
		"ServiceCodeID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Sites".                                              */
alter table "Sites"
	add constraint "CustomGroups_Sites_FK1" foreign key (
		"CustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete set null  

go

/* Add foreign key constraints to table "CustomGroups".                                       */
alter table "CustomGroups"
	add constraint "OrgGroups_OrgGroups_FK" foreign key (
		"ParentCustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete no action  

go

/* Add foreign key constraints to table "EventActions".                                       */
alter table "EventActions"
	add constraint "Events_EventActions_FK" foreign key (
		"EventID")
	 references "Events" (
		"EventID") on update no action on delete cascade  

go

alter table "EventActions"
	add constraint "Actions_EventActions_FK" foreign key (
		"ActionItemID")
	 references "ActionItems" (
		"ActionItemID") on update no action on delete cascade  

go

alter table "EventActions"
	add constraint "RecordingSchedules_EventActions_FK1" foreign key (
		"RecordingScheduleID")
	 references "RecordingSchedules" (
		"RecordingScheduleID") on update no action on delete set null  

go

alter table "EventActions"
	add constraint "Schedules_EventActions_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete set null  

go

/* Add foreign key constraints to table "ActionLog".                                          */
alter table "ActionLog"
	add constraint "EventLog_ActionLog_FK" foreign key (
		"EventLogID")
	 references "EventLog" (
		"EventLogID") on update no action on delete set null  

go

alter table "ActionLog"
	add constraint "ActionTypes_ActionLog_FK1" foreign key (
		"ActionTypeID")
	 references "ActionTypes" (
		"ActionTypeID") on update no action on delete set null  

go

alter table "ActionLog"
	add constraint "Alarms_ActionLog_FK1" foreign key (
		"AlarmID")
	 references "Alarms" (
		"AlarmID") on update no action on delete set null  

go

/* Add foreign key constraints to table "EventActionRelations".                               */
alter table "EventActionRelations"
	add constraint "EventTypes_EventActionRelation_FK" foreign key (
		"EventTypeID")
	 references "EventTypes" (
		"EventTypeID") on update no action on delete cascade  

go

alter table "EventActionRelations"
	add constraint "ActionTypes_EventActionRelations_FK" foreign key (
		"ActionTypeID")
	 references "ActionTypes" (
		"ActionTypeID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "CameraAudioConnections".                             */
alter table "CameraAudioConnections"
	add constraint "Cameras_CameraAudioConnections_FK" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

alter table "CameraAudioConnections"
	add constraint "Audios_CameraAudioConnections_FK" foreign key (
		"AudioID")
	 references "Audios" (
		"AudioID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Sensors".                                            */
alter table "Sensors"
	add constraint "Devices_Sensors_FK" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "EventLog".                                           */
alter table "EventLog"
	add constraint "EventTypes_EventLog_FK1" foreign key (
		"EventTypeID")
	 references "EventTypes" (
		"EventTypeID") on update no action on delete cascade  

go

alter table "EventLog"
	add constraint "Devices_EventLog_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete set null  

go

alter table "EventLog"
	add constraint "Users_EventLog_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete set null  

go

alter table "EventLog"
	add constraint "Servers_EventLog_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete set null  

go

alter table "EventLog"
	add constraint "Schedules_EventLog_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete set null  

go

alter table "EventLog"
	add constraint "VideoAnalyticsLog_EventLog_FK1" foreign key (
		"VideoAnalyticsLogID")
	 references "VideoAnalyticsLog" (
		"VideoAnalyticsLogID") on update no action on delete no action  

go

alter table "EventLog"
	add constraint "RecognitionServerLogs_EventLog_FK1" foreign key (
		"RecognitionServerLogID")
	 references "RecognitionServerLogs" (
		"RecognitionServerLogID") on update no action on delete no action  

go

alter table "EventLog"
	add constraint "Hosts_EventLog_FK1" foreign key (
		"HostID")
	 references "Hosts" (
		"HostID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Events".                                             */
alter table "Events"
	add constraint "EventTypes_Events_FK" foreign key (
		"EventTypeID")
	 references "EventTypes" (
		"EventTypeID") on update no action on delete cascade  

go

alter table "Events"
	add constraint "Users_Events_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "Events"
	add constraint "Devices_Events_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "Events"
	add constraint "Servers_Events_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

alter table "Events"
	add constraint "Schedules_Events_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete no action  

go

/* Add foreign key constraints to table "DeviceModels".                                       */
alter table "DeviceModels"
	add constraint "DeviceTypes_Devices_FK" foreign key (
		"DeviceTypeID")
	 references "DeviceTypes" (
		"DeviceTypeID") on update no action on delete cascade  

go

alter table "DeviceModels"
	add constraint "Manufacturers_DeviceModels_FK" foreign key (
		"ManufacturerID")
	 references "Manufacturers" (
		"ManufacturerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "UserSettings".                                       */
alter table "UserSettings"
	add constraint "User_UserSettings_FK" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "StorageServers".                                     */
alter table "StorageServers"
	add constraint "Servers_StorageServers_FK" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Cameras".                                            */
alter table "Cameras"
	add constraint "Devices_Cameras_FK" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "VideoAnalysisSettings_Cameras_FK1" foreign key (
		"VideoAnalysisSettingID")
	 references "VideoAnalysisSettings" (
		"VideoAnalysisSettingID") on update no action on delete set null  

go

alter table "Cameras"
	add constraint "Resolutions_Cameras_FK1" foreign key (
		"LowResolutionID")
	 references "Resolutions" (
		"ResolutionID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "Resolutions_Cameras_FK2" foreign key (
		"NormalResolutionID")
	 references "Resolutions" (
		"ResolutionID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "Resolutions_Cameras_FK3" foreign key (
		"LiveResolutionID")
	 references "Resolutions" (
		"ResolutionID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "Resolutions_Cameras_FK4" foreign key (
		"HardwareResolutionID")
	 references "Resolutions" (
		"ResolutionID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "RecognitionSettings_Cameras_FK1" foreign key (
		"RecognitionSettingID")
	 references "RecognitionSettings" (
		"RecognitionSettingID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "Cameras_Cameras_FK1" foreign key (
		"TrackingPTZCameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

alter table "Cameras"
	add constraint "FishEyeLensSettings_Cameras_FK1" foreign key (
		"FishEyeLensSettingsID")
	 references "FishEyeLensSettings" (
		"FishEyeLensSettingsID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Devices".                                            */
alter table "Devices"
	add constraint "DeviceModels_Devices_FK" foreign key (
		"DeviceModelID")
	 references "DeviceModels" (
		"DeviceModelID") on update no action on delete cascade  

go

alter table "Devices"
	add constraint "CustomGroups_Devices_FK1" foreign key (
		"CustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete set null  

go

alter table "Devices"
	add constraint "Devices_Devices_FK1" foreign key (
		"ParentDeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

alter table "Devices"
	add constraint "Sites_Devices_FK1" foreign key (
		"SiteID")
	 references "Sites" (
		"SiteID") on update no action on delete set null  

go

alter table "Devices"
	add constraint "StorageServers_Devices_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

alter table "Devices"
	add constraint "Servers_Devices_FK1" foreign key (
		"InteropServerID")
	 references "Servers" (
		"ServerID") on update no action on delete set null  

go

/* Add foreign key constraints to table "Servers".                                            */
alter table "Servers"
	add constraint "Sites_Servers_FK1" foreign key (
		"SiteID")
	 references "Sites" (
		"SiteID") on update no action on delete set null  

go

alter table "Servers"
	add constraint "Servers_Servers_FK1" foreign key (
		"PrimaryServerID")
	 references "Servers" (
		"ServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "ServerSettings".                                     */
alter table "ServerSettings"
	add constraint "Servers_ServerSettings_FK" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Users".                                              */
alter table "Users"
	add constraint "Languages_Users_FK1" foreign key (
		"LanguageID")
	 references "Languages" (
		"LanguageID") on update no action on delete set null  

go

alter table "Users"
	add constraint "PasswordRules_Users_FK1" foreign key (
		"PasswordRuleID")
	 references "PasswordRules" (
		"PasswordRuleID") on update no action on delete set null  

go

alter table "Users"
	add constraint "SmartPolices_Users_FK1" foreign key (
		"SmartPoliceID")
	 references "SmartPolices" (
		"SmartPoliceID") on update no action on delete no action  

go

alter table "Users"
	add constraint "CustomGroups_Users_FK1" foreign key (
		"CustomGroupID")
	 references "CustomGroups" (
		"CustomGroupID") on update no action on delete no action  

go

/* Add foreign key constraints to table "ActionItems".                                        */
alter table "ActionItems"
	add constraint "ActionTypes_Actions_FK" foreign key (
		"ActionTypeID")
	 references "ActionTypes" (
		"ActionTypeID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "Devices_ActionItems_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

alter table "ActionItems"
	add constraint "Users_ActionItems_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete no action  

go

alter table "ActionItems"
	add constraint "MessageSendGroups_ActionItems_FK1" foreign key (
		"MessageSendGroupID")
	 references "MessageSendGroups" (
		"MessageSendGroupID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "Servers_ActionItems_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete no action  

go

alter table "ActionItems"
	add constraint "Roles_ActionItems_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "EmergencyGroups_ActionItems_FK1" foreign key (
		"EmergencyGroupID")
	 references "EmergencyGroups" (
		"EmergencyGroupID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "EmergencyAgents_ActionItems_FK1" foreign key (
		"EmergencyAgentID")
	 references "EmergencyAgents" (
		"EmergencyAgentID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "Alarms_ActionItems_FK1" foreign key (
		"AlarmID")
	 references "Alarms" (
		"AlarmID") on update no action on delete no action  

go

alter table "ActionItems"
	add constraint "SharedFiles_ActionItems_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "Alarms_ActionItems_FK2" foreign key (
		"ParentAlarmID")
	 references "Alarms" (
		"AlarmID") on update no action on delete no action  

go

alter table "ActionItems"
	add constraint "RecordingSchedules_ActionItems_FK1" foreign key (
		"RecordingScheduleID")
	 references "RecordingSchedules" (
		"RecordingScheduleID") on update no action on delete no action  

go

alter table "ActionItems"
	add constraint "Tours_ActionItems_FK1" foreign key (
		"TourID")
	 references "Tours" (
		"TourID") on update no action on delete cascade  

go

alter table "ActionItems"
	add constraint "Macros_ActionItems_FK1" foreign key (
		"MacroID")
	 references "Macros" (
		"MacroID") on update no action on delete no action  

go

/* Add foreign key constraints to table "ActionTypes".                                        */
alter table "ActionTypes"
	add constraint "ActionGroups_ActionTypes_FK" foreign key (
		"ActionGroupID")
	 references "ActionGroups" (
		"ActionGroupID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "NetworkDeviceModels".                                */
alter table "NetworkDeviceModels"
	add constraint "DeviceModels_NetworkDeviceModels_FK" foreign key (
		"DeviceModelID")
	 references "DeviceModels" (
		"DeviceModelID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "EventTypes".                                         */
alter table "EventTypes"
	add constraint "EventGroups_EventTypes_FK" foreign key (
		"EventGroupID")
	 references "EventGroups" (
		"EventGroupID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Relays".                                             */
alter table "Relays"
	add constraint "Devices_Relays_FK" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Audios".                                             */
alter table "Audios"
	add constraint "Devices_Audios_FK" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Roles".                                              */
alter table "Roles"
	add constraint "PasswordRules_Roles_FK1" foreign key (
		"PasswordRuleID")
	 references "PasswordRules" (
		"PasswordRuleID") on update no action on delete set null  

go

/* Add foreign key constraints to table "DevicePermissions".                                  */
alter table "DevicePermissions"
	add constraint "Roles_DevicePermissions_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "DevicePermissions"
	add constraint "Devices_DevicePermissions_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "DevicePermissions"
	add constraint "Users_DevicePermissions_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "DevicePermissions"
	add constraint "Permissions_DevicePermissions_FK1" foreign key (
		"PermissionID")
	 references "Permissions" (
		"PermissionID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "UserRoles".                                          */
alter table "UserRoles"
	add constraint "Roles_UserRoles_FK" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "UserRoles"
	add constraint "Users_UserRoles_FK" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "ActiveDirectoryRoles".                               */
alter table "ActiveDirectoryRoles"
	add constraint "Roles_ActiveDirectoryMap_FK" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "TimeCoverages".                                      */
alter table "TimeCoverages"
	add constraint "WeekCoverages_TimeCoverages_FK1" foreign key (
		"WeekCoverageID")
	 references "WeekCoverages" (
		"WeekCoverageID") on update no action on delete cascade  

go

alter table "TimeCoverages"
	add constraint "Schedules_TimeCoverages_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete no action  

go

/* Add foreign key constraints to table "SystemPermissions".                                  */
alter table "SystemPermissions"
	add constraint "Roles_SystemPermissions_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "SystemPermissions"
	add constraint "Users_SystemPermissions_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "SystemPermissions"
	add constraint "Permissions_SystemPermissions_FK1" foreign key (
		"PermissionID")
	 references "Permissions" (
		"PermissionID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "ConnectionHistory".                                  */
alter table "ConnectionHistory"
	add constraint "Devices_ConnectionHistory_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "ConnectionHistory"
	add constraint "StorageServers_ConnectionHistory_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "BackupStorages".                                     */
alter table "BackupStorages"
	add constraint "Backups_BackupStorages_FK1" foreign key (
		"BackupID")
	 references "Backups" (
		"BackupID") on update no action on delete cascade  

go

alter table "BackupStorages"
	add constraint "RecordingStorages_BackupStorages_FK1" foreign key (
		"RecordingStorageID")
	 references "RecordingStorages" (
		"RecordingStorageID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Backups".                                            */
alter table "Backups"
	add constraint "StorageServers_Backups_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "StartedBackups".                                     */
alter table "StartedBackups"
	add constraint "Backups_StartedBackups_FK1" foreign key (
		"BackupID")
	 references "Backups" (
		"BackupID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "AlarmChecks".                                        */
alter table "AlarmChecks"
	add constraint "ActionLog_AlarmChecks_FK1" foreign key (
		"ActionLogID")
	 references "ActionLog" (
		"ActionLogID") on update no action on delete cascade  

go

alter table "AlarmChecks"
	add constraint "AlarmStatus_AlarmChecks_FK1" foreign key (
		"AlarmStatusID")
	 references "AlarmStatus" (
		"AlarmStatusID") on update no action on delete set null  

go

alter table "AlarmChecks"
	add constraint "ActionsTaken_AlarmChecks_FK1" foreign key (
		"ActionTakenID")
	 references "ActionsTaken" (
		"ActionTakenID") on update no action on delete set null  

go

alter table "AlarmChecks"
	add constraint "AlarmPriorities_AlarmChecks_FK1" foreign key (
		"AlarmPriorityID")
	 references "AlarmPriorities" (
		"AlarmPriorityID") on update no action on delete set null  

go

alter table "AlarmChecks"
	add constraint "Users_AlarmChecks_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "AlarmChecks"
	add constraint "AlarmCategories_AlarmChecks_FK1" foreign key (
		"AlarmCategoryID")
	 references "AlarmCategories" (
		"AlarmCategoryID") on update no action on delete set null  

go

/* Add foreign key constraints to table "SearchVideoAnalysisSettings".                        */
alter table "SearchVideoAnalysisSettings"
	add constraint "VideoAnalysisSettings_SearchVideoAnalysisSettings_FK1" foreign key (
		"VideoAnalysisSettingID")
	 references "VideoAnalysisSettings" (
		"VideoAnalysisSettingID") on update no action on delete cascade  

go

alter table "SearchVideoAnalysisSettings"
	add constraint "Cameras_SearchVideoAnalysisSettings_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

alter table "SearchVideoAnalysisSettings"
	add constraint "Users_SearchVideoAnalysisSettings_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "RecordingSchedules".                                 */
alter table "RecordingSchedules"
	add constraint "Cameras_RecordingSchedules_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

alter table "RecordingSchedules"
	add constraint "Schedules_RecordingSchedules_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete no action  

go

/* Add foreign key constraints to table "SpecificDates".                                      */
alter table "SpecificDates"
	add constraint "Schedules_SpecificDates_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MetadataDeviceModels".                               */
alter table "MetadataDeviceModels"
	add constraint "DeviceModels_MetadataDeviceModels_FK1" foreign key (
		"DeviceModelID")
	 references "DeviceModels" (
		"DeviceModelID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MetadataGroupMembers".                               */
alter table "MetadataGroupMembers"
	add constraint "Devices_MetadataGroupMembers_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

alter table "MetadataGroupMembers"
	add constraint "Cameras_MetadataGroupMembers_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MetadataSettings".                                   */
alter table "MetadataSettings"
	add constraint "MetadataGroupMembers_MetadataSettings_FK1" foreign key (
		"MetadataGroupMemberID")
	 references "MetadataGroupMembers" (
		"MetadataGroupMemberID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "MetadataDeviceModelSettings".                        */
alter table "MetadataDeviceModelSettings"
	add constraint "MetadataDeviceModels_MetadataDeviceModelSettings_FK1" foreign key (
		"MetadataDeviceModelID")
	 references "MetadataDeviceModels" (
		"MetadataDeviceModelID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "Recognitions".                                       */
alter table "Recognitions"
	add constraint "Users_Recognitions_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete set null  

go

alter table "Recognitions"
	add constraint "RecognitionStates_Recognitions_FK1" foreign key (
		"RecognitionStatesID")
	 references "RecognitionStates" (
		"RecognitionStateID") on update no action on delete set null  

go

alter table "Recognitions"
	add constraint "Cameras_Recognitions_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

alter table "Recognitions"
	add constraint "RecognitionAreaLines_Recognitions_FK1" foreign key (
		"RecognitionAreaLineID")
	 references "RecognitionAreaLines" (
		"RecognitionAreaLineID") on update no action on delete set null  

go

/* Add foreign key constraints to table "RecognitionImages".                                  */
alter table "RecognitionImages"
	add constraint "Recognitions_RecognitionImages_FK1" foreign key (
		"RecognitionID")
	 references "Recognitions" (
		"RecognitionID") on update no action on delete cascade  

go

alter table "RecognitionImages"
	add constraint "SavedFiles_RecognitionImages_FK1" foreign key (
		"SavedFileID")
	 references "SavedFiles" (
		"SavedFileID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "SavedFiles".                                         */
alter table "SavedFiles"
	add constraint "EventLog_SavedFiles_FK1" foreign key (
		"EventLogID")
	 references "EventLog" (
		"EventLogID") on update no action on delete cascade  

go

alter table "SavedFiles"
	add constraint "Servers_SavedFiles_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete cascade  

go

alter table "SavedFiles"
	add constraint "Devices_SavedFiles_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "ViewLayoutPermissions".                              */
alter table "ViewLayoutPermissions"
	add constraint "ViewLayouts_ViewLayoutPermissions_FK1" foreign key (
		"ViewLayoutID")
	 references "ViewLayouts" (
		"ViewLayoutID") on update no action on delete cascade  

go

alter table "ViewLayoutPermissions"
	add constraint "Users_ViewLayoutPermissions_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete cascade  

go

alter table "ViewLayoutPermissions"
	add constraint "Roles_ViewLayoutPermissions_FK1" foreign key (
		"RoleID")
	 references "Roles" (
		"RoleID") on update no action on delete cascade  

go

alter table "ViewLayoutPermissions"
	add constraint "Permissions_ViewLayoutPermissions_FK1" foreign key (
		"PermissionID")
	 references "Permissions" (
		"PermissionID") on update no action on delete cascade  

go

/* Add foreign key constraints to table "RecognitionAreaSettings".                            */
alter table "RecognitionAreaSettings"
	add constraint "Cameras_RecognitionAreaSettings_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecognitionAreaLines".                               */
alter table "RecognitionAreaLines"
	add constraint "RecognitionAreaSettings_RecognitionAreaLines_FK1" foreign key (
		"RecognitionAreaSettingID")
	 references "RecognitionAreaSettings" (
		"RecognitionAreaSettingID") on update no action on delete cascade  

go

alter table "RecognitionAreaLines"
	add constraint "Schedules_RecognitionAreaLines_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete no action  

go

/* Add foreign key constraints to table "AuxiliaryDevices".                                   */
alter table "AuxiliaryDevices"
	add constraint "DeviceModels_AuxiliaryDevices_FK1" foreign key (
		"DeviceModelID")
	 references "DeviceModels" (
		"DeviceModelID") on update no action on delete cascade  

go

alter table "AuxiliaryDevices"
	add constraint "ElectronicDisplays_AuxiliaryDevices_FK1" foreign key (
		"ElectronicDisplayID")
	 references "ElectronicDisplays" (
		"ElectronicDisplayID") on update no action on delete no action  

go

alter table "AuxiliaryDevices"
	add constraint "Devices_AuxiliaryDevices_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecognitionStatistics".                              */
alter table "RecognitionStatistics"
	add constraint "Cameras_RecognitionStatistics_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

alter table "RecognitionStatistics"
	add constraint "Users_RecognitionStatistics_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete no action  

go

alter table "RecognitionStatistics"
	add constraint "SharedFiles_RecognitionStatistics_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete no action  

go

/* Add foreign key constraints to table "TrackingCoordinatesSettings".                        */
alter table "TrackingCoordinatesSettings"
	add constraint "Cameras_TrackingCoordinatesSettings_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

/* Add foreign key constraints to table "StreamingRelayServers".                              */
alter table "StreamingRelayServers"
	add constraint "StorageServers_StreamingRelayServers_FK1" foreign key (
		"StorageServerID")
	 references "StorageServers" (
		"StorageServerID") on update no action on delete no action  

go

/* Add foreign key constraints to table "GISSchedules".                                       */
alter table "GISSchedules"
	add constraint "Schedules_GISSchedules_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete no action  

go

alter table "GISSchedules"
	add constraint "Users_GISSchedules_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete no action  

go

alter table "GISSchedules"
	add constraint "GISRadarSequenceGroups_GISSchedules_FK1" foreign key (
		"GISRadarSequenceGroupID")
	 references "GISRadarSequenceGroups" (
		"GISRadarSequenceGroupID") on update no action on delete no action  

go

/* Add foreign key constraints to table "GISRadarSequences".                                  */
alter table "GISRadarSequences"
	add constraint "GISRadarSequenceGroups_GISRadarSequences_FK1" foreign key (
		"GISRadarSequenceGroupID")
	 references "GISRadarSequenceGroups" (
		"GISRadarSequenceGroupID") on update no action on delete no action  

go

/* Add foreign key constraints to table "Hosts".                                              */
alter table "Hosts"
	add constraint "HostTypes_Hosts_FK1" foreign key (
		"HostTypeID")
	 references "HostTypes" (
		"HostTypeID") on update no action on delete cascade  

go

alter table "Hosts"
	add constraint "Users_Hosts_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete set null  

go

alter table "Hosts"
	add constraint "Servers_Hosts_FK1" foreign key (
		"ServerID")
	 references "Servers" (
		"ServerID") on update no action on delete set null  

go

/* Add foreign key constraints to table "EndPointLog".                                        */
alter table "EndPointLog"
	add constraint "Hosts_EndPointLog_FK1" foreign key (
		"HostID")
	 references "Hosts" (
		"HostID") on update no action on delete set null  

go

alter table "EndPointLog"
	add constraint "EventTypes_EndPointLog_FK1" foreign key (
		"EventTypeID")
	 references "EventTypes" (
		"EventTypeID") on update no action on delete set null  

go

alter table "EndPointLog"
	add constraint "Users_EndPointLog_FK1" foreign key (
		"UserID")
	 references "Users" (
		"UserID") on update no action on delete set null  

go

alter table "EndPointLog"
	add constraint "Devices_EndPointLog_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete set null  

go

alter table "EndPointLog"
	add constraint "EndPointFiles_EndPointLog_FK1" foreign key (
		"EndPointFileID")
	 references "EndPointFiles" (
		"EndPointFileID") on update no action on delete set null  

go

/* Add foreign key constraints to table "GISSafetyServices".                                  */
alter table "GISSafetyServices"
	add constraint "GISSafetyStates_GISSafetyServices_FK1" foreign key (
		"GISSafetyStateID")
	 references "GISSafetyStates" (
		"GISSafetyStateID") on update no action on delete no action  

go

/* Add foreign key constraints to table "GISSOSCoordinates".                                  */
alter table "GISSOSCoordinates"
	add constraint "GISSafetyServices_GISSOSCoordinates_FK1" foreign key (
		"GISSafetyServiceID")
	 references "GISSafetyServices" (
		"GISSafetyServiceID") on update no action on delete no action  

go

/* Add foreign key constraints to table "AdministrativeDistricts".                            */
alter table "AdministrativeDistricts"
	add constraint "Sites_AdministrativeDistricts_FK1" foreign key (
		"SiteID")
	 references "Sites" (
		"SiteID") on update no action on delete no action  

go

/* Add foreign key constraints to table "AssetHistorys".                                      */
alter table "AssetHistorys"
	add constraint "Sites_AssetHistorys_FK1" foreign key (
		"SiteID")
	 references "Sites" (
		"SiteID") on update no action on delete no action  

go

alter table "AssetHistorys"
	add constraint "Devices_AssetHistorys_FK1" foreign key (
		"DeviceID")
	 references "Devices" (
		"DeviceID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecognitionServerLogs".                              */
alter table "RecognitionServerLogs"
	add constraint "RecognitionViolationTypes_RecognitionServerLogs_FK1" foreign key (
		"RecognitionViolationTypeID")
	 references "RecognitionViolationTypes" (
		"RecognitionViolationTypeID") on update no action on delete no action  

go

alter table "RecognitionServerLogs"
	add constraint "SavedFiles_RecognitionServerLogs_FK1" foreign key (
		"SavedFileID")
	 references "SavedFiles" (
		"SavedFileID") on update no action on delete no action  

go

/* Add foreign key constraints to table "SmartPolices".                                       */
alter table "SmartPolices"
	add constraint "Cameras_SmartPolices_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecognitionIgnoreLines".                             */
alter table "RecognitionIgnoreLines"
	add constraint "RecognitionAreaLines_RecognitionIgnoreLines_FK1" foreign key (
		"RecognitionAreaLineID")
	 references "RecognitionAreaLines" (
		"RecognitionAreaLineID") on update no action on delete no action  

go

/* Add foreign key constraints to table "FaceRegistrationImages".                             */
alter table "FaceRegistrationImages"
	add constraint "FaceRegistrations_FaceRegistrationImages_FK1" foreign key (
		"FaceRegistrationsID")
	 references "FaceRegistrations" (
		"FaceRegistrationsID") on update no action on delete no action  

go

alter table "FaceRegistrationImages"
	add constraint "SharedFiles_FaceRegistrationImages_FK1" foreign key (
		"SharedFileID")
	 references "SharedFiles" (
		"SharedFileID") on update no action on delete no action  

go

/* Add foreign key constraints to table "RecognitionSchedules".                               */
alter table "RecognitionSchedules"
	add constraint "Schedules_RecognitionSchedules_FK1" foreign key (
		"ScheduleID")
	 references "Schedules" (
		"ScheduleID") on update no action on delete no action  

go

alter table "RecognitionSchedules"
	add constraint "Cameras_RecognitionSchedules_FK1" foreign key (
		"CameraID")
	 references "Cameras" (
		"CameraID") on update no action on delete no action  

go


/* This is the end of the Microsoft Visual Studio generated SQL DDL script.                   */
