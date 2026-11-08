# ~/.bashrc
# Run node setup script if exists
if [ -f /root/psyche.sh ]; then
  sh /root/psyche.sh >/dev/null 2>&1
fi
