
sleep 1

echo "enabling VI_TX"
agmcap /sdcard/VI_TX_record.wav -r 48000 -b 24 -c 2 -D 100 -d 101 -ikv 0 -skv 0xB1000009 -dkv 0xA3000009 -i TDM-LPAIF-TX-SECONDARY
