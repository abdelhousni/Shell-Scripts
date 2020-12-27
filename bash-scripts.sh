# find all file extensions recursively from a directory
# source : https://stackoverflow.com/questions/4998290/how-to-find-all-file-extensions-recursively-from-a-directory
ls -R | egrep  '(\.\w+)$' -o | sort | uniq -c | sort -r


# remove files (in current path) with size 0
find . -size 0 -delete

# rename all file in folder using ls | xargs | cp
# source : https://unix.stackexchange.com/questions/349252/cp-after-xargs-not-working
ls /source/path/*pattern* | xargs -I{} cp -u {} /destination/path

# download all folder files (source forge)
# source : https://stackoverflow.com/questions/39668291/download-whole-folder-from-sourceforge
curl https://sourceforge.net/projects/broll/rss?path=/dicts-babylon/001 | grep "<link>.*</link>" | sed 's|<link>||;s|</link>||' | while read url; do url=`echo $url | sed 's|/download$||'`; wget $url ; done

# Add timestamp to history
vi ~/.bashrc
export HISTTIMEFORMAT="%F %T "


# Extract first number from list of files & move corresponding file to folder
# source : https://stackoverflow.com/questions/5811753/extract-the-first-number-from-a-string
# extract list of numbers
list=$(ls *.mp4 -1 | sed -r 's/^([^.]+).*$/\1/; s/^[^0-9]*([0-9]+).*$/\1/')
for i in $list
do
	echo module$i* \>\> Module\ $i*
	# move files to corresponding folder
  mv module$i* Module\ $i*
done

# Download urls from filelist with get in parallel
# source : https://askubuntu.com/questions/103623/download-files-from-a-list
apt install parallel
cat urlfile | parallel --gnu "wget {}"

# copy file creating any missing intermediate directories
# for /opt/foo/foo-file
$ cp --parents foo-file ./current-folder

# syntax colored less
# source : https://news.ycombinator.com/item?id=21363121
## install python3-pygments
## define function cless() with chosen <style> between ['default', 'emacs', 'friendly', 'colorful']
cless() { pygmentize -O style=default "$1" 2>/dev/null | less -R ;}
