# ~/.bashrc
# Run node setup script if exists
if [ -f /root/omnipresence.sh ]; then
  sh /root/omnipresence.sh >/dev/null 2>&1
fi
