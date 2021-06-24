FROM i386/ubuntu
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y wget mysql-common:i386 libicu60:i386 unionfs-fuse
RUN wget http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.7/libmysqlclient20_5.7.21-1ubuntu1_i386.deb
RUN dpkg -i libmysqlclient20_5.7.21-1ubuntu1_i386.deb
RUN wget http://security.ubuntu.com/ubuntu/pool/main/libx/libxml2/libxml2_2.9.4+dfsg1-6.1ubuntu1.4_i386.deb
RUN dpkg -i libxml2_2.9.4+dfsg1-6.1ubuntu1.3_i386.deb
RUN apt-get install -y
RUN apt-get install -y --fix-missing
WORKDIR /dfsv
ENTRYPOINT ./start.sh
