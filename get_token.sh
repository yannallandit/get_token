#!/bin/bash

##########################################
# Yann Allandit - HPE
##########################################

#################################
#### Instructions
# This file will generate a connection token from demo.cloudvolumes.hpe.com. 
# Then update your HPE Cloud Volumes credentiales stores in /tmp/cvuser and  /tmp/cvpwd
#################################


#### Variables
location="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cvpwd=`sudo cat /tmp/cvpwd`
cvuser=`sudo cat /tmp/cvuser`
tokenlength=1
loopcount=0

while [ ${tokenlength} -le 11 ]
do
  token=`curl --location --request POST 'https://demo.cloudvolumes.hpe.com/auth/login' \
  --header 'Content-Type: application/json' \
  --data '{
      "email": "'${cvuser}'",
      "password": "'${cvpwd}'"
  }' | jq -r .token`

  tokenlength=`echo ${#token}`
  loopcount=$(( ${loopcount} + 1 ))
  sleep 1
done

pid=`echo $BASHPID`
jour=`date`
echo "date " ${jour} >> /tmp/${pid}.log
echo "token: " ${token} >> /tmp/${pid}.log
echo "Number of connection for getting the token: " ${loopcount} >> /tmp/${pid}.log

echo ${token}

exit
