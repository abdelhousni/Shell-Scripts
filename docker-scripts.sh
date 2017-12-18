
# destroy all runing containers
sudo docker rm $(sudo docker ps -a | sed -n '1!p' | cut -d' ' -f1)
