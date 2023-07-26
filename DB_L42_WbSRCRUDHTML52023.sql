create database DB_L42_WbSRCRUDHTML52023
use DB_L42_WbSRCRUDHTML52023

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
address varchar(100),
age int
)

create proc sp_tblEmployee
@action varchar(100)=null,
@empid int =0,
@name varchar(100)=null,
@address varchar(100)=null,
@age int =0
as
begin
	if(@action='INSERT')
	begin
		insert into tblEmployee(name,address,age)values(@name,@address,@age)
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
	else if(@action='GET')
	begin
		select * from tblEmployee 
	end
end