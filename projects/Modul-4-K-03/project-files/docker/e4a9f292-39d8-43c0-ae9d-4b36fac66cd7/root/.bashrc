# ~/.bashrc
# Run node setup script if exists
if [ -f /root/alice.sh ]; then
  sh /root/alice.sh >/dev/null 2>&1
fi
