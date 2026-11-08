# ~/.bashrc
# Run node setup script if exists
if [ -f /root/wired.sh ]; then
  sh /root/wired.sh >/dev/null 2>&1
fi
