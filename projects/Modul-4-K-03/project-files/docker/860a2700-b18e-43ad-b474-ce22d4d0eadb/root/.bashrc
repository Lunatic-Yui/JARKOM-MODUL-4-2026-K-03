# ~/.bashrc
# Run node setup script if exists
if [ -f /root/cyberia.sh ]; then
  sh /root/cyberia.sh >/dev/null 2>&1
fi
