# ~/.bashrc
# Run node setup script if exists
if [ -f /root/collective.sh ]; then
  sh /root/collective.sh >/dev/null 2>&1
fi
