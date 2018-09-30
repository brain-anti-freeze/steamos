GameModeLite

Very simple daemon to switch between powersave and performance CPU governors on SteamOS when a Steam game is running.  Requires cpufrequtils package be installed.  Must be ran as root.  It can be called from systemd too.

Copy GameModeLite.service to /etc/systemd/system.  Edit if necessary to change the path to where you saved GameModeLite.pl.  Run 'sudo systemctl enable GameModeLite.service'.  Reboot and make sure that 'GameModeLite' is running (ps -ef | grep GameModeLite).  You can see messages when the mode switches 'sudo journalctl -u GameModeLite'.
