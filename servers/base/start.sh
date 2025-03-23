#!/bin/bash
printf "sets .admin-irc \"$ADMIN_IRC\"
sets .admin-discord \"$ADMIN_DICORD\"
sets .admin-mail \"$ADMIN_MAIL\"
sets .admin-name \"$ADMIN_NAME\"
sets .homepage \"$SV_HOMEPAGE\"
sets .mapbase \"$SV_MAPBASE\"
sets .server-location \"$SV_LOCATION\"
seta rconPassword \"$SV_RCON\"
seta sv_hostname \"$SV_HOSTNAME\"
seta df_sv_script_idleCfg \"${NAME_ID}/main.cfg\"
seta g_log \"${NAME_ID}/${NAME_ID}.log\"
" > defrag/$NAME_ID/main.cfg 2>&1

if [ $MDD_ENABLED -eq 1 ]
then
  export VM_GAME="0"
  printf  "seta rs_enable \"1\"
seta rs_mode \"0\"
seta rs_noserverdemos \"0\"
seta rs_anticheat \"1\"
seta rs_debug \"111\"
seta rs_floodlimit \"2\"
seta rs_maxClientConnections \"2\"
seta rs_mod_path \"defrag/modules\"
seta rs_banTimerReset \"0\"
seta df_obs_KillObs \"1\"
seta rs_modules \"admin challenge compare find login logout mapdownload mapinfo me my mytime oldmytime oldrank oldtime oldtop popular random rank rankings ranktime ratemap recent servers time top user version who\"
" > defrag/$NAME_ID/main.cfg 2>&1
else
  export VM_GAME="2"
fi

if [ $SV_PRIVATE -eq 1 ]
then
  printf "seta g_password \"$SV_PASSWORD\"\n" > defrag/$NAME_ID/main.cfg 2>&1
fi

case $SV_TYPE in

  mixed | vq3 | cpm)
    printf "map st1" > defrag/$NAME_ID/main.cfg 2>&1
    ;;

  fastcaps)
    printf "map q3ctf1" > defrag/$NAME_ID/main.cfg 2>&1
    ;;

  teamruns)
    printf "map ojdf-sa" > defrag/$NAME_ID/main.cfg 2>&1
    ;;

  freestyle)
    printf "devmap amt-freestyle6" > defrag/$NAME_ID/main.cfg 2>&1
    ;;
esac

chmod +x ./oDFe.ded
./oDFe.ded +set fs_homepath . +set fs_include ./nfs +set net_enabled 1 +set net_port $SV_PORT +set rs_server_id $RS_ID +set com_hunkmegs 256 +set sv_pure 0 +set sv_levelTimeReset 1 +set fs_game defrag +set dedicated 2 +set vm_game $VM_GAME +set ttycon_ansicolor 1 +set bot_enable 0 +exec $NAME_ID/main.cfg
