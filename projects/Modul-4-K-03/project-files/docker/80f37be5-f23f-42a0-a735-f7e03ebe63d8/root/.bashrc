# ~/.bashrc
# Run node setup script if exists
if [ -f /root/lin.sh ]; then
  sh /root/lin.sh >/dev/null 2>&1
fi
