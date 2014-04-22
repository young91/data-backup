
#!/bin/sh

if [ "$1" = "mysql" ] ;then
    echo mysql;
    backupdir=/data/backup/
    mkdir -p $backupdir$(date -d yesterday +%Y)/$(date -d yesterday +%m)/
    cd $backupdir$(date -d yesterday +%Y)/$(date -d yesterday +%m)/
    mysqldump -hlocalhost -udouquAdmin -pyangliu wp-blog>$(date -d yesterday +%Y-%m-%d)_wp_blog_db.sql
    mysqldump -hlocalhost -udouquAdmin -pyangliu node-blog>$(date -d yesterday +%Y-%m-%d)_node_blog_db.sql

    tar -zcvf backup.tar.gz $(date -d yesterday +%Y-%m-%d)_wp_blog_db.sql  $(date -d yesterday +%Y-%m-%d)_node_blog_db.sql
    php /var/www/html/data-back/MailUtils.php $backupdir$(date -d yesterday +%Y)/$(date -d yesterday +%m)/backup.tar.gz  backend.tar.gz

elif [ "$1" = "code" ] ;then
    echo  code;
    backupdir=/data/backup/
    mkdir -p $backupdir$(date -d yesterday +%Y)/$(date -d yesterday +%m)/
    cd $backupdir$(date -d yesterday +%Y)/$(date -d yesterday +%m)/

    tar -zcvf wordpress.tar.gz /var/www/html/wordpress/
    php /var/www/html/data-back/MailUtils.php $backupdir$(date -d yesterday +%Y)/$(date -d yesterday +%m)/wordpress.tar.gz  wordpress.tar.gz
else
   echo else;
fi

