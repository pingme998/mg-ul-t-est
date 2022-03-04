#!/bin/bash
log="dumb.log"
echo "$APP_NAME" >/home/appname
rclone version
##
git clone "$REPO"

##
cat /home/quota/init_h_login |sed "s|HEROKU_EMAIL_ID|$HEROKU_EMAIL_ID|g;s|HEROKU_PASSWORD|$HEROKU_PASSWORD|g" >/usr/bin/init_h_login
chmod +x /usr/bin/init_h_login 
rclone config create 'CLOUDNAME' 'mega' 'user' $UserName 'pass' $PassWord
rclone serve http CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes > "$log" 2>&1 &
while sleep 1
do
    if fgrep --quiet "Bandwidth Limit Exceeded" "$log"
    then
        q_bypass
    fi
done
