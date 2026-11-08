# ~/.bashrc
# Run node setup script if exists
if [ -f /root/myumyu.sh ]; then
  sh /root/myumyu.sh >/dev/null 2>&1
fi
