CREATE DATABASE if not exists socialmedia;

use socialmedia;

drop table if exists userinfo;
drop table if exists posts;
drop table if exists comments;

CREATE TABLE userinfo (
userid INT NOT NULL auto_increment primary key,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
password VARCHAR(30) NOT NULL,
email VARCHAR(30) NOT NULL
);

CREATE TABLE posts (
postid INT NOT NULL auto_increment primary key,
userid INT NOT NULL,
timeposted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
postdata LONGTEXT NOT NULL,
FOREIGN KEY (userid) REFERENCES userinfo(userid)
);

CREATE TABLE comments (
commentid INT NOT NULL auto_increment primary key,
userid INT NOT NULL,
postid INT NOT NULL,
timeposted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
commentdata LONGTEXT NOT NULL,
FOREIGN KEY (userid) REFERENCES userinfo(userid),
FOREIGN KEY (postid) REFERENCES posts(postid)
);