SV_HOSTNAME="Uncle Sam's Defrag ATL"
SV_RCON="unclesam"
SV_LOCATION="Atlanta, Georgia"
MIXED_COUNT=

#OPTIONAL
ADMIN_NAME=""
ADMIN_MAIL=""
ADMIN_JABBER=""
ADMIN_IRC=""
SV_MAPBASE=""
SV_HOMEPAGE=""

COUNTER=0
for CONFIGURABLE in SV_HOSTNAME SV_RCON SV_LOCATION; do
	if [[ "${!CONFIGURABLE}" = "" ]]
	then
		read -p "Enter $CONFIGURABLE: " $CONFIGURABLE
	fi
done
printf "\nServer Hostname: $SV_HOSTNAME\nRcon Password: $SV_RCON\nServer Location: $SV_LOCATION\n\n"

docker run -d -t --name mixed_1 -v dfsv:/dfsv -p 27960:27960/udp -p 27960:27960/tcp dfsv_image:latest
docker cp servers/base/defrag/cfgs/q3config_server.cfg mixed_1:/dfsv/defrag/
