printf 'sets .admin-irc "^3%s"\n' "$ADMIN_IRC" >> defrag/mixed.cfg 2>&1
printf 'sets .admin-jabber "^3%s"\n' "$ADMIN_JABBER" >> defrag/mixed.cfg 2>&1
printf 'sets .admin-mail "^3%s"\n' "$ADMIN_MAIL" >> defrag/mixed.cfg 2>&1
printf 'sets .admin-name "^3%s"\n' "$ADMIN_NAME" >> defrag/mixed.cfg 2>&1
printf 'sets .homepage "^3%s"\n' "$SV_HOMEPAGE" >> defrag/mixed.cfg 2>&1
printf 'sets .mapbase "^3%s"\n' "$SV_MAPBASE" >> defrag/mixed.cfg 2>&1
printf 'sets .server-location "^3%s"\n' "$SV_LOCATION" >> defrag/mixed.cfg 2>&1
printf 'seta rconPassword "%s"\n' "$SV_RCON" >> defrag/mixed.cfg 2>&1
printf 'seta sv_hostname "%s"\n' "$SV_HOSTNAME" >> defrag/mixed.cfg 2>&1
printf 'seta df_sv_script_idleCfg" "mixed.cfg"' >> defrag/mixed.cfg 2>&1
chmod +x ./oDFe.ded.x64
./oDFe.ded.x64 +set fs_homepath . +set net_enabled 1 +set net_port 27960 +set rs_server_id $RS_SV_ID +set com_hunkmegs 256 +set sv_pure 0 +set sv_levelTimeReset 1 +set fs_game defrag +set dedicated 2 +set vm_game 0 +set ttycon_ansicolor 1 +set bot_enable 0 +exec mixed.cfg
