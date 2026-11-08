# ~/.bashrc
# Run node setup script if exists
if [ -f /root/akashic.sh ]; then
  sh /root/akashic.sh >/dev/null 2>&1
fi
