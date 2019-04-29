
# Set Video Resolution 1600x1200 60/50P 4:3
writeb 0xC06CC426 0x0C

# Set Bitrate 25M bps
# writew 0xC05C2092 0x41C8

# Set Bitrate 50M bps
# writew 0xC05C2092 0x4248

sleep 30
t pwm 1 enable
sleep 0.5
t pwm 1 disable
lu_util exec telnetd -l/bin/sh
t pwm 1 enable
sleep 1
t pwm 1 disable
lu_util exec '/tmp/fuse_d/wifi/sta.sh'
t pwm 1 enable
sleep 3
t pwm 1 disable
#Uncomment following line for network keepalive watchdog; EDIT watchdog.sh BEFORE USING! 
#lu_util exec '/tmp/fuse_d/wifi/watchdog.sh'
lu_util exec 'ftp.sh'
