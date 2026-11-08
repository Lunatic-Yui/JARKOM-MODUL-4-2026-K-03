# ~/.bashrc
# Run node setup script if exists
if [ -f /root/tachibana.sh ]; then
  sh /root/tachibana.sh >/dev/null 2>&1
fi
