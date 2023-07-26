create database DB_L39_JQUERY_INSERT_51923
use DB_L39_JQUERY_INSERT_51923

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
address varchar(100),
age int


alter proc sp_tblEmployee
@action varchar(100)=null,
@empid int =0,
@name varchar(100)=null,
@address varchar(100)=null,
@age int=0
as
begin
	if(@action='GETDATA')
	begin
		select * from tblEmployee
	end
	else if(@action='INSERT')
	begin
		INSERT INTO tblEmployee(name,address,age)values(@name,@address,@age)
	end	
	else if(@action='DELETE')
	begin
		delete from tblEmployee where empid=@empid
	end
	else if(@action='EDIT')
	begin
		select * from tblEmployee where empid=@empid
	end
	else if(@action='UPDATE')
	begin
		update tblEmployee set name=@name,address=@address,age=@age where empid=@empid
	end
end


--create proc sp_tblEmployee_GetData
--@action varchar(100)
--as
--begin
--if(@action='GETDATA')
--begin
--select * from tblEmployee
--end
--end

select * from tblEmployee

--drop procedure dbo.sp_tblEmployee_GetData
--sp_helptext sp_tblEmployee_GetData
