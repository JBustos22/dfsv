printf "sets .admin-irc \"$ADMIN_IRC\"
sets .admin-jabber \"$ADMIN_JABBER\"
sets .admin-mail \"$ADMIN_MAIL\"
sets .admin-name \"$ADMIN_NAME\"
sets .homepage \"$SV_HOMEPAGE\"
sets .mapbase \"$SV_MAPBASE\"
sets .server-location \"$SV_LOCATION\"
seta rconPassword \"$SV_RCON\"
seta sv_hostname \"$SV_HOSTNAME\"
seta df_sv_script_idleCfg \"${NAME_ID}/main.cfg\"
seta g_log \"${NAME_ID}/${NAME_ID}.log\"
" >> defrag/$NAME_ID/main.cfg 2>&1

case $SV_TYPE in

  mixed | vq3 | cpm)
    printf "map st1" >> defrag/$NAME_ID/main.cfg 2>&1
    ;;

  fastcaps)
    printf "map q3ctf1" >> defrag/$NAME_ID/main.cfg 2>&1
    ;;

  teamruns)
    printf "map ojdf-sa" >> defrag/$NAME_ID/main.cfg 2>&1
    ;;

  freestyle)
    printf "devmap amt-freestyle6" >> defrag/$NAME_ID/main.cfg 2>&1
    ;;
esac

chmod +x ./oDFe.ded.x64
./oDFe.ded.x64 +set fs_homepath . +set net_enabled 1 +set net_port 27960 +set rs_server_id $RS_SV_ID +set com_hunkmegs 256 +set sv_pure 0 +set sv_levelTimeReset 1 +set fs_game defrag +set dedicated 2 +set vm_game 0 +set ttycon_ansicolor 1 +set bot_enable 0 +exec $NAME_ID/main.cfg
