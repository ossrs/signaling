# signaling

WebRTC signaling for https://github.com/ossrs/srs

## Usage

Build and [run SRS](https://github.com/ossrs/srs/tree/4.0release#usage):

```bash
docker run --rm --env CANDIDATE=$(ifconfig en0 inet| grep 'inet '|awk '{print $2}') \
  -p 1935:1935 -p 8080:8080 -p 1985:1985 -p 8000:8000/udp \
  registry.cn-hangzhou.aliyuncs.com/ossrs/srs:v4.0.95 \
  objs/srs -c conf/rtc.conf
```

Build and run signaling:

```bash
cd srs/trunk/3rdparty/signaling && make && ./objs/signaling
```

Open the H5 demos:

* [WebRTC: One to One over SFU(SRS)](http://localhost:1989/demos/one2one.html?autostart=true)

Winlin 2021.05
