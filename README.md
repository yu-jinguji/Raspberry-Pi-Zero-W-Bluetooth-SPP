# Raspberry Pi Zero WでBluetooth SPP通信する方法
### デスクトップOFF
[設定]-[Raspberry Piの設定]-[システムタブ]のブートを[CLI]に設定する
  
### Bluetooth SPP
	$ sudo vi /etc/systemd/system/dbus-org.bluez.service
	  (変更前) ExecStart=/usr/lib/bluetooth/bluetoothd
	  (変更後) ExecStart=/usr/lib/bluetooth/bluetoothd --compat

	$ vi /home/pi/auto.sh
	  (新規作成)

	$ chmod u+x /home/pi/auto.sh

	$ sudo vi /etc/rc.local
	  (追加) /home/pi/auto.sh &
  
### 不要サービス停止
	$ sudo systemctl disable dhcpcd.service
