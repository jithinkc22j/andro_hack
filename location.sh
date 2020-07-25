echo "----------------------------------------------------------------------"
echo " "
echo " -----------------Location FInder termminal--------------------------- "
echo " "
echo "----------------------------------------------------------------------"
echo " "
echo "Note copy the longitude and lattitude and paste here.."
echo " "
read -p " Enter Longit        : " lo
echo " "
read -p " Enter lattitude     : " lat
echo " "
echo " OPening Google Map location....... "
sleep 0.5
n=www.google.com/maps/place/$lo,$lat
xdg-open https://$n

