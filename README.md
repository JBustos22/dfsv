STEP 1: Renting a VPS
  Options:
  https://www.vultr.com/ < cheap and good quality
  https://aws.amazon.com/
  https://azure.microsoft.com/en-us/
  https://www.digitalocean.com/
  https://www.linode.com/
I will show the steps for vultr, as it is the easiest to set up.
1. Sign up
2. Click on the big + sign or find "Deploy New Server"
3. Choose "Cloud Compute"
4. Choose desired location
5. Choose 64 Bit Ubuntu (latest version)
6. Choose the $5/mo option (1 CPU 1 Mb RAM)
7. Click on "Deploy Now". Wait for server to finish installing
8. Once finished, click on the instance to see the details. You will see ip, username, and password.
9. From a Powershell window (should be installed in your windows already) or command line, execute the following command:
`ssh root@ipofyourinstance`
Enter the password
10. Once inside, run the following commands
`git clone https://github.com/JBustos22/dfsv.git`
`cd dfsv`
`./install.sh`
`./launch.sh`
11. Follow the instructions
12. Connect.

Customize configuration
run `nano sv.conf`

Uploading maps
from the machine that contains the desired map, run (from a powershell window or command line):
`scp path/to/your/map root@ipofyourinstance:/root/dfsv/maps/`
Enter your instance's password.
Restart your server by callvoting the current map.
Callvote your map!
