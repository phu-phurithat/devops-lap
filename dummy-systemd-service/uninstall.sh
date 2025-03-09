echo "Stopping and uninstalling dummy systemd service..."
sleep 2

sudo systemctl stop dummy.service
sudo systemctl disable dummy.service

sudo rm /etc/systemd/system/dummy.service
sudo rm -rf /usr/bin/dummy/
sudo rm /var/log/dummy-service.log

sudo systemctl daemon-reload

echo "Dummy systemd service stopped and uninstalled successfully!"