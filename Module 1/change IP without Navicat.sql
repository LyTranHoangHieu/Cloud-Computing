-- connect to RDS
-- mysql -h <RDS end point> -u <user name RDS> -P 3306 -p
-- use database that we create before
-- use <database name>;
-- show all tables in this database 
show tables;
-- there're lots of table but we just
-- focus on table 'wp_options'
select * from wp_options;
-- there're a lot infomation and we can't see all in terminal @@
-- how to watch data tpye all of column in table 'wp_options'?
show columns in wp_options;
 -- there're 4 columns and we know there're a lot of rows
 -- however we just focus on the first 2 rows 
 -- because when we stop instance EC2 on AWS and then we start it, this instance is given a new IP
 -- and it's a reason why in a nice day, we start this instance, we copy Public IPv4 DNS and paste this into the web, press enter and woah... we can't connect to database...  
 -- after that, our mission is change DNS value in option_value column in wp_options table with option_id is 1 and 2
-- how to see the first 2 rows in wp_options table?
select option_name, option_value from wp_options where option_id = 1 or option_id = 2;
-- how to change it?
-- update wp_options set option_value = 'http://<new DNS>' where option_id = 1
-- update wp_options set option_value = 'http://<new DNS>' where option_id = 2
