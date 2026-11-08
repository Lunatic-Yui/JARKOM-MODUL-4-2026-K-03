# ~/.bashrc
# Run node setup script if exists
if [ -f /root/lilith.sh ]; then
  sh /root/lilith.sh >/dev/null 2>&1
fi
