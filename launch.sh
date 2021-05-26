# Important server metadata
SV_BASE_HOSTNAME="^2Frog's Pond"
SV_RCON="frogspond"
SV_LOCATION="Atlanta, Georgia, USA"
ADMIN_NAME="Frog"

# Server count configurables
mixed_count=1
cpm_count=1
vq3_count=1
fastcaps_count=1
teamruns_count=1
freestyle_count=1

# Optional: Contact info
ADMIN_MAIL=""
ADMIN_JABBER=""
ADMIN_IRC=""
SV_MAPBASE="https://ws.q3df.org"
SV_HOMEPAGE="discord.q3df.run"

COUNTER=0
for CONFIGURABLE in SV_BASE_HOSTNAME SV_RCON SV_LOCATION ADMIN_NAME; do
	if [[ "${!CONFIGURABLE}" = "" ]]
	then
		read -p "Enter $CONFIGURABLE: " $CONFIGURABLE
	fi
done
printf "\nServer Hostname: $SV_HOSTNAME\nAdmin: $ADMIN_NAME\nRcon Password: $SV_RCON\nServer Location: $SV_LOCATION\n\n"

curr_port=27960
rm -rf docker-compose.yml
printf 'version: "3"\n' >> docker-compose.yml
printf 'services:' >> docker-compose.yml 2>&1
for sv_type in mixed cpm vq3 fastcaps teamruns freestyle;do
	i=0
	sv_qty="${sv_type}_count"
	while [[ $i -ne "${!sv_qty}" ]]
	do
		i=$(($i+1))
		curr_name="${sv_type}_${i}"
		curr_port=$(($curr_port+1))
		curr_hostname="${SV_BASE_HOSTNAME} | ${sv_type^} ${i}"
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
    environment:
      - NAME_ID=${curr_name}
      - SV_TYPE=${sv_type}
      - SV_HOSTNAME=${curr_hostname}
      - SV_RCON=${SV_RCON}
      - SV_LOCATION=${SV_LOCATION}
      - ADMIN_NAME=${ADMIN_NAME}
      - ADMIN_MAIL=${ADMIN_MAIL}
      - ADMIN_JABBER=${ADMIN_JABBER}
      - ADMIN_IRC=${ADMIN_IRC}
      - SV_MAPBASE=${SV_MAPBASE}
      - SV_HOMEPAGE=${SV_HOMEPAGE}" >> docker-compose.yml 2>&1
	mkdir servers/base/defrag/$curr_name
	cp cfgs/${sv_type}.cfg servers/base/defrag/$curr_name/main.cfg
	done
done
printf "
volumes:
  base:
    driver_opts:
      type: none
      device: $(pwd)/servers/base
      o: bind
" >> docker-compose.yml 2>&1
docker-compose up -d
