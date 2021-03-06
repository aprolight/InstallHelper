/* This script drops all Tables, Views, Stored Procedures, and Functions in the current database. Be careful!

Created by Daniel Hochee 6/9/09.
*/

BEGIN	

	declare @tableName  varchar(100)
	declare @name  varchar(100)
	declare @xtype char(2)
	declare @sql nvarchar(1000)


	-- delete all table constraints
	declare curs cursor for
	select 'ALTER TABLE '+ tab.name +' DROP CONSTRAINT '+cons.name
	from sys.objects cons,sys.objects tab
	/* where cons.type in ('C', 'F', 'PK', 'UQ', 'D') - Modified by Dan to remove possible sources of hanging. 2009-08-14 */ 
	where cons.type in ('F', 'D')
	and cons.parent_object_id=tab.object_id and tab.type='U'
	order by cons.type

	open curs
	fetch next from curs into @sql
	while (@@fetch_status = 0)
		begin
		exec(@sql)
		fetch next from curs into @sql
		end
	close curs
	deallocate curs


	-- now remove all views, functions, and stored procedures in the DB
	declare SPViews_cursor cursor for
	SELECT so.name, so.xtype
	FROM sysobjects so
		  join sysusers su on so.uid = su.uid
	WHERE so.xtype = 'V' OR so.xtype = 'FN' OR so.xtype = 'P'
	ORDER BY so.xtype, so.name

	open SPViews_cursor

	fetch next from SPViews_cursor into @name, @xtype

	while @@fetch_status = 0
	  begin
	-- test object type if it is a stored procedure
	   if @xtype = 'P'
		  begin
			set @sql = 'drop procedure [' + @name + ']'
			exec sp_executesql @sql
			set @sql = ' '
		  end

	-- test object type if it is a function
	   if @xtype = 'FN'
		  begin
			set @sql = 'drop function [' + @name + ']'
			exec sp_executesql @sql
			set @sql = ' '
		  end

	-- test object type if it is a view
	   if @xtype = 'V'
		  begin
			 set @sql = 'drop view [' + @name + ']'
			 exec sp_executesql @sql
			 set @sql = ' '
		  end

	-- get next record
		fetch next from SPViews_cursor into @name, @xtype
	  end

	close SPViews_cursor
	deallocate SPViews_cursor


	-- and finally drop all tables
	declare cursorTables cursor for
	SELECT so.name
	FROM sysobjects so
		  join sysusers su on so.uid = su.uid
	WHERE so.xtype = 'U'
	ORDER BY so.name

	open cursorTables

	fetch next from cursorTables into @tableName

	while @@fetch_status = 0
	  begin
	  
	    set @sql = 'drop table [' + @tableName + ']'
	    exec sp_executesql @sql
	    set @sql = ' '

		fetch next from cursorTables into @tableName
	  end

	close cursorTables
	deallocate cursorTables

END

GO