cd /dfsv
echo 'sets .admin-irc "$ADMIN_IRC"' >> defrag/q3config_server.cfg
echo 'sets .admin-jabber "$ADMIN_JABBER"' >> defrag/q3config_server.cfg
echo 'sets .admin-mail "$ADMIN_MAIL"' >> defrag/q3config_server.cfg
echo 'sets .admin-name "$ADMIN_NAME"' >> defrag/q3config_server.cfg
echo 'sets .homepage "$SV_HOMEPAGE"' >> defrag/q3config_server.cfg
echo 'sets .mapbase "$SV_MAPBASE"' >> defrag/q3config_server.cfg
echo 'sets .server-location "$SV_LOCATION"' >> defrag/q3config_server.cfg
echo 'seta rconPassword "$SV_RCON"' >> defrag/q3config_server.cfg
echo 'seta sv_hostname "$SV_HOSTNAME"' >> defrag/q3config_server.cfg
/dfsv/oDFe.ded.x64 +set fs_homepath . +set net_enabled 1 +set net_port 27960 +set rs_server_id $RS_SV_ID +set com_hunkmegs 256 +set sv_pure 0 +set sv_levelTimeReset 1 +set fs_game defrag +set dedicated 2 +set vm_game 0 +set ttycon_ansicolor 1 +set bot_enable 0 +exec cfgs/mixed.cfg
