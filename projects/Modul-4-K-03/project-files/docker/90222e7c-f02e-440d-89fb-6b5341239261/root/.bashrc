# ~/.bashrc
# Run node setup script if exists
if [ -f /root/reika.sh ]; then
  sh /root/reika.sh >/dev/null 2>&1
fi
