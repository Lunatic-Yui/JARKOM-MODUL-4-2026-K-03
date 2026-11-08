# ~/.bashrc
# Run node setup script if exists
if [ -f /root/schumann.sh ]; then
  sh /root/schumann.sh >/dev/null 2>&1
fi
