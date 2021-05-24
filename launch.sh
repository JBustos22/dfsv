docker stop mixed_1 && docker rm mixed_1
SV_HOSTNAME=""
SV_RCON=""
SV_LOCATION=""
MIXED_COUNT=""

#OPTIONAL
ADMIN_NAME=""
ADMIN_MAIL=""
ADMIN_JABBER=""
ADMIN_IRC=""
SV_MAPBASE="https://ws.q3df.org"
SV_HOMEPAGE="discord.q3df.run"

COUNTER=0
for CONFIGURABLE in SV_HOSTNAME SV_RCON SV_LOCATION; do
	if [[ "${!CONFIGURABLE}" = "" ]]
	then
		read -p "Enter $CONFIGURABLE: " $CONFIGURABLE
	fi
done
printf "\nServer Hostname: $SV_HOSTNAME\nRcon Password: $SV_RCON\nServer Location: $SV_LOCATION\n\n"

docker run -d -t \
--name mixed_1 \
-v dfsv:/dfsv \
-e SV_HOSTNAME="$SV_HOSTNAME" \
-e SV_RCON="$SV_RCON" \
-e SV_LOCATION="$SV_LOCATION" \
-e ADMIN_NAME="$ADMIN_NAME" \
-e ADMIN_MAIL="$ADMIN_MAIL" \
-e ADMIN_JABBER="$ADMIN_JABBER" \
-e ADMIN_IRC="$ADMIN_IRC" \
-e SV_MAPBASE="$SV_MAPBASE" \
-e SV_HOMEPAGE="$SV_HOMEPAGE" \
-p 27960:27960/udp \
-p 27960:27960/tcp \
dfsv_image:latest
docker cp cfgs/q3config_server.cfg mixed_1:/dfsv/defrag/
docker cp cfgs/mixed.cfg mixed_1:/dfsv/defrag
