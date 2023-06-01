bash has history
bash is case sens 
bash reads everything as a string 


## Shortcuts
ctrl + u = clears line
ctrl + l = clears screen
ctrl + p = up
ctrl + n = down
ctrl + a = start of line
ctrl + e = end of line
alt + f or b = forward or back

ps -- forest
kill = kill -9 234
killall = killall firefox
cat = reads entire txt to screen
more =
less = line by line reading
locate = were something is instaileds
whereis = look for file based off names
find = search | find -iname bash.txt
exec = do something when found
mtime = modified time  in day
cmin = changed within the mins 
mindepth 3 = go down 3 dirs
maxdepth 2 = goes up
## sort
  sort                sorts content according to position on the ASCII table
  sort -o             output to a differnet file
  sort -n             sorts content numerically
  sort -u             sorts content uniqely
  sort -nr            sorts content numerically reversed
  sort -t +
  sort -k 2,4         sorts 1st by content in the 2nd column, then by content in the 4th column
## cut
  -d delimiter
  -f fields
  -c characters
  -s only delimiter
  --output-delimiter
  cut -d: -f1         displays only portion of line before 1st instance of delimiter ``:''
  cut -d: -f1-        " and any following strings up to the very next instance ``:''
  cut -d: -f1- -s     " " but don’t print any lines not containing delimiter ``:''
  cut -f3             displays only the 3rd field delimited by space
  cut -f2-4           displays only fields 2 through 4 delimited by space
  cut -c3-10          displays only the 3rd through 10th characters of each line
## awk
  awk -F: '{print $1}'         displays 1st field delimited by a ":"
  awk '{print $2}'             displays 2nd field, delimited automatically by whitespace
  awk '{print $0}'             displays all string data that matches

  awk -F: '($3 == 0) {print $1}' /etc/passwd
                              displays 1st field (username) IF the 3rd field (UID) is equal to "0"
  awk '{print $NF}'           displays only the last field of every line
    $0 prints entire line
    NR shows line number
## sed
  sed '/.dll/{x;p;p;p;x}' -i document.txt
     directly alters document.txt by adding 3 empty lines before the designated regex (.dll)

 . sed '/stuff/G;/stuff/G' -i document.txt
      directly alters document.txt by adding 2 empty lines after the designated regex (stuff)

  sed -i -e 's/ANCHOVIES/SAUSAGE/g' pizaster.htm
              replaces every instance of "ANCHOVIES" with "SAUSAGE" on pizaster.htm

  sed -i -e 's/ANCHOVIES//g' pizaster.htm
              removes every instance of "ANCHOVIES" on pizaster.htm

  sed -i '/^#/d' /etc/hosts.allow
              removes all lines starting with "#" from file /etc/hosts.allow
## uniq (sort first)
  uniq                sorts content uniqely
  uniq -c             sorts content uniqely with a count reading
  uniq -i             case insenitive
  uniq -d,-D          shows dupes and shows all dupes
## Allias 
  alias rm='rm -i'                    creates alias to confirm removal
  alias vim='nano'                    creates an alias for `nano'
  alias gedit='nano'                  "
  alias vi='nano'                     "
  alias x='cat etc/passwd'            creates an alias for Command: cat/etc/passwd
  alias y=$(cat /etc/shadow)          " cat /etc/shadow
  alias ls='ls -al'                   creates an alias causing 'ls -al' to be run when 'ls' is used
  \ls                                 negates the alias function, so we can run 'ls' without '-al'
  alias -p                            view all aliases set (local and global)
  unalias ls                          unaliases ls so it no longer resolves to 'ls -al'


history = shows hidtory with numbers
  ! = run line number
  !! = runs last command
  
man = manull
  man bash = bash help page
  / = search
  q = quit
  egrep = looks for pathern
  G = moves to the end
  g = moves to the start
  
## Conditionals
  -e          file exists ?
  -f          file exists, and is regular file ?
  -d          file exists, and is a directory ?
  -s          file exists, and is NOT empty ?
  -x          file exists, and IS executable ?
  -w          file exists, and is writable by me ?
  -gt >       is greater than
  -lt <       is less than
  -ge         is greater than or equal to
  -le         is less than or equal to
  -eq ==      is equal to
  -ne !=      is NOT equal to
## Command Substitution
  A=$(Command)            A=$(cat /etc/passwd)  
  `Command`               `cat /etc/passwd`

  
## resoruces
explainshell.com
curl cht.sh
manpages.org
https://www.geeksforgeeks.org/awk-command-unixlinux-examples/#

## Order of Evalutions
1. Redirection 
2. alias 
    unalias
4. perameter
    unset    
7. built-in commandsd
8. hash table
9. path variable 

## Brace Expation
ls {BASH,SSH,ZIP}
no spaces allowed
touch multiple files{1..10}.log

  
