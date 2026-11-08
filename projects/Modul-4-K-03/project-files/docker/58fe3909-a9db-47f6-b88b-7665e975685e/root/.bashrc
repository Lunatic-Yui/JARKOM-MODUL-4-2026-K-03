# ~/.bashrc
# Run node setup script if exists
if [ -f /root/copland.sh ]; then
  sh /root/copland.sh >/dev/null 2>&1
fi
