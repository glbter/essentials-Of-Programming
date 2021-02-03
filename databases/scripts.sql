select file_name, tablespace_name, bytes, blocks, status from dba_data_files;

select username, account_status, authentication_type from dba_users;

-- create permanent tablespace
create smallfile tablespace lab_db_space 
datafile 'D:\oracle_db\oraclexe\app\oracle\oradata\xe\labs.dbf' 
size 5M reuse autoextend on next 5M maxsize 50M logging 
extent management local autoallocate segment space management auto;

-- create temporary tablespace
create smallfile temporary tablespace tmp_labs_space 
tempfile 'D:\oracle_db\oraclexe\app\oracle\oradata\xe\labs_tmp.dbf'
size 5M autoextend on next 2M maxsize 40M 
extent management local uniform size 1M;

CREATE SMALLFILE TEMPORARY TABLESPACE tmp_labs_space
TEMPFILE 'D:\oracle_db\oraclexe\app\oracle\oradata\xe\labs_tmp.dbf' SIZE 5M 
AUTOEXTEND ON NEXT 2M MAXSIZE UNLIMITED 
EXTENT MANAGEMENT LOCAL UNIFORM SIZE 1M;


create user user_labs
profile default identified by 1
default tablespace lab_db_space
temporary tablespace tmp_labs_space
account unlock;

grant connect to user_labs;
grant resource to user_labs;