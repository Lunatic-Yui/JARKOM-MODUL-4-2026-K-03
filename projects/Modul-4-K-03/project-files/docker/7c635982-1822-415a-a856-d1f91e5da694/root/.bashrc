# ~/.bashrc
# Run node setup script if exists
if [ -f /root/lain.sh ]; then
  sh /root/lain.sh >/dev/null 2>&1
fi
