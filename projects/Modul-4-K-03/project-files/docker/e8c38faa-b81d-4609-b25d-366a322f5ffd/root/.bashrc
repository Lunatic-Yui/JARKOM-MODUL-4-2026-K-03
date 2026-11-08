# ~/.bashrc
# Run node setup script if exists
if [ -f /root/navi.sh ]; then
  sh /root/navi.sh >/dev/null 2>&1
fi
