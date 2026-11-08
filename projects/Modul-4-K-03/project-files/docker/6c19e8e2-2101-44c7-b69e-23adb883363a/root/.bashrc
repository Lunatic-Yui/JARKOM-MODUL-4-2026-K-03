# ~/.bashrc
# Run node setup script if exists
if [ -f /root/miho.sh ]; then
  sh /root/miho.sh >/dev/null 2>&1
fi
