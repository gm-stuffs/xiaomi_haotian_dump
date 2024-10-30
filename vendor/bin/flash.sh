#! /vendor/bin/sh
md5img=$(md5sum "/vendor/etc/tt_img/Signal.pkg"  | awk '{print $1}')
log -p i -t "flash.sh" "md5img = $md5img"
if [ ! -e "/data/vendor/tt_md5sum/md5sum" ];then
    log -p i -t "flash.sh" "md5sum do not exist,create it!"
    `touch /data/vendor/tt_md5sum/md5sum`
fi

val=$(</data/vendor/tt_md5sum/md5sum)
factory=`getprop persist.odm.radio.factorybuild`
region=`getprop ro.miui.build.region`
device=`getprop ro.product.device`
log -p i -t "flash.sh" "val = $val"
log -p i -t "flash.sh" "factory = $factory"
log -p i -t "flash.sh" "region = $region"
log -p i -t "flash.sh" "device = $device"

if [ "$val" != "$md5img" ];then
   log -p i -t "flash.sh" "enter"
   if [ "$factory" != "1" -a "$region" == "cn" -a "$device" == "xuanyuan" ];then
       log -p i -t "flash.sh" "flash_mode_start"

       #flash mode
       /odm/bin/ttftm_msc06a_daemon -p flash_on &
       bin1_pid=$!
       wait $bin1_pid
       log -p i -t "flash.sh" "flash_mode_pid = $bin1_pid"
       log -p i -t "flash.sh" "flash_mode_end"
       sleep 0.5
   
       #start flash
       log -p i -t "flash.sh" "burn_img_start"
       /odm/bin/flashmsc06a /dev/ttyHS5 4000000 1 /vendor/etc/tt_img/Signal.pkg &
       bin2_pid=$!
       wait $bin2_pid
       log -p i -t "flash.sh" "burn_img_pid = $bin2_pid"
       log -p i -t "flash.sh" "burn_img_end"
       sleep 0.5

       #If flash failure, retry twice.
       for i in {1..2}; do
          if [ $? == 0 ]; then
             log -p i -t "flash.sh" "burn_img_ok"
             break 
          else
             log -p i -t "flash.sh" "burn failure, retry &i times"
             log -p i -t "flash.sh" "retry_burn_img_start"
             /odm/bin/ttftm_msc06a_daemon -p flash_on &
             bin3_pid=$!
             wait $bin3_pid
             sleep 0.5
             /odm/bin/flashmsc06a /dev/ttyHS5 4000000 1 /vendor/etc/tt_img/Signal.pkg &
             bin4_pid=$!
             wait $bin4_pid
             log -p i -t "flash.sh" "retry_burn_img_pid = $bin2_pid"
             log -p i -t "flash.sh" "retry_burn_img_end"
             sleep 0.5
          fi
       done

       #power off
       log -p i -t "flash.sh" "power off_start"
       /odm/bin/ttftm_msc06a_daemon -p off &
       bin5_pid=$!
       wait $bin5_pid
       log -p i -t "flash.sh" "bin4_pid = $bin5_pid"
       log -p i -t "flash.sh" "power off_end"
       sleep 0.5

       #write md5img value
       `echo $md5img > /data/vendor/tt_md5sum/md5sum`
   else
       log -p i -t "flash.sh" "do nothing!"
   fi

fi

