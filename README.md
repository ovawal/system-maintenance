## Bash sript to update, upgrade and log the system every Sunday at 2:00am

### Script will run on CentOS,Rocky and RHEL systems.

#### Follow this procedure to run the script.

1.Download file to local machine

2.Move systemupdate.sh
```
sudo mv /path/to/your/download/script/systemupdate.sh /usr/local/sbin

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
```
sudo systemctl start systemupdate.service

```
#### System update will occur every Sunday at 2am.
#### To test your script immediately run

```
sudo systemctl start systemupdate.service

````
