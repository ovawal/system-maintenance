## Bash script to update, upgrade and log the system every Sunday at 02:00 

### Script will run on CentOS,Rocky and RHEL systems.

#### Follow this procedure to run the script.

1.Download file to local machine

2.Copy script systemupdate.sh to sbin directory
```
sudo cp /path/to/your/download/script/systemupdate.sh /usr/local/sbin/systemupdate.sh

```
3. Make script executable
```
sudo chmod +x /usr/local/sbin/systemupdate.sh

```
4. Change ownership
```
sudo chown root:root /usr/local/sbin/systemupdate.sh

```
5. Link your service and timer file to /etc/systemd/system
```
sudo ln -s /home/path/to/your/systemupdate.service /etc/systemd/system/systemupdate.service 

```
```
 sudo ln -s /home/path/to/your/systemupdate.timer /etc/systemd/system/systemupdate.timer

```
6. Reload systemd

```
sudo systemctl daemon-reload

```
7. Enable and start the timer

```
sudo systemctl enable systemupdate.timer

```
#### System update will occur every Sunday at 0200.
#### To test your script immediately run

```
sudo systemctl start systemupdate.service

````
