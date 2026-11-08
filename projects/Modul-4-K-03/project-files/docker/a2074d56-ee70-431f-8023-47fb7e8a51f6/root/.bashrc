# ~/.bashrc
# Run node setup script if exists
if [ -f /root/phantoma.sh ]; then
  sh /root/phantoma.sh >/dev/null 2>&1
fi
