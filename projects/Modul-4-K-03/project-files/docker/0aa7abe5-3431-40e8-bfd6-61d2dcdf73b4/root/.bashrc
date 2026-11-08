# ~/.bashrc
# Run node setup script if exists
if [ -f /root/denpa.sh ]; then
  sh /root/denpa.sh >/dev/null 2>&1
fi
