docker run -d --name netdata -p 3999:19999 -v netdataconfig:/etc/netdata -v netdatalib:/var/lib/netdata -v netdatacache:/var/cache/netdata -v /etc/passwd:/host/etc/passwd:ro -v /etc/group:/host/etc/group:ro -v /proc:/host/proc:ro -v /sys:/host/sys:ro -v /etc/os-release:/host/etc/os-release:ro --rm --cap-add SYS_PTRACE --security-opt apparmor=unconfined netdata/netdata

IP=$(curl -s checkip.amazonaws.com)
echo "Aguardando TOKEN (geralmente 1 min)"
while [ "$(docker logs netdata | grep started | grep pid | wc -l)" != "1" ]; do
  printf "."
  sleep 1
done

echo ""
echo ""
echo "Config OK"
echo ""
echo ""
echo "URLs do projeto:"
echo ""
echo " - NETDATA      : http://$IP:3999"
