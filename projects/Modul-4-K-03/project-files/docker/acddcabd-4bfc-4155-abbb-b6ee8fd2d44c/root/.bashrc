# ~/.bashrc
# Run node setup script if exists
if [ -f /root/taro.sh ]; then
  sh /root/taro.sh >/dev/null 2>&1
fi
