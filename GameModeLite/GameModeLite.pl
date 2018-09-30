#!/usr/bin/env perl

# GameModeLite.pl - change CPU governor dynamically on SteamOS
# If a process with 'steamapps' in the command line is running then
# set the governor to performance, otherwise powersave

$0='GameModeLite';

$game_running = (length(`pgrep -f steamapps`) > 0);
$last_status = -1;

while (1) {
    # Main loop
    $game_running = (length(`pgrep -f steamapps`) > 0);
    if ( $game_running != $last_status ) {
        if ( $game_running ) {
            print "Set performance\n";
            foreach $line (`cat /proc/cpuinfo`) {
                if ( $line =~ /processor.*([0-9]+)/i ) {
                    system("cpufreq-set", "-g", "performance", "-c", $1);
                }
            }
        } else {
            print "Set powersave\n";
            foreach $line (`cat /proc/cpuinfo`) {
                if ( $line =~ /processor.*([0-9]+)/i ) {
                    system("cpufreq-set", "-g", "powersave", "-c", $1);
                }
            }
        }
        $last_status = $game_running;
        system("cpufreq-info", "-o")
    }
    
    sleep 2
}