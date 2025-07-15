echo "######################"
echo "# System Uptime Info #"
echo "######################"

uptime

echo

echo "###################"
echo "# Total CPU Usada #"
echo "###################"

top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Usage: " 100-$1 "%"}'

echo

echo "##########################"
echo "# Total De Memoria Usada #"
echo "##########################"
free | grep "Mem:" -w | awk '{printf "Total: %.1fGi\nUsed: %.1fGi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",$2/1024^2, $3/1024^2, $3/$2 * 100, $4/1024^2, $4/$2 * 100}'

echo

echo "########################"
echo "# Total Do Disco Usado #"
echo "########################"
df -h | grep "/" -w | awk '{printf "Total: %sG\nUsed: %s (%.2f%%)\nFree: %s (%.2f%%)\n",$3 + $4, $3, $3/($3+$4) * 100, $4, $4/($3+$4) * 100}'

echo

echo "##################################"
echo "# Top 5 Processos por uso de CPU #"
echo "##################################"
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'

echo

echo "######################################"
echo "# Top 5 Processos por uso de memória #"
echo "######################################"
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
