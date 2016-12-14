#!/bin/sh

Mysql=/usr/bin/mysql
Mysqldump=/usr/bin/mysqldump
DB_host='localhost'
DB_user='root'
DB_pass='uokomobile1234;'
Charset=utf8

now="$(date +'%Y%m%d_%H%M%S')"
backupfolder="/var/mysql_backup"
mkdir -p $backupfolder
logfile="$backupfolder/"backup_log_"$(date +'%Y_%m')".txt
touch $logfile
echo "mysqldump started at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
for db in $(mysql -u$DB_user -p$DB_pass -e "show databases" -s --skip-column-names|grep -Ev "(information_schema|performance_schema|mysql|test)")
do
	echo $db
	folder="$backupfolder/$db"
	mkdir -p $folder
	filename="$folder/$now".gz
	$Mysqldump --user=$DB_user --password="$DB_pass" --default-character-set=$Charset --databases $db | gzip > $filename
done

echo "mysqldump finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
find "$backupfolder" -mtime +8 -exec rm {} \;
echo "old files deleted" >> "$logfile"
echo "operation finished at $(date +'%d-%m-%Y %H:%M:%S')" >> "$logfile"
echo "*****************" >> "$logfile"
exit 0
