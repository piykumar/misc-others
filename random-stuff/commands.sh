#Tcpdump
tcpdump -ni eth0 -s0 host 4.2.2.2 -w tcpdump.pcap

#JSESSIONID retrieve from cookie logs
awk 'match($0, /JSESSIONID=([^;]*);/, a) {print a[1]}'

# cURL extract the cookie uuid
curl -v http://example.com 2>&1 | awk 'match($0, /UUID=([^;]*);/, a) {print a[1]}'
 
# Simple install of dev packages 
yum groupinstall 'Development Tools'
