##################################################################################
## 20 Practical Examples of RPM Commands in Linux
# source : https://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/
##################################################################################
# How to Check an RPM Signature Package
rpm --checksig pidgin-2.7.9-5.el6.2.i686.rpm

# How to Install an RPM Package
rpm -ivh pidgin-2.7.9-5.el6.2.i686.rpm

# How to check dependencies of RPM Package before Installing
 rpm -qpR BitTorrent-5.2.2-1-Python2.4.noarch.rpm

# How to Install a RPM Package Without Dependencies
rpm -ivh --nodeps BitTorrent-5.2.2-1-Python2.4.noarch.rpm

# How to check an Installed RPM Package
rpm -q BitTorrent BitTorrent-5.2.2-1.noarch

# How to List all files of an installed RPM package
rpm -ql BitTorrent

# How to List Recently Installed RPM Packages
rpm -qa --last

# How to List All Installed RPM Packages
rpm -qa

# How to Upgrade a RPM Package
rpm -Uvh nx-3.5.0-2.el6.centos.i686.rpm

# How to Remove a RPM Package
rpm -evv nx

# How to Remove an RPM Package Without Dependencies
rpm -ev --nodeps vsftpd

# How to Query a file that belongs which RPM Package
rpm -qf /usr/bin/htpasswd

# How to Query a Information of Installed RPM Package
rpm -qi vsftpd

# Get the Information of RPM Package Before Installing
rpm -qip sqlbuddy-1.3.3-1.noarch.rpm

# How to Query documentation of Installed RPM Package
rpm -qdf /usr/bin/vmstat

# How to Verify a RPM Package
rpm -Vp sqlbuddy-1.3.3-1.noarch.rpm

# How to Verify all RPM Packages
rpm -Va

# How to Import an RPM GPG key
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

# How to List all Imported RPM GPG keys
rpm -qa gpg-pubkey*

# How To rebuild Corrupted RPM Database
cd /var/lib
rm __db*
rpm --rebuilddb
rpmdb_verify Packages

##################################################################################
