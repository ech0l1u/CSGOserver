#!/bin/sh
echo "Starting Cs:GO Server [CSGO-WARMOD:27015]"
cd /home/csgoserver
screen -A -m -d -S csgoWarModMan10 ./srcds_run -game csgo -console -usercon -nohltv -nowatchdog +host_timer_spin_ms 0  +game_type 0 +game_mode 1 +mapgroup mg_active -ip 0.0.0.0 -port 27015 -pidfile csgosrv1.pid -maxplayers_override 14 +map de_dust2 -tickrate 128 -net_port_try 1 -autoupdate -steam_dir  /home/steamcmd/ -steamcmd_script /home/man10update.txt
