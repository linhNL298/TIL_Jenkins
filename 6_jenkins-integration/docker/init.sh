# mkdir -p /var/jenkins_home
# chown -R 1000:1000 /var/jenkins_home

echo "vm.max_map_count=262144" | sudo tee -a /etc/sysctl.conf
sudo sysctl -w vm.max_map_count=262144