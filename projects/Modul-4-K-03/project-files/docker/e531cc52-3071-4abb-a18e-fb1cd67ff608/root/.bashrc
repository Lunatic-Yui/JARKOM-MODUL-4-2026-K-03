# ~/.bashrc
# Run node setup script if exists
if [ -f /root/semi.sh ]; then
  sh /root/semi.sh >/dev/null 2>&1
fi
