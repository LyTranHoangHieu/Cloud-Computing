db_name='database name here'
db_user='database user name here'
db_passwd='database password here'
host='database host here'
output='/var/backups'
bucket_name='bucket name here'
underscore='_'
date=`date +%d-%m-%Y`
datedel=`date --date="1 days ago" +%d-%m-%Y`

rm -f $output/apt* > /dev/null 2>&1
rm -f $output/dpkg* > /dev/null 2>&1
rm -f $output/alter* > /dev/null 2>&1

rm -f $output/*.sql > /dev/null 2>&1
rm -f $output/*.zip > /dev/null 2>&1

mysqldump --force --opt --user=$db_user --password=$db_passwd --host=$host --databases=$db_name > $output/$db_name$underscore$date.sql
zip -r $output/$db_name$underscore$date.zip $output/$db_name$underscore$date.sql
zip -r $output/source$underscore$date.zip /var/www/wordpress

sudo aws s3 cp $output/$db_name$underscore$date.zip s3://$bucket_name
sudo aws s3 cp $output/source$underscore$date.zip s3://$bucket_name

sudo aws s3 rm s3://$bucket_name/$db_name$underscore$datedel.zip
sudo aws s3 rm s3://$bucket_name/source$underscore$datedel.zip
