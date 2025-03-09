echo "Installing dummy systemd service..."
sleep 2

sudo chmod +x dummy.sh
if [ ! -d /usr/bin/dummy/ ]; then
    sudo mkdir /usr/bin/dummy/
fi
sudo cp dummy.sh /usr/bin/dummy/

sudo cp dummy.service /etc/systemd/system/

sudo systemctl daemon-reload

echo "Dummy systemd service installed successfully!"