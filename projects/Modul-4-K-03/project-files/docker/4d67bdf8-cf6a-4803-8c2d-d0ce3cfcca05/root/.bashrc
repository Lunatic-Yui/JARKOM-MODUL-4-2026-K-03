# ~/.bashrc
# Run node setup script if exists
if [ -f /root/kuma.sh ]; then
  sh /root/kuma.sh >/dev/null 2>&1
fi
