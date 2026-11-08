# ~/.bashrc
# Run node setup script if exists
if [ -f /root/specter.sh ]; then
  sh /root/specter.sh >/dev/null 2>&1
fi
