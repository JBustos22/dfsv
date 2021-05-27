FROM i386/ubuntu
#RUN apt-get update
#RUN apt-get install multiarch-support
#RUN apt-add-architecture i386  
#RUN apt-get install libc6-i386
#RUN wget http://security.ubuntu.com/ubuntu/pool/main/libx/libxml2/libxml2_2.9.4+dfsg1-6.1ubuntu1.3_i386.deb
#RUN wget http://security.ubuntu.com/ubuntu/pool/main/m/mysql-5.7/libmysqlclient20_5.7.33-0ubuntu0.18.04.1_i386.deb
#RUN sudo dpkg -i libmysqlclient20_5.7.33-0ubuntu0.18.04.1_i386.deb
#RUN sudo dpkg --add-architecture i386
#RUN sudo apt-get update
#RUN sudo dpkg -i libmysqlclient20_5.7.33-0ubuntu0.18.04.1_i386.deb
#RUN apt-get install
#RUN apt-get --fix-broken install
#RUN dpkg -P libxml2
#RUN dpkg -i libxml2_2.9.4+dfsg1-6.1ubuntu1.3_i386.deb
#RUN apt-get install
#RUN apt --fix-broken install
WORKDIR /dfsv
ENTRYPOINT ./start.sh
