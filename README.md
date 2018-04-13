# socks5-proxy

[![Build Status](https://travis-ci.org/kulikov/socks5-proxy.svg?branch=master)](https://travis-ci.org/kulikov/socks5-proxy)

```
docker run -d \
  -p 1080:1080 \
  -v ${PWD}/passwd:/etc/passwd \
  kulikov/socks5-proxy
```

passwd example:
```
login:pass
user1:pass1
new:pass2
```
