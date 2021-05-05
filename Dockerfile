FROM ubuntu:bionic

RUN apt-get update && apt-get -y install unzip wget

# get q3 server backbone
RUN wget http://dl.defrag.racing/downloads/dfsv.tar.gz
RUN tar -xvzf dfsv.tar.gz

WORKDIR /dfsv

# get latest version of dedicated engine
RUN wget https://github.com/JBustos22/oDFe/releases/download/latest/oDFe-linux-x86_64.zip
RUN unzip oDFe-linux-x86_64.zip && rm oDFe.x64 oDFe-linux-x86_64.zip oDFe.vk.x64

# get latest version of DF
RUN wget $(cd /tmp/ && wget --spider -r --no-parent --no-check-certificate https://q3defrag.org/files/defrag/ 2>&1 | grep -E "\-\-2" | grep "defrag_" | grep -v "beta" | cut -d' ' -f4 | sort | tail -n1)
RUN unzip -o defrag*.zip && rm *.zip

COPY ./cfgs/ ./defrag/cfgs/
COPY ./scripts/start.sh .
RUN chmod +x oDFe.ded.x64

ENTRYPOINT ./start.sh
