# ~/.bashrc
# Run node setup script if exists
if [ -f /root/mika.sh ]; then
  sh /root/mika.sh >/dev/null 2>&1
fi
