# Run as root for mysql

create database 4840epa;

create user '4840epa' identified by '4840epa';

grant all privileges on 4840epa.* to '4840epa'@'%';

