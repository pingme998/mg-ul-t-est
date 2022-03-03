#!/bin/bash
log="dumb.log"

chmod +x /
rclone version
rclone config create 'CLOUDNAME' 'mega' 'user' $UserName 'pass' $PassWord
rclone serve http CLOUDNAME: --addr :$PORT --buffer-size 256M --dir-cache-time 12h --vfs-read-chunk-size 256M --vfs-read-chunk-size-limit 2G --vfs-cache-mode writes > "$log" 2>&1 &
while sleep 1
do
    if fgrep --quiet "Bandwidth Limit Exceeded" "$log"
    then
        q_bypass
    fi
done
