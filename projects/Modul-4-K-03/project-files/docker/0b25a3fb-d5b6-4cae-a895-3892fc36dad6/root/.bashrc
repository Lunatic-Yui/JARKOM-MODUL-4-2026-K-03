# ~/.bashrc
# Run node setup script if exists
if [ -f /root/yasuo.sh ]; then
  sh /root/yasuo.sh >/dev/null 2>&1
fi
