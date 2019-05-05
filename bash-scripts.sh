# 

# remove files (in current path) with size 0
find . -size 0 -delete

# rename all file in folder using ls | xargs | cp
# source : https://unix.stackexchange.com/questions/349252/cp-after-xargs-not-working
ls /source/path/*pattern* | xargs -I{} cp -u {} /destination/path
