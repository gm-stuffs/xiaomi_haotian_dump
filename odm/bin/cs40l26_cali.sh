#set -e

# Usage help
case $1 in
	0 | 1 | 2 | 3)
		;;
	*)
		echo Usage:
		echo -e "cs40l26_cali.sh <command>\n"
		echo 'command:'
		echo '0 - Only calibration'
		echo '1 - Enable F0 compenstation after calibration'
		echo '2 - Enable ReDC compenstation after calibration'
		echo '3 - Enable both F0 and ReDC compenstation after calibration'
		exit 2
		;;
esac


# Check if cs40l26 device is available
sysfs_path=$(find /sys/devices/ -type f -name 'name' | xargs grep -nl "cs40l26_input" | sed 's/\/name$//')
if [ -z $sysfs_path ]; then
echo 'cs40l26_input device can NOT be found in system!'
exit 2
fi
echo "cs40l26_input device -> $sysfs_path"
sysfs_def_path=$sysfs_path/default
sysfs_cal_path=$sysfs_path/calibration


# Check if vibe_state is ready to do calibration
vibe_state=$(<$sysfs_def_path/vibe_state)
if [ $vibe_state -ne 0 ]; then
echo 'Calibration can NOT be performed until I2C/I2S playback is stopped.'
exit 2
fi


# Swap to calibration firmware
fw=$(<$sysfs_def_path/swap_firmware)
if [ $fw -eq 0 ]; then
echo 'Swap to calibration firmware'
echo 1 >$sysfs_def_path/swap_firmware
fi
if [ $? -ne 0 ]; then
echo 'Failed to swap to calibration firmware'
exit 2
else
redc_cal_sleep_time=$(echo "scale=3; $(<$sysfs_cal_path/redc_cal_time_ms) / 1000" | bc)
f0_and_q_sleep_time=$(echo "scale=3; $(<$sysfs_cal_path/f0_and_q_cal_time_ms) / 1000" | bc)
echo redc_cal_sleep_time=$redc_cal_sleep_time
echo f0_and_q_sleep_time=$f0_and_q_sleep_time

# trigger REDC calibration using SVC, REDC must be executed first if an accurate Q value is desired
echo 'Trigger ReDC ...'
time echo 2 > $sysfs_cal_path/trigger_calibration
sleep $redc_cal_sleep_time
# copy the calibrated REDC value from SVC memory space to F0+Q memory for accurate Q calibration
cat $sysfs_cal_path/redc_measured > $sysfs_cal_path/redc_est
# trigger F0+Q estimation
echo -e "\nTrigger F0+Q ..."
time echo 1 > $sysfs_cal_path/trigger_calibration
sleep $f0_and_q_sleep_time
redc=$(<$sysfs_cal_path/redc_measured)
f0=$(<$sysfs_cal_path/f0_measured)
q=$(<$sysfs_cal_path/q_measured)
redc_float=$(echo "ibase=16;scale=3; $redc / 2^F" | bc)
f0_float=$(echo "ibase=16;scale=2; $f0 / 2^E" | bc)
q_float=$(echo "ibase=16;scale=2; $q / 2^10" | bc)
echo -e "\n"
echo redc=$redc
echo f0=$f0
echo q=$q
echo "ReDC = $redc_float ohms, F0 = $f0_float Hz, Q = $q_float"
fi


# Swap to runtime firmware
echo -e '\nSwap to runtime firmware'
echo 0 >$sysfs_def_path/swap_firmware
if [ $? -ne 0 ]; then
echo 'Failed to swap to runtime firmware'
exit 2
else
:
echo $redc >$sysfs_cal_path/redc_stored
echo $f0 >$sysfs_cal_path/f0_stored
echo $q >$sysfs_cal_path/q_stored
fi


# Apply compensation setting accordingly
echo -e "\nApply compensation setting($1) accordingly"
echo 0 >$sysfs_def_path/f0_comp_enable
echo 0 >$sysfs_def_path/redc_comp_enable
case $1 in
	1)
		echo 1 >$sysfs_def_path/f0_comp_enable
		;;
	2)
		echo 1 >$sysfs_def_path/redc_comp_enable
		;;
	3)
		echo 1 >$sysfs_def_path/f0_comp_enable
		echo 1 >$sysfs_def_path/redc_comp_enable
		;;
	*)
		;;
esac

echo Done





