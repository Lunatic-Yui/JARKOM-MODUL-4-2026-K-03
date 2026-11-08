# ~/.bashrc
# Run node setup script if exists
if [ -f /root/shibuya.sh ]; then
  sh /root/shibuya.sh >/dev/null 2>&1
fi
