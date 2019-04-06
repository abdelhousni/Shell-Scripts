# History of all installed packages
# source : https://askubuntu.com/questions/680410/how-to-view-history-of-apt-get-install
# format : yyyy-mm-dd timestamp path
find /var/lib/dpkg/info/ -name *.list -exec stat -c $'%y\t %n' {} \;


# List installaed packages by installation date
# source : https://unix.stackexchange.com/questions/12578/list-packages-on-an-apt-based-system-by-installation-date

# build list of packages by dates
$ find /var/lib/dpkg/info -name "*.list" -exec stat -c $'%n\t%y' {} \; | \
    sed -e 's,/var/lib/dpkg/info/,,' -e 's,\.list\t,\t,' | \
    sort > ~/dpkglist.dates

# build list of installed packages
$ dpkg --get-selections | sed -ne '/\tinstall$/{s/[[:space:]].*//;p}' | \
    sort > ~/dpkglist.selections
# join the 2 lists
$ join -1 1 -2 1 -t $'\t' ~/dpkglist.selections ~/dpkglist.dates \
    > ~/dpkglist.selectiondates
