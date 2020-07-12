
# Pony with jennet

https://github.com/Theodus/jennet

## Prerequisites

* corral
* ponyc
* OpenSSL v1.1.1g

## Usage

```sh
corral fetch
corral run -- ponyc -p /usr/local/Cellar/openssl@1.1/1.1.1g/lib -Dopenssl_1.1.x --bin-name app
./app
```

And open http://localhost:8080 with your browser
