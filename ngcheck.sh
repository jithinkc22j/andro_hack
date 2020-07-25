echo " Checking ngrok ....... "
s=$(whoami)
echo " "
sleep 0.1
d= find | grep -w "ngrok.yml"
if [ $d = "./.ngrok2/ngrok.yml" ] 
then
  echo "ngrok found.........."
  echo " "
  read -p "Enter the full path to ngrok               :" pathn
  echo "  "
  cd $pathn
  echo " "
  read -p "Enter your authentication token                :" toke
  echo " "
  tt= ./ngrok authtoken $toke | grep -w "ERROR"
  if [ $tt = "ERROR:  You must pass a single argument, the authtoken to save to configuration file." ]
  then 
    echo " "
    echo " Token Authentication Failed....... "
    echo " "
    exit
  else
    ./ngrok authtoken $toke
    echo " "
    echo "Authentication successful & opening ngrok terminal "
    echo " "
    ./ngrok tcp 3389
  fi
else
   echo " "
   echo "ngrok not found........"
   echo " "
   sleep 0.5
   echo " Downloading ngrok ....."
   echo " "
   sleep 0.5
   echo " Register in ngrok - opening ngrok website.."
   echo " "
   sleep 0.5
   xdg-open https://dashboard.ngrok.com/signup
   while [ 1==1 ]
   do
   read -p " Have you completed registration [y/n] :" pp
   echo " "
   if [ $pp = 'y' ]
   then
      echo " Opening ngrok downloading page............. "
      echo " "
      sleep 0.5
      xdg-open https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
      echo " "
      sleep 0.5
      read -p " completed downloading..? [y/n] :" po
      echo " "
      sleep 0.5
      if [ $po = 'y' ]
      then
        cd /home/$s/Downloads
        unzip ngrok-stable-linux-amd64.zip -d ngrok-stable-linux-amd64
        sleep 2
        cd ngrok-stable-linux-amd64
        echo " "
        read -p "Enter your authentication token                :" toke
        echo " "
        tt= ./ngrok authtoken $toke | grep -w "ERROR"
        echo " "
        if [ $tt = 'ERROR:  You must pass a single argument, the authtoken to save to configuration file.' ]
        then 
          echo " "
          echo " Token Authentication Failed....... "
          echo " "
          exit
        else
         ./ngrok authtoken $toke
         echo " "
         echo "Authentication successful & opening ngrok terminal "
         echo " "
         sleep 0.5
         echo " Opening ngrok terminal "
         echo " "
         ./ngrok tcp 3389
         exit
        fi
       else
        echo " "
        echo " Waiting for completing your downloaad "
        echo " "
      fi
    fi
   done
fi
