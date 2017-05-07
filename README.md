Script Installer VPS by INDOWORX
===================

Script auto installer VPS untuk memudahkan dalam berjualan SSH, VPN, dan Proxy. Script ini telah di install berbagai macam fungsi dan alat yang akan membantu Anda dalam berjualan layanan SSH, VPN dan Proxy.

https://www.indoworx.com/

----------

Requirement
-------------

Sebelum menginstall script ini ada beberapa sistem yang dibutuhkan.

> - Sebuah server / server virtual / cloud server / VPS yang terinstall sistem operasi **CentOS 6.x** dan masih baru.
> - Program terminal emulator seperti [PuTTY](http://www.putty.org/) atau lainnya.

Installation
-------------
Untuk instalasi script silahkan jalankan perintah berikut:
```sh
$ wget https://raw.githubusercontent.com/khairilg/script-jualan-ssh-vpn/master/centos-kvm.sh
$ chmod +x centos-kvm.sh
$ sh centos-kvm.sh
```
atau

```sh
$ wget https://raw.githubusercontent.com/khairilg/script-jualan-ssh-vpn/master/centos-kvm.sh && chmod +x centos-kvm.sh && sh centos-kvm.sh
```
Perintah diatas akan menginstall script auto installer. Anda akan disuruh untuk mengisi:

 - **Nama Pemilik Server** - silahkan masukkan nama pemilik server.
 - **Nomor HP atau Email Pemilik Server** - silahkan masukkan nomor / email.
 - **Username untuk akun default** - masukkan username untuk akun SSH, VPN default. contoh: *khairil*
 - **Maks Login User** - masukkan limit login user. contoh: 1 (untuk melimit  user hanya bisa 1 kali login)

Feature
-------------

Layanan yang diaktifkan pada script ini:

 - **OpenVPN** : TCP 1194 (client config : http://IP:81/client.ovpn )
 - **Port OpenSSH** : 22, 143
 - **Port Dropbear** : 80, 109, 110, 443
 - **SquidProxy**    : 8080, 3128 (limit to IP SSH)
 - **Nginx** : 81
 - **badvpn**   : badvpn-udpgw port 7300
 - **Webmin**   : http://IP:10000/
 - **vnstat**   : http://IP:81/vnstat/
 - **MRTG**     : http://IP:81/mrtg/
 - **Timezone** : Asia/Jakarta
 - **Fail2Ban** : [on]
 - **Root Login on Port 22** : [disabled]
 - **IPv6**     : [off]

Beberapa fitur yang tersedia saat ini:

 - **speedtest --share** : untuk cek speed vps,
 - **mem** : untuk melihat pemakaian ram,
 - **checkvirus** : untuk scan virus / malware,
 - **bench** : untuk melihat performa vps,
 - **usernew** : untuk membuat akun baru,
 - **userlist** : untuk melihat daftar akun beserta masa aktifnya,
 - **userlimit *(limit)*** : untuk kill akun yang login lebih dari *(limit)*. Cth: userlimit 1,
 - **userlogin**  : untuk melihat user yang sedang login,
 - **userdelete**  : untuk menghapus user,
 - **trial** : untuk membuat akun trial selama 1 hari,
 - **renew** : untuk memperpanjang masa aktif akun,
 - **info** : untuk melihat ulang informasi ini.

Beberapa alat atau tools yang dapat Anda gunakan:
<pre>axel, bmon, htop, iftop, mtr, nethogs</pre>

