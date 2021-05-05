docker build -t dfsv_image .
docker run -d -t --name mixed_1 -p 27960:27960/udp -p 27960:27960/tcp dfsv_image:latest
docker cp cfgs/q3config_server.cfg mixed_1:/dfsv/defrag/
