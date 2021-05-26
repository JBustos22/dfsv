apt update && apt -y install docker.io docker-compose unzip wget
service docker start
base=./servers/base/

mkdir ./{maps,data}
mkdir $base/baseq3 && mount --bind $base/baseq3 maps

# set up server backbone
wget http://dl.defrag.racing/downloads/dfsv.tar.gz
tar -xvzf dfsv.tar.gz
mv dfsv/*.dat $base/ && mv dfsv/baseq3/* $base/baseq3
rm -rf dfsv dfsv.tar.gz

# get latest defrag engine
wget https://github.com/JBustos22/oDFe/releases/download/latest/oDFe-linux-x86_64.zip
unzip oDFe-linux-x86_64.zip && rm oDFe.x64 oDFe-linux-x86_64.zip oDFe.vk.x64
mv oDFe.ded.x64 $base/

# get latest defrag version
wget $(cd /tmp/ && wget --spider -r --no-parent --no-check-certificate https://q3defrag.org/files/defrag/ 2>&1 | grep -E "\-\-2" | grep "defrag_" | grep -v "beta" | cut -d' ' -f4 | sort | tail -n1)
unzip -o defrag*.zip
mkdir $base/defrag/
mv defrag/zz-* $base/defrag/
rm -rf defrag*.zip defrag/

# get default maps
./dlmap.sh st1
./dlmap.sh amt-freestyle5
./dlmap.sh ojdf-sa
