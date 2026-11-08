# ~/.bashrc
# Run node setup script if exists
if [ -f /root/chisa.sh ]; then
  sh /root/chisa.sh >/dev/null 2>&1
fi
