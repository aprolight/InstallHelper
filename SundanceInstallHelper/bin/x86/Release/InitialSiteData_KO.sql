
SET IDENTITY_INSERT [SystemSettings] ON
INSERT [SystemSettings] ([SystemSettingID], [Attribute], [Value]) VALUES (1, N'DBVersion', N'2014.02.17')
INSERT [SystemSettings] ([SystemSettingID], [Attribute], [Value]) VALUES (2, N'ADDomain', N'')
INSERT [SystemSettings] ([SystemSettingID], [Attribute], [Value]) VALUES (3, N'UseActiveDirectory', N'false')
INSERT [SystemSettings] ([SystemSettingID], [Attribute], [Value]) VALUES (4, N'ClientCode', N'')
INSERT [SystemSettings] ([SystemSettingID], [Attribute], [Value]) VALUES (5, N'UsePlatesRecognition', N'true')
SET IDENTITY_INSERT [SystemSettings] OFF
GO

SET IDENTITY_INSERT [Schedules] ON
INSERT [Schedules] ([ScheduleID], [ScheduleName], [ScheduleType], [IsAdvanced], [UseRecurrence], [RecurrencePattern], [DateCoveragePeriod], [TimeCoveragePeriod], [WeekNumber], [YearNumber], [MonthNumber], [DayNumber], [UseSunriseToSunset], [SunriseOffset], [SunsetOffset], [CalendarType], [RecurrenceStart], [RecurrenceRangeType], [RecurrenceCount], [RecurrenceEndDate], [IsDefault], [TimeZone], [IsUserDefined], [IsDeleted]) VALUES (1, N'All Day', 0, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, '2009-08-14 00:00:00', 0, 1, '2009-08-14 00:00:00', 1, N'', 0, 0)
INSERT [Schedules] ([ScheduleID], [ScheduleName], [ScheduleType], [IsAdvanced], [UseRecurrence], [RecurrencePattern], [DateCoveragePeriod], [TimeCoveragePeriod], [WeekNumber], [YearNumber], [MonthNumber], [DayNumber], [UseSunriseToSunset], [SunriseOffset], [SunsetOffset], [CalendarType], [RecurrenceStart], [RecurrenceRangeType], [RecurrenceCount], [RecurrenceEndDate], [IsDefault], [TimeZone], [IsUserDefined], [IsDeleted]) VALUES (2, N'All Day Template', 2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, '2009-08-14 00:00:00', 0, 1, '2009-08-14 00:00:00', 0, N'', 0, 0)
INSERT [Schedules] ([ScheduleID], [ScheduleName], [ScheduleType], [IsAdvanced], [UseRecurrence], [RecurrencePattern], [DateCoveragePeriod], [TimeCoveragePeriod], [WeekNumber], [YearNumber], [MonthNumber], [DayNumber], [UseSunriseToSunset], [SunriseOffset], [SunsetOffset], [CalendarType], [RecurrenceStart], [RecurrenceRangeType], [RecurrenceCount], [RecurrenceEndDate], [IsDefault], [TimeZone], [IsUserDefined], [IsDeleted]) VALUES (3, N'Christmas', 2, 1, 1, 4, 3, 1, 0, 0, 12, 25, 1, 0, 0, 0, '2009-08-14 00:00:00', 0, 1, '2009-08-14 00:00:00', 0, N'', 0, 0)
INSERT [Schedules] ([ScheduleID], [ScheduleName], [ScheduleType], [IsAdvanced], [UseRecurrence], [RecurrencePattern], [DateCoveragePeriod], [TimeCoveragePeriod], [WeekNumber], [YearNumber], [MonthNumber], [DayNumber], [UseSunriseToSunset], [SunriseOffset], [SunsetOffset], [CalendarType], [RecurrenceStart], [RecurrenceRangeType], [RecurrenceCount], [RecurrenceEndDate], [IsDefault], [TimeZone], [IsUserDefined], [IsDeleted]) VALUES (4, N'Weekdays 6am-6pm', 2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, '2009-08-14 00:00:00', 0, 1, '2009-08-14 00:00:00', 0, N'', 0, 0)
INSERT [Schedules] ([ScheduleID], [ScheduleName], [ScheduleType], [IsAdvanced], [UseRecurrence], [RecurrencePattern], [DateCoveragePeriod], [TimeCoveragePeriod], [WeekNumber], [YearNumber], [MonthNumber], [DayNumber], [UseSunriseToSunset], [SunriseOffset], [SunsetOffset], [CalendarType], [RecurrenceStart], [RecurrenceRangeType], [RecurrenceCount], [RecurrenceEndDate], [IsDefault], [TimeZone], [IsUserDefined], [IsDeleted]) VALUES (5, N'Evenings and Weekends', 2, 0, 0, 2, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, '2009-08-14 00:00:00', 0, 1, '2009-08-14 00:00:00', 0, N'', 0, 0)
INSERT [Schedules] ([ScheduleID], [ScheduleName], [ScheduleType], [IsAdvanced], [UseRecurrence], [RecurrencePattern], [DateCoveragePeriod], [TimeCoveragePeriod], [WeekNumber], [YearNumber], [MonthNumber], [DayNumber], [UseSunriseToSunset], [SunriseOffset], [SunsetOffset], [CalendarType], [RecurrenceStart], [RecurrenceRangeType], [RecurrenceCount], [RecurrenceEndDate], [IsDefault], [TimeZone], [IsUserDefined], [IsDeleted]) VALUES (6, N'New Years Day', 2, 1, 1, 4, 3, 1, 0, 0, 1, 1, 1, 0, 0, 0, '2009-08-14 00:00:00', 0, 1, '2009-08-14 00:00:00', 0, N'', 0, 0)
SET IDENTITY_INSERT [Schedules] OFF
GO

SET IDENTITY_INSERT [WeekCoverages] ON
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (1, 1, 0, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (2, 1, 1, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (3, 1, 2, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (4, 1, 3, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (5, 1, 4, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (6, 1, 5, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (7, 1, 6, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (8, 2, 0, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (9, 2, 1, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (10, 2, 2, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (11, 2, 3, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (12, 2, 4, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (13, 2, 5, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (14, 2, 6, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (15, 4, 1, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (16, 4, 2, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (17, 4, 3, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (18, 4, 4, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (19, 4, 5, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (20, 5, 0, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (21, 5, 1, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (22, 5, 2, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (23, 5, 3, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (24, 5, 4, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (25, 5, 5, 0)
INSERT [WeekCoverages] ([WeekCoverageID], [ScheduleID], [Weekday], [IsAdvanced]) VALUES (26, 5, 6, 0)
SET IDENTITY_INSERT [WeekCoverages] OFF

SET IDENTITY_INSERT [TimeCoverages] ON
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (1, 1, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (2, 2, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (3, 3, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (4, 4, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (5, 5, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (6, 6, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (7, 7, 1, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (8, 8, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (9, 9, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (10, 10, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (11, 11, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (12, 12, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (13, 13, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (14, 14, 2, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (15, NULL, 3, NULL, '1900-01-01 23:59:59', 0, 1)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (16, 15, 4, '1900-01-01 06:00:00', '1900-01-01 17:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (17, 16, 4, '1900-01-01 06:00:00', '1900-01-01 17:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (18, 17, 4, '1900-01-01 06:00:00', '1900-01-01 17:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (19, 18, 4, '1900-01-01 06:00:00', '1900-01-01 17:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (20, 19, 4, '1900-01-01 06:00:00', '1900-01-01 17:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (21, 20, 5, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (22, 21, 5, NULL, '1900-01-01 05:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (23, 21, 5, '1900-01-01 18:00:00', '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (24, 22, 5, NULL, '1900-01-01 05:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (25, 22, 5, '1900-01-01 18:00:00', '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (26, 23, 5, NULL, '1900-01-01 05:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (27, 23, 5, '1900-01-01 18:00:00', '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (28, 24, 5, NULL, '1900-01-01 05:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (29, 24, 5, '1900-01-01 18:00:00', '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (30, 25, 5, NULL, '1900-01-01 05:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (31, 25, 5, '1900-01-01 18:00:00', '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (32, 26, 5, NULL, '1900-01-01 23:59:59', 0, 0)
INSERT [TimeCoverages] ([TimeCoverageID], [WeekCoverageID], [ScheduleID], [TimeFrom], [TimeTo], [IsDayAfter], [IsAdvanced]) VALUES (33, NULL, 6, NULL, '1900-01-01 23:59:59', 0, 1)
SET IDENTITY_INSERT [TimeCoverages] OFF
GO

SET IDENTITY_INSERT [Users] ON
INSERT [Users] ([UserID], [UserName], [Password], [FirstName], [LastName], [Description], [ActiveDirectoryLogin], [LanguageID], [Email], [Telephone], [Mobile], [IsDeleted], [PasswordRuleID], [PasswordChangedTime], [SmartPoliceID]) VALUES (1, N'administrator', N'd41d8cd98f00b204e9800998ecf8427e', N'Admin', N'', N'', 0, 2, N'', N'', N'', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [Users] OFF
GO

SET IDENTITY_INSERT [Roles] ON
INSERT [Roles] ([RoleID], [RoleName], [Description], [Administrator], [ActiveDirectoryRole], [IsDeleted], [PasswordRuleID]) VALUES (1, N'Administrators', N'', 1, 0, 0, NULL)
INSERT [Roles] ([RoleID], [RoleName], [Description], [Administrator], [ActiveDirectoryRole], [IsDeleted], [PasswordRuleID]) VALUES (2, N'Everyone', N'', 0, 0, 0, NULL)
INSERT [Roles] ([RoleID], [RoleName], [Description], [Administrator], [ActiveDirectoryRole], [IsDeleted], [PasswordRuleID]) VALUES (3, N'SystemEngineers', N'', 1, 0, 0, NULL)
SET IDENTITY_INSERT [Roles] OFF

SET IDENTITY_INSERT [UserRoles] ON
INSERT [UserRoles] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [UserRoles] OFF
GO

SET IDENTITY_INSERT [UserSettings] ON
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (1, 1, N'InterfaceSkin', N'Black')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (2, 1, N'treeSystem.PreserveFilterTreeStructure', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (3, 1, N'treeSystem.ShowFilterMatchChildren', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (4, 1, N'treeUserRole.PreserveFilterTreeStructure', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (5, 1, N'treeUserRole.ShowFilterMatchChildren', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (6, 1, N'sundanceTreeList.PreserveFilterTreeStructure', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (7, 1, N'sundanceTreeList.ShowFilterMatchChildren', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (8, 1, N'tabSystem-treeSystem.PreserveFilterTreeStructure', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (9, 1, N'tabSystem-treeSystem.ShowFilterMatchChildren', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (10, 1, N'treeListPage1-sundanceTreeList.PreserveFilterTreeStructure', N'False')
INSERT [UserSettings] ([UserSettingID], [UserID], [Attribute], [Value]) VALUES (11, 1, N'treeListPage1-sundanceTreeList.ShowFilterMatchChildren', N'False')
SET IDENTITY_INSERT [UserSettings] OFF
GO

SET IDENTITY_INSERT [Servers] ON
INSERT [Servers] ([ServerID], [ServerType], [Priority], [HostName], [IP], [Port], [SiteID], [IsGatewayMCS], [FailoverStartOn], [FailoverCheckDuration], [Enabled], [IsDeleted]) VALUES (1, 1, 0, N'localhost', N'127.0.0.1', 8738, NULL, 1, 0, 0, 1, 0)
SET IDENTITY_INSERT [Servers] OFF
GO

SET IDENTITY_INSERT [Sites] ON
INSERT [Sites] ([SiteID], [CustomGroupID], [Name], [Country], [State], [City], [Latitude], [Longitude], [TimeZone], [Company], [Address], [PolicePhone], [FirePhone], [Phone], [PrimaryContact], [SecondaryContact], [IsDeleted], [AssetOwner], [MaintenanceCo], [Description], [DateTimeOpened], [Reserved1], [Reserved2]) VALUES (1, NULL, N'Default Site', N'', N'', N'', 0, 0, N'', N'', N'', N'', N'', N'', N'', N'', 0, N'', N'', N'', NULL, N'', N'')
SET IDENTITY_INSERT [Sites] OFF
GO