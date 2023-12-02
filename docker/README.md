## Docker Instruction
- FROM
- ADD
- COPY
- CMD
- ENTRYPOINT
- ENV
- EXPOSE
- MAINTAINER
- RUN
- USER
- VOLUME
- WORKDIR
- LABEL
- ARG

# s6
```
docker commit <container_id_or_name> <new_image_name>
docker commit 6924d76603a4 devopseasylearning/s7app1:v1.0.0

docker build -t devopseasylearning/s7app1:v1.0.0 .

docker run -itd -p 3564:80 devopseasylearning/s7app1:v1.0.0 .
server1.anomicatech.com:3564
server1.anomicatech.com:3564/creative
server1.anomicatech.com:3564/restaurant
server1.anomicatech.com:3564/articles

server2.anomicatech.com:3564
server2.anomicatech.com:3564/creative
server2.anomicatech.com:3564/restaurant
server2.anomicatech.com:3564/articles

server3.anomicatech.com:3564
server3.anomicatech.com:3564/creative
server3.anomicatech.com:3564/restaurant
server3.anomicatech.com:3564/articles
```