# ~/.bashrc
# Run node setup script if exists
if [ -f /root/juri.sh ]; then
  sh /root/juri.sh >/dev/null 2>&1
fi
