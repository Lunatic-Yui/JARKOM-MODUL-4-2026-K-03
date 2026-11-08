# ~/.bashrc
# Run node setup script if exists
if [ -f /root/karl.sh ]; then
  sh /root/karl.sh >/dev/null 2>&1
fi
