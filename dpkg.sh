# History of all installed packages
# source : https://askubuntu.com/questions/680410/how-to-view-history-of-apt-get-install
# format : yyyy-mm-dd timestamp path
find /var/lib/dpkg/info/ -name *.list -exec stat -c $'%y\t %n' {} \;


# List installaed packages by installation date
# source : https://unix.stackexchange.com/questions/12578/list-packages-on-an-apt-based-system-by-installation-date

# Methode 1
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

# Methode 2
$ zgrep 'install ' /var/log/dpkg.log.1 | sort | cut -f1,2,4 -d' '

#-------
# source : http://la-vache-libre.org/aide-memoire-terminal-dpkg-debian-package/
# Aide-mémoire Terminal : DPKG (Debian Package)

# installation de paquet
sudo dpkg -i paquet.deb

# installation récursive
sudo dpkg -i -R *.deb

# Compléter l’installation d’un paquet qui nécessite des dépendances non satisfaites :
sudo apt install -f
# Reconfiguration de dpkg et pour faire simple, des paquets cassés.
sudo dpkg --configure -a 

# suppression de paquet
sudo dpkg -r paquet.deb

# suppression d'un paquet et des fichiers associés
sudo dpkg -P paquet.deb

# commande dangereuse, mais parfois utile
sudo dpkg --force-all --purge [paquet.deb]

# lister les paquets installés
dpkg -l [*paquet*]

# lister les paquets contenant le fichier recherché
dpkg -S [fichier]
