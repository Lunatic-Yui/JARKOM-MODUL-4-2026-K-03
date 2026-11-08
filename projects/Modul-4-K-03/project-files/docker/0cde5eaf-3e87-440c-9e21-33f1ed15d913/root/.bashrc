# ~/.bashrc
# Run node setup script if exists
if [ -f /root/eiri.sh ]; then
  sh /root/eiri.sh >/dev/null 2>&1
fi
