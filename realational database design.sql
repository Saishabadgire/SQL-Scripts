create table role
(
id int primary key
,role_name varchar(100)
);

create table user_account
(
id int primary key
,username varchar (100)
,email varchar(254)
,password varchar(200)
,password_salt varchar(50) not null
,password_hash_algorithm varchar(50)

);


create  table status1
(
id int primary key
,status_name varchar(100)
,is_user_workinng bit 
)

Create table User_has_role
(Id int Primary Key,
role_start_time datetime,
role_end_time datetime not null,
user_account_id int foreign key References user_account(Id),
role_id int foreign key references role(id));
select*from User_has_role


create table User_has_status
(Id int primary key,
status_start_time datetime,
status_end_time datetime not null,
user_account_id int foreign key references user_account(id),
status_id int foreign key references status(id));
select*from User_has_status

insert into role(id,role_name)
values (5,'sale'),
  ( 3,'technical')
select*from role

insert into status(id,status_name,is_user_working)
values (1,'new status',1),
       (2,'new status',1)
	   select *from status

insert into user_account(id,username,email,password,password_salt,password_hash_algorithm)
values (101,'saisha','saisha@gmail.com','saisha01','sai','abc'),
      (102,'dnyana','dnyanu@gmail.com','dnyana00','dna','abd')
 select*from user_account

INSERT into User_has_role(Id, role_start_time, role_end_time,user_account_id,role_id)
VALUES
(10, '2023-04-12 01:45:22', '2024-05-22 02:45:22', 101, 5),
(11, '2021-11-10 03:45:22', '2026-05-22 02:45:22', 102, 3);

SELECT * FROM user_has_role;

insert into user_has_status
values(110, '2023-04-12 01:45:22', '2024-05-22 02:45:22', 101, 1),
(111, '2021-11-10 03:45:22', '2026-05-22 02:45:22', 102, 2);
SELECT * FROM user_has_status;

alter table user_has_role
drop constraint FK__User_has___role___253C7D7E

alter table user_has_role
drop constraint FK__User_has___user___24485945

alter table user_has_role
drop constraint PK__User_has__3214EC07421E5368

alter table user_has_status
drop constraint FK__User_has___statu__290D0E62

alter table user_has_status
drop constraint FK__User_has___user___2818EA29

alter table user_has_status
drop constraint PK__User_has__3214EC07352129A4
 
 alter table user_account
 drop constraint PK__user_acc__3213E83F89ED8020

drop table role
drop table status