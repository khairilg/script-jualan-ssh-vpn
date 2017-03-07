#!/bin/bash
#Script Perpanjang User SSH

read -p "Username : " Login
read -p "Password Baru : " Pass
read -p "Penambahan Masa Aktif (hari): " masaaktif
userdel $Login
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "--------------------------------"

echo -e "Akun Sudah Diperpanjang Hingga $exp"
echo -e "Password telah diganti dengan $Pass"
echo -e "==========================="
