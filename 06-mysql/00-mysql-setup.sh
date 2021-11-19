#!/bin/bash 

#echo "Starting mysql"
#sudo service mysql start

#echo "Setting up vault's grant in mysql"
# generate random mysql passwd for vault acct
#passwd=`openssl rand -base64 12 | base32 | cut -b -24`
#echo $passwd > .mysql-vault-passwd

#mysql -uadmin -pt4EE6rQuMR5E0oMrAvlL <<EOF
#use mysql;
#CREATE USER 'vaultroot'@'%' IDENTIFIED BY 'FP4X0JUU8OU2GdOJhySC';
#GRANT SUPER ON *.* to 'vaultroot'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;
#EOF

echo "Creating db1 database"
mysql -uadmin -pt4EE6rQuMR5E0oMrAvlL <<EOF
DROP DATABASE IF EXISTS db1;
create database if not exists db1;
USE db1;
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;
CREATE TABLE IF NOT EXISTS users (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;

create database if not exists db3;
USE db3;
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;
CREATE TABLE IF NOT EXISTS users (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    status TINYINT NOT NULL,
    priority TINYINT NOT NULL,
    description TEXT,
    PRIMARY KEY (task_id)
)  ENGINE=INNODB;
EOF
