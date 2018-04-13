# socks5-proxy

[![Build Status](https://travis-ci.org/kulikov/socks5-proxy.svg?branch=master)](https://travis-ci.org/kulikov/socks5-proxy)

```
docker run -d \
  --name=socks5-proxy \
  -p 1080:1080 \
  -v ${PWD}/passwd:/etc/passwd \
  --restart=always \
  kulikov/socks5-proxy
```

passwd file example:
```
login:pass
user1:pass1
new:pass2
```
