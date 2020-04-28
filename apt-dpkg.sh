# but : dpkg > CSV
#source : https://askubuntu.com/questions/538261/how-to-tweak-dpkg-l-output
dpkg-query -Wl -f='${binary:Package};${Version};${Architecture};${binary:Summary}\n'


# La référence : https://debian-handbook.info/browse/fr-FR/stable/sect.manipulating-packages-with-dpkg.html
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

# list all <package> files
dpkg -L <package>

# list all <package.deb> files
dpkg -c <package.deb>

# Package holding - no update
# source : https://askubuntu.com/questions/18654/how-to-prevent-updating-of-a-specific-package
# There are four ways of holding back packages: with dpkg, apt, aptitude or dselect.

# dpkg
# Put a package on hold:
echo "<package-name> hold" | sudo dpkg --set-selections
# Remove the hold:
echo "<package-name> install" | sudo dpkg --set-selections
# Display the status of your packages:
dpkg --get-selections
# Display the status of a single package:
dpkg --get-selections | grep "<package-name>"

# apt
# Hold a package:
sudo apt-mark hold <package-name>
# Remove the hold:
sudo apt-mark unhold <package-name>
# Show all packages on hold:
sudo apt-mark showhold

# dselect
# With dselect, enter the [S]elect screen, find the package you wish to hold in its present state and press = or H. The changes will take effect immediately after exiting the [S]elect screen.
# The following approaches are limited in that locking/holding a package within aptitude or synaptic doesn't affect apt-get/apt.

# aptitude
# Hold a package:
sudo aptitude hold <package-name>
# Remove the hold:
sudo aptitude unhold <package-name>

# Locking with Synaptic Package Manager
# Go to Synaptic Package Manager (System > Administration > Synaptic Package Manager).
# Click the search button and type the package name.
# When you find the package, select it and go to the Package menu and select Lock Version.
