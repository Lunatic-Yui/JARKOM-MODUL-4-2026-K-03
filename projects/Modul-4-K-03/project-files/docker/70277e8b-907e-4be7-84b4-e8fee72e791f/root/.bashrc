# ~/.bashrc
# Run node setup script if exists
if [ -f /root/accela.sh ]; then
  sh /root/accela.sh >/dev/null 2>&1
fi
