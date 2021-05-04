FROM i386/ubuntu:bionic

RUN sudo apt-get -y install unzip

# get q3 server backbone
RUN wget http://dl.defrag.racing/downloads/dfsv.tar.gz
RUN tar -xvzf dfsv.tar.gz

WORKDIR /dfsv

# get latest version of dedicated engine
RUN wget https://github.com/JBustos22/oDFe/releases/download/latest/oDFe-linux-x86.zip
RUN unzip oDFe-linux-x86.zip && rm oDFe oDFe-linux-x86.zip oDFe.vk

# get latest version of DF
RUN DEFRAG_MOD_URL=$(cd /tmp/ && wget --spider -r --no-parent --no-check-certificate https://q3defrag.org/files/defrag/ 2>&1 | grep -E "\-\-2" | grep "defrag_" | grep -v "beta" | cut -d' ' -f4 | sort | tail -n1)
RUN curl --insecure $DEFRAG_MOD_URL > defrag-base/defrag.zip
RUN unzip -o defrag.zip && rm defrag.zip

CMD ["/bin/bash","start.sh"]
