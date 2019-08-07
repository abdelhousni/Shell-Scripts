# 

# remove files (in current path) with size 0
find . -size 0 -delete

# rename all file in folder using ls | xargs | cp
# source : https://unix.stackexchange.com/questions/349252/cp-after-xargs-not-working
ls /source/path/*pattern* | xargs -I{} cp -u {} /destination/path

# download all folder files (source forge)
# source : https://stackoverflow.com/questions/39668291/download-whole-folder-from-sourceforge
curl https://sourceforge.net/projects/broll/rss?path=/dicts-babylon/001 | grep "<link>.*</link>" | sed 's|<link>||;s|</link>||' | while read url; do url=`echo $url | sed 's|/download$||'`; wget $url ; done
