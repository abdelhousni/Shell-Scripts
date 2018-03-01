# references :
# https://askubuntu.com/questions/680410/how-to-view-history-of-apt-get-install
# 
#

# History of all installed packages
# format : yyyy-mm-dd timestamp path
find /var/lib/dpkg/info/ -name *.list -exec stat -c $'%y\t %n' {} \;
