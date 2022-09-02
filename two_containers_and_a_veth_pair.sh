# Start receiver docker container
           
docker run --name  --rm -dit \
           --name rxc \
           --privileged \
           --cap-add=ALL -d \
           -v /dev:/dev \
           -v /lib/modules:/lib/modules \
           netmap-docker:latest \
           bash \
	   || { echo 'Cannot start container.' ; exit 1; }

# Start transmitter docker container
docker run --name  --rm -dit \
           --name txc \
           --privileged \
           --cap-add=ALL -d \
           -v /dev:/dev \
           -v /lib/modules:/lib/modules \
           netmap-docker:latest \
           bash \
	   || { echo 'Cannot start container.' ; exit 1; }

sudo ./add_veth_to_docker/connect_containers_veth.sh txc rxc txc_veth rxc_veth
