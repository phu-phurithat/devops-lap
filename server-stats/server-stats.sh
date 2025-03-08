echo "###################"
echo "# Total CPU Usage #"
echo "###################"

top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{printf "Usage: %d%%\n", 100-$1}'
echo

echo "###################"
echo "# Total RAM Usage #"
echo "###################"

free -m | awk 'NR==2{printf "Total: %dMB\nUsed: %dMB\nFree: %dMB\nUsage: %.2f%%\n", $2,$3,$4, $3/$2*100}'
echo

echo "###################"
echo "# Disk Usage      #"
echo "###################"

df -h | awk '$NF=="/"{printf "Size: %dGB\nUsed: %dGB\nAvailable: %dGB\nUsage: %.2f%%\n", $2,$3,$4,$5}'
echo

echo "###################"
echo "# Top 5 Processes #"
echo "# by Memory Usage #"
echo "###################"

ps aux --sort=-%mem | head -n 6 | awk '{printf "%s\t %d\t %.1f\t %s\n",$1,$2,$4,$11}'
echo

echo "###################"
echo "# Top 5 Processes #"
echo "# by CPU Usage    #"
echo "###################"

ps aux --sort=-%cpu | head -n 6 | awk '{printf "%s\t %d\t %.1f\t %s\n" ,$1,$2,$3,$11}'