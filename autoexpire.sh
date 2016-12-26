#!/bin/bash
echo "" > /root/infouser.txt
echo "" > /root/expireduser.txt
echo "" > /root/alluser.txt

cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
totalaccounts=`cat /tmp/expirelist.txt | wc -l`
for((i=1; i<=$totalaccounts; i++ ))
       do
       tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
       username=`echo $tuserval | cut -f1 -d:`
       userexp=`echo $tuserval | cut -f2 -d:`
       userexpireinseconds=$(( $userexp * 86400 ))
       tglexp=`date -d @$userexpireinseconds`
       tgl=`echo $tglexp |awk -F" " '{print $3}'`
       while [ ${#tgl} -lt 2 ]
       do
           tgl="0"$tgl
       done
       while [ ${#username} -lt 15 ]
       do
           username=$username" "
       done
       bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
       echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/alluser.txt
       todaystime=`date +%s`
       if [ $userexpireinseconds -ge $todaystime ] ;
           then
           timeto7days=$(( $todaystime + 604800 ))
                if [ $userexpireinseconds -le $timeto7days ];
                then
                     echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/infouser.txt
                fi
       else
       echo " User : $username Expire tanggal : $tgl $bulantahun" >> /root/expireduser.txt
       passwd -l $username
       fi
done
echo " "
echo ""
echo "Cek User Expired Berhasil !!!"
echo " "
echo " " 
