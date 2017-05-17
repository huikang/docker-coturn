# docker-coturn
coturn running in docker

All use eth0 ip address

## Turn relay server on one host


```
docker run -it --name server --privileged --net=host huikang/coturn bash
```


```
PATH="bin:../bin:../../bin:${PATH}" turnserver -v --syslog -L 0.0.0.0 -E 0.0.0.0 --max-bps=3000000 -f\
 -m 3 --min-port=42355 --max-port=65535 --no-tls --no-dtls --no-auth --db="/usr/local/var/db/turndb"
 ```

-L means listening
-E means relay address


## Client on a different host

```
docker run -it --name client --privileged --net=host huikang/coturn bash
```
```
turnutils_uclient -D -n 10 -m 1 -l 171 -e 127.0.0.1 -g -X 127.0.0.1
turnutils_uclient -D -n 10 -m 1 -l 171 -e 192.168.121.29  -g -X 192.168.121.195
```

-e 127.0.0.1 means that the clients will use peer address 127.0.0.1.
192.168.121.195 is the turnserver ip address of eth0
192.168.121.29 is the peer's eth0 ip address.

Client talks to the peer through the turn server


## Peer on a third host

```
docker run -it --name peer --privileged --net=host huikang/coturn bash
```

```
turnutils_peer  -L 0.0.0.0 -L 127.0.0.1 -L 192.168.121.29   -v
```

192.168.121.29 is the eth0 ip address
0.0.0.0 seems not working

