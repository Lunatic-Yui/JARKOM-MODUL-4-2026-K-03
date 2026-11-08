# ~/.bashrc
# Run node setup script if exists
if [ -f /root/masayuki.sh ]; then
  sh /root/masayuki.sh >/dev/null 2>&1
fi
