# socks5-proxy

```
docker run -d \
  -p 1080:1080 \
  -v ${PWD}/passwd:/etc/passwd \
  kulikov/socks5-docker
```

passwd example:
```
login:pass
user1:pass1
new:pass2
```
