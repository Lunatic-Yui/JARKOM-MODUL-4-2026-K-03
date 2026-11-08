# ~/.bashrc
# Run node setup script if exists
if [ -f /root/protocol7.sh ]; then
  sh /root/protocol7.sh >/dev/null 2>&1
fi
