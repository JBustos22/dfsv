apt update && apt -y install docker.io docker-compose unzip wget nano
service docker start
base=$(pwd)/servers/base/

mkdir ./{maps,data}
mkdir $base/baseq3
mkdir maps
rm -rf temp && mkdir temp
cd temp

# set up server backbone
wget http://dl.defrag.racing/downloads/dfsv.tar.gz
tar -xvzf dfsv.tar.gz
mv dfsv/*.dat $base/ && mv dfsv/baseq3/* $base/baseq3

# get latest defrag engine
wget http://dl.defrag.racing/downloads/oDFe.ded
mv oDFe.ded $base/

# get latest defrag version
wget $(wget --spider -r --no-parent --no-check-certificate https://q3defrag.org/files/defrag/ 2>&1 | grep -E "\-\-2" | grep "defrag_" | grep -v "beta" | cut -d' ' -f4 | sort | tail -n1)
unzip -o defrag*.zip
mkdir $base/defrag/
mv defrag/zz-* $base/defrag/

# get recordsystem modules
wget http://dl.defrag.racing/downloads/rs.tar.gz
tar -xvzf rs.tar.gz
mv defrag/modules $base/defrag/ && mv defrag/qagame* $base/defrag/qagamei386.so

cd ..
rm -rf temp

# get default maps
./dlmap.sh st1
./dlmap.sh amt-freestyle6
./dlmap.sh ojdf-sa
