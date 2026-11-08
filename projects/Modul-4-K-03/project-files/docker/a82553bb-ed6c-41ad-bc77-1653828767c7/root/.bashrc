# ~/.bashrc
# Run node setup script if exists
if [ -f /root/ghost.sh ]; then
  sh /root/ghost.sh >/dev/null 2>&1
fi
