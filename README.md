Minimum requirements: 
- 64 bit Debian-based Linux system
- 500 MB RAM
- 7 GB Storage

**Renting a VPS (*If you have your linux system ready, feel free skip ahead to the next section*)**

Options:
- https://www.vultr.com/ < cheap and good quality
- https://aws.amazon.com/
- https://azure.microsoft.com/en-us/
- https://www.digitalocean.com/
- https://www.linode.com/

*I will show the steps for vultr, as it is the easiest to set up.*
1. Sign up
2. Click on the big '+' sign or find "Deploy New Server"
3. Choose "Cloud Compute"
4. Choose desired location
5. Choose 64 Bit Ubuntu (latest version)
6. Choose the $5/mo option (1 CPU 1 Mb RAM). (Billed per hour of usage)
7. Click on "Deploy Now". Wait for server to finish installing
8. Once finished, click on the instance to see the details. You will see ip, username, and password.
9. From a Powershell window (should be installed in your windows already) or command line, execute the following command:
- `ssh root@ipofyourinstance`
- Enter the password, proceed to next section.

**Deploying the servers**
1. In your linux system, execute the following lines
- `git clone https://github.com/JBustos22/dfsv.git`
- `cd dfsv`
- `./install.sh`
- `/launch.sh`
2. Follow the instructions on the command line
3. Run docker ps -a to see the running servers if you chose to start them
4. Connect to `your instance's ip:port` through a defrag client

**Customization**
1. ssh into your instance
2. run `cd ~/dfsv`
3. run `nano sv.conf`
 - To set a permanent hostname, rcon, admin, and location, fill in the information in the first block
 - To make your server private, modify the "Server privacy" block. Set SV_PRIVATE to 1 and replace the default password to the desired one
 - To control how many and what types of servers to deploy, modify the "Server counts" block. (e.g mixed_count=3 for 3 mixed servers, so on.)
 - To modify the suffixes (- mixed 1, mixed 2, teamruns 1, etc.) Modify the "Server suffixes" block.
4. Once ready, press Ctrl + x
8. Type 'y', then press 'Enter'
9. rerun `./launch.sh` and to apply changes
10. run `docker ps -a` to see your deployed servers and their ports

**Uploading maps**

After following the previous steps, you will have all current maps on ws.q3df.org available on your server. However, if you'd like to upload custom maps or maps not present in world spawn, continue

From your local PC:
1. from the machine that contains the desired map, run (from a powershell window or command line):
- `scp path/to/your/map root@ipofyourinstance:/root/dfsv/maps/`
2. Enter your instance's password.
3. Restart your server from the game by callvoting the current map.
4. Callvote your map

From the instance OS:
1. run `cd ~/dfsv/maps`
2. run `wget link-to-map`
3. Restart your server from the game by callvoting the current map.
4. Callvote your map

**Quickly migrating to a new location while keeping settings**
1. Once you have all your desired settings, you can create a snapshot for free (at the time of this writeup) on vultr.
2. Click on the instance with all your settings
3. Go to the 'snapshots' tab
4. Create snapshot, enter whatever name suitable.
5. Re-do the deployment steps from the beginning of this readme, this type choosing "Snapshot" instead of "64 Bit OS"
6. Choose the snapshot with the name you chose in step 4.
7. Deploy. Once done installing, everything will be up but in your new location. Try connecting via defrag.
8. Destroy unused instances to avoid unecessary billing.
