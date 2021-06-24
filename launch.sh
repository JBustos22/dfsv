sudo docker-compose down
source sv.conf
COUNTER=0
echo "Checking sv.conf for required settings..."
for CONFIGURABLE in SV_BASE_HOSTNAME SV_RCON SV_LOCATION ADMIN_NAME; do
	if [[ "${!CONFIGURABLE}" = "" ]]
	then
		read -p "Enter $CONFIGURABLE: " $CONFIGURABLE
	fi
done
printf "\nServer Hostname: $SV_BASE_HOSTNAME\nAdmin: $ADMIN_NAME\nRcon Password: $SV_RCON\nServer Location: $SV_LOCATION\n\n"

echo "Generating docker compose file"
curr_port=27960
rm -rf docker-compose.yml &>/dev/null
printf 'version: "3"\n' >> docker-compose.yml
printf 'services:' >> docker-compose.yml 2>&1
for sv_type in mixed cpm vq3 fastcaps teamruns freestyle;do
	i=0
	sv_qty="${sv_type}_count"
        sv_sfx="${sv_type}_sfx"
	while [[ $i -ne "${!sv_qty}" ]]
	do
	  curr_id="rs${curr_port}"
		i=$(($i+1))
		curr_name="${sv_type}_${i}"
		curr_hostname="${SV_BASE_HOSTNAME} ${!sv_sfx} ${i}"
		printf "
  ${curr_name}:
    build: .
    image: dfsv:latest
    container_name: ${curr_name}
    ports:
      - \"${curr_port}:27960/udp\"
      - \"${curr_port}:27960/tcp\"
    volumes:
      - base:/dfsv
      - maps:/dfsv/nfs/maps
    environment:
      - MDD_ENABLED=${MDD_ENABLED}
      - RS_ID=${!curr_id}
      - NAME_ID=${curr_name}
      - SV_TYPE=${sv_type}
      - SV_HOSTNAME=${curr_hostname}
      - SV_RCON=${SV_RCON}
      - SV_LOCATION=${SV_LOCATION}
      - ADMIN_NAME=${ADMIN_NAME}
      - ADMIN_MAIL=${ADMIN_MAIL}
      - ADMIN_DISCORD=${ADMIN_DISCORD}
      - ADMIN_IRC=${ADMIN_IRC}
      - SV_MAPBASE=${SV_MAPBASE}
      - SV_HOMEPAGE=${SV_HOMEPAGE}
      - SV_PRIVATE=${SV_PRIVATE}
      - SV_PASSWORD=${SV_PASSWORD}" >> docker-compose.yml 2>&1
	sudo mkdir servers/base/defrag/$curr_name &>/dev/null
	sudo cp cfgs/${sv_type}.cfg servers/base/defrag/$curr_name/main.cfg
        curr_port=$(($curr_port+1))
	done
done
sudo rm servers/base/defrag/q3config_server.cfg &>/dev/null
printf "
volumes:
  base:
    driver_opts:
      type: none
      device: $(pwd)/servers/base
      o: bind
  maps:
    driver_opts:
      type: \"nfs\"
      o: \"addr=212.24.100.183,ac,actimeo=9999\"
      device: \":/nfs/bsp\"
" >> docker-compose.yml 2>&1
read -p "Start servers now? (Y/n): " $REPLY
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Starting servers..."
    sudo docker-compose up --force-recreate -d
    echo "All set! Check your server's connection with /connect $(hostname -I | cut -d' ' -f1) through a defrag client"
fi
