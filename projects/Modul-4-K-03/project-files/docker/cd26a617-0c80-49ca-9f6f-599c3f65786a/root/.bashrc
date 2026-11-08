# ~/.bashrc
# Run node setup script if exists
if [ -f /root/hodgeson.sh ]; then
  sh /root/hodgeson.sh >/dev/null 2>&1
fi
