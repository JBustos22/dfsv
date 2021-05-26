base=./servers/base/
apt-get update && apt-get install unzip wget
# set up server backbone
wget http://dl.defrag.racing/downloads/dfsv.tar.gz
tar -xvzf dfsv.tar.gz
mv dfsv/* $base/ && rm -rf dfsv
rm -rf dfsv.tar.gz dfsv

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
