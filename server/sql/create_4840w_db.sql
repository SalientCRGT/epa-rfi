# Run as root for mysql
drop database if exists 4840epa;

create database 4840w;

create user '4840w' identified by '4840w';

grant all privileges on 4840w.* to '4840w'@'%';

