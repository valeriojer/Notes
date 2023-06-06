1 Activity: Using Brace-Expansion, create the following directories within the $HOME directory:

    1123
    1134
    1145
    1156
    
mkdir {1123,1134,1145,1156}
----------------------------------------------------------------------
1.2 Activity: Use Brace-Expansion to create the following files within the $HOME/1123 directory. You may need to create the $HOME/1123 directory.
Make the following files, but utilze Brace Expansion to make all nine files with one touch command.
Files to create:

    1.txt
    2.txt
    3.txt
    4.txt
    5.txt
    6~.txt
    7~.txt
    8~.txt
    9~.txt
    
touch 1123/{1..5}.txt |touch 1123/{6..9}~.txt
----------------------------------------------------------------------
1.3a Activity: Using the find command, list all files in $HOME/1123 that end in .txt.

find -name \*.txt
-----------------------------------------------------------------------
1.3b Activity: List all files in $HOME/1123 that end in .txt. Omit the files containing a tilde (~) character.

find ~/1123 -name *.txt ! -name *~*
------------------------------------------------------------------------
2 Activity: Copy all files in the $HOME/1123 directory, that end in ".txt", and omit files containing a tilde "~" character, to directory $HOME/CUT.
Use only the find and cp commands. You will need to utilize the -exec option on find to accomplish this activity.

find ~/1123 -name *.txt ! -name *~* -exec cp {} ~/CUT \;
---------------------------------------------------------------------------
3 Activity: Using ONLY the find command, find all empty files/directories in directory /var and print out ONLY the filename (not absolute path),
and the inode number, separated by newlines.

find /var -empty -printf "%i %f\n"
----------------------------------------------------------------------------
4 Activity: Using ONLY the find command, find all files on the system with inode 4026532575 and print only the filename to the screen, not the absolute path to the file,
separating each filename with a newline. Ensure unneeded output is not visible.

find / -inum 4026532575 -printf "%f\n"
-----------------------------------------------------------------------------
5 Activity: Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
Write those to a text file called names in $HOME/CUT directory. Omit the names filename from your output.

ls -l ~/CUT | cut -d. -s -f1,2 | cut -d':' -f2| cut -d'' -f2 > ~/CUT/names
ls -l /*.* | cut -d'/' -f3
ls -l ~/CUT | cut -d. -s -f1,2 | rev | cut -d" " -f1 | rev 
-------------------------------------------------------------------------------
6 Activity: Write a basic bash script that greps ONLY the IP addresses in the text file provided (named StoryHiddenIPs in the current directory);
sort them uniquely by number of times they appear.

egrep '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o StoryHiddenIPs | sort | uniq -c | sort -r | awk {print}
-------------------------------------------------------------------------------
7 Activity: Using ONLY the awk command, write a BASH one-liner script that extracts ONLY the names of all the system and user accounts that are not UIDs 0-3.
Only display those that use /bin/bash as their default shell. the input file is named $HOME/passwd and is located in the current directory.
Output the results to a file called $HOME/SED/names.txt

awk -F: '($3 > 3 && $NF == "/bin/bash") {print $1}' ~/passwd > ~/SED/names.txt
-------------------------------------------------------------------------------
8 Activity: Find all dmesg kernel messages that contain CPU or BIOS (uppercase) in the string, but not usable or reserved (case-insensitive)  
Print only the msg itself, omitting the bracketed numerical expressions ie: [1.132775]

dmesg | egrep "(CPU)|(BIOS)" | egrep -v "(usable)|(reserved)" | cut -d] -f2-
--------------------------------------------------------------------------------
9 Activity: Write a Bash script using "Command Substitution" to replace all passwords, using openssl, from the file $HOME/PASS/shadow.txt with the MD5 encrypted password: Password1234, with salt: bad4u
Output of this command should go to the screen/standard output. You are not limited to a particular command, however you must use openssl. 
Type man openssl passwd for more information.

A=$(openssl passwd -1 -salt bad4u Password1234)
awk -F: -v "awk_var=$A" 'BEGIN {OFS=":"} {$2=awk_var} {print $0}' ~/PASS/shadow.txt
----------------------------------------------------------------------------------
10 Activity: Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.

sed '/\/bin\/sh/d' ~/passwd | sed '/false/d' > ~/PASS/passwd.txt
----------------------------------------------------------------------------------
11 Activity: Using find, find all files under the $HOME directory with a .bin extension ONLY.
Once the file(s) and their path(s) have been found, remove the file name from the absolute path output.
Ensure there is no trailing / at the end of the directory path when outputting to standard output. You may need to sort the output depending on the command(s) you use.

find ~/ -name "*.bin" | rev | cut -d/ -f2- | rev | sort | uniq
find ~/ -name "*.bin" | awk 'BEGIN{FS="/";OFS="/"}{NF=NF-1}{print $0}' | sort -u
-----------------------------------------------------------------------------------
12 Activity: Write a script which will copy the last entry/line in the passwd-like file specified by the $1 positional parameter
Modify the copied line to change: User name to the value specified by $2 positional parameter
Used id and group id to the value specified by $3 positional parameter Home directory to a directory matching the user name specified by $2 positional parameter under the /home directory
The default shell to 'bin/bash' Append the modified line to the end of the file

path=$1
uname=$2
uid=$3
gid=$3
newhome="/home/$uname"
defaulr="/bin/bash"

lastline=$(tail -n 1 "$path")

modline=$(echo "$lastline" | awk -F ':' -v var="$uname" -v fid=$uid -v sid=$gid -v home=$newhome -v she=$defaulr 'BEGIN{OFS=FS}{$1=var; $3=fid; $4=sid; $6=home; $7=she; print}')

echo "$modline" >> "$path"
-------------------------------------------------------------------------------------
13 Activity: Find all executable files under the following four directories:
        /bin
        /sbin
        /usr/bin
        /usr/sbin
Sort the filenames with absolute path, and get the md5sum of the 10th file from the top of the list.

a=$(find /bin /sbin /usr/bin /usr/sbin -type f -executable | sort | head | tail -1) 
md5sum $a | awk -F' ' '{print $1}'
--------------------------------------------------------------------------------------
14 Activity: sing any BASH command complete the following: ort the /etc/passwd file numerically by the GID field.
For the 10th entry in the sorted passwd file, get an md5 hash of that entry’s home directory. utput ONLY the MD5 hash of the directorys name to standard output.

awk -F: '{print $4,$6}' /etc/passwd | sort -n | head | tail -1 | awk -F " " '{print $2}'| md5sum | awk -F " " '{print $1}' 
--------------------------------------------------------------------------------------
15 Activity: Write a script which will find and hash the contents 3 levels deep from each of these directories: /bin /etc /var
Your script 
    
a=$(find /bin /etc /var -maxdepth 3) 
md5sum $a 2>err.txt 1>out.txt
b=$(cat err.txt| grep -v denied | wc -l)
c=$(cat out.txt | wc -l)

echo Successfully Hashed Files: $c
echo Unsuccessfully Hashed Directories: $b    
--------------------------------------------------------------------------------------
16 Activity: Design a script that detects the existence of directory: $HOME/.ssh
Upon successful detection, copies any and all files from within the directory $HOME/.ssh to directory $HOME/SSH and produce no output. You will need to create $HOME/SSH.
Upon un-successful detection, displays the error message "Run ssh-keygen" to the user.

if [[ -d "$HOME/.ssh" ]]
then
    mkdir ~/SSH
    cp -R ~/.ssh/. ~/SSH/.
else
    echo Run ssh-keygen
fi
--------------------------------------------------------------------------------------
17 Activity: Write a script that determines your default gateway ip address. Assign that address to a variable using command substitution.
NOTE: Networking on the CTFd is limited for security reasons. ip route and route are emulated. Use either of those with no switches.
Have your script determine the absolute path of the ping application. Assign the absolute path to a variable using command substitution.
Have your script send six ping packets to your default gateway, utilizing the path discovered in the previous step,
and assign the response to a variable using command substitution.
Evaluate the response as being either successful or failure, and print an appropriate message to the screen.

#!/bin/bash
A=$(ip route | head -1 | cut -d" " -f3)
B=$(which ping)
C=" 0% packet loss"
D=$($B -c 6 $A | grep -Eo "$C")
if [[ "$C" == "$D" ]];
then
    echo "successful";
else
    echo "failure";
fi
------------------------------------------------------------------------------------
18 Activity: Create the following files in a new directory you create $HOME/ZIP:
file1 will contain the md5sum of the text 12345
file2 will contain the md5sum of the text 6789
file3 will contain the md5sum of the text abcdef
Create a zip file containing the three files above, without being stored inside a directory in the zip file. Name the zip file $HOME/ZIP/file.zip
HINT: "Junk" the paths
Utilize tar on $HOME/ZIP/file.zip to archive it into a file called $HOME/ZIP/file.tar.gz which should not include directories. Use the gzip option in tar,
DO NOT use a seperate gzip binary. HINT: You might need an option to change directories first.
        
mkdir ~/ZIP
touch ~/ZIP/file{1..3}
echo '12345' | md5sum | cut -d" " -f1 > $HOME/ZIP/file1
echo '6789' | md5sum | cut -d" " -f1 > $HOME/ZIP/file2
echo 'abcdef' | md5sum | cut -d" " -f1 > $HOME/ZIP/file3
zip $HOME/ZIP/file.zip $HOME/ZIP/* -jq
tar -czf $HOME/ZIP/file.tar.gz -C $HOME/ZIP/ file.zip
---------------------------------------------------------------------------------------------------------
19 Activity: Design a basic FOR Loop that iteratively alters the file system and user entries in a passwd-like file for new users: LARRY, CURLY, and MOE.
Each user should have an entry in the $HOME/passwd file
The userid and groupid will be the same and can be found as the sole contents of a file with the user's name in the $HOME directory (i.e. $HOME/LARRY.txt might contain 123)
The home directory will be a directory with the user's name located under the $HOME directory (i.e. $HOME/LARRY)
NOTE: Do NOT use shell expansion when specifying this in the $HOME/passwd file.
The default shell will be /bin/bash
The other fields in the new entries should match root's entry
Users should be created in the order specified
    
users=("LARRY" "CURLY" "MOE")
passwd_file="$HOME/passwd"

for user in "${users[@]}";
do
    id_file="$HOME/$user.txt"
    if [[ -f "$id_file" ]];
    then
            userid=$(cat "$id_file")
            groupid=$userid
    fi

    home_dir="$HOME/$user"

    if [[ ! -d "$home_dir" ]]; then
        mkdir "$home_dir"

    entry="$user:x:$userid:$groupid:root:\$HOME/$user:/bin/bash"
    echo "$entry" >> "$passwd_file"
    fi
done

rootline=$( head -1 $HOME/passwd)
for x in {LARRY ,CURLY ,MOE} ; do
    myuid=$(cat $HOME/$x.txt)
    mkdir $HOME/$x
    echo $rootline | awk -F: -v un=$x -v ui=$myuid 'BEGIN{OFS=":"}{$1=un;$3=$4=ui;$6="$HOME/"un}{print $0}' >> $HOME/passwd
---------------------------------------------------------------------------------------------
20 Activity: Write a bash script that will find all the files in the /etc directory, and obtains the octal permission of those files. 
The stat command will be useful for this task. Depending how you go about your script, you may find writing to the local directory useful.
What you must seperate out from the initial results are the octal permissions of 0-640 and those equal to and greater than 642, ie 0-640 goes to low.txt,
while 642 is sent to high.txt. Have your script uniquely sort the contents of the two files by count, numerically-reversed, and output the results, 
with applicable titles, to the screen. An example of the desired output is shown below. NOTE: There is a blank line being printed between the two sections of the output below.
        
#!/bin/bash
  A=$(find /etc -type f)
  
  for x in $(find /etc/ -type f)
  do
      B=$(stat -c '%a' $x)
      if [ $B -ge 642 ];
      then
          echo $B >> high.txt
      else    
          echo $B >> low.txt
      fi  
  done
  C=$(cat high.txt | sort -nr | uniq -c | head -2| sort -k1r)
  D=$(cat low.txt | sort -nr | uniq -c | head -6 | sort -k1r)
  echo "Files w/ OCTAL Perm Values 642+:"
  echo "$C"
  echo ""
  echo "Files w/ OCTAL Perm Values 0-640:"
  echo "$D"
  
----
  
  PRAC EXAM
  
-----
1 Create a script that will perform the following actions:

    Replace every instance of 'cat' in "infile" with 'dog'.
    Replace every instance of 'Navy' in "infile" with 'Army'.
    Replacements are case-sensitive.
    Write the output to the file specifed by the variable 'outfile' 
    
    
function q1()
{
  #Valid Variables are:
  infile=$1
  outfile=$2
  #Your code here
  sed -i 's/cat/dog/g' $infile  
  sed -i 's/Navy/Army/g' $infile
  cat $infile > $outfile

}
-----------------------------------------------------------------------------------------
2 Create a script that will print to standard output all user names from the /etc/passwd file.

function q1()
{
  #Valid Variables are:
  #none
  #You code here
  cat /etc/passwd | cut -d: -f1

}
-----------------------------------------------------------------------------------------
3 Create a script that will perform the following actions:

    Print to standard output all usernames from the file path specified by the parameter filename sorted ascending numerically by user id.
    The file will be in the format of /etc/passwd
    
function q1()
{
  #Valid Variables are:
  filename=$1
  #Your code here
  cat $filename | awk -F: '{print $1, $3}' | sort -k2n | cut -d' ' -f1
 
}
------------------------------------------------------------------------------------------
4 Create a script that will perform the following actions:

    Print to standard output the total number of files in the directory specified by dirname.
    If the directory does not exist, print 'Invalid Directory'
    The count excludes the '.' and '..' pseudo-directories.

function q1()
{
  #Valid Variables are:
  dirname=$1
  #Your code here
  if [[ ! -d $dirname ]]; then
    echo 'Invalid Directory'
  else
    find $dirname -type f | wc -l | tail -1
  fi
}
------------------------------------------------------------------------------------------
5 Create a script that will perform the following actions:

    Delete all files contained in the directory specified by dirdel
    Also delete the directory specified by dirdel

function q1()
{
  #Valid Variables are:
  dirdel=$1
  #Your code here
  rm -r $dirdel  
}
-------------------------------------------------------------------------------------------
6 Create a script that will perform the following actions:

    Create a file specified by the name newfile.
    Set the file modified date to the value specified in filedate and time to '1730'. NOTE: filedate contains only a valid date in YYYYMMDD format, not a time.

function q1()
{
  #Valid Variables are:
  newfile=$1
  filedate=$2
  #Your code here
  touch $newfile
  touch -t "$filedate"1730.00 $newfile
}
----------------------------------------------------------------------------------------------
7 Read the file specified by fname and perform an action based on the contents of the file:

    If contents are 0 to 9, print "single digit" to standard output.
    If contents are 10 to 99, print "double digit" to standard output.
    If contents are 100 to 999, print "triple digit" to standard output.
    Otherwise, print "Error" to standard output.

NOTE: There will only be one line of content in the file specified by fname.

function q1()
{
  #Valid Variables are:
  fname=$1
  #Your code here
  grep -V $3 $1 > $2
}
-----------------------------------------------------------------------------------------------
8 Copy all lines from the file specified by src variable to the file specified by dst variable which DO NOT contain the text specified by match variable.

function q1()
{
  #Valid Variables are:
  src=$1
  dst=$2
  match=$3
  #Your code here
}
-----------------------------------------------------------------------------------------------
9 Terminate the process that has the randomly assigned name specified by procname variable. procname does not contain path information.

function q1()
{
  #Valid Variables are:
  procname=$1
  #Your code here

   killall $procname
 
}
-----------------------------------------------------------------------------------------------
10 Create a sorted full-path list of all files in the directory dirpath that were modified within the previous day. Directories should not be included in the output. Print the list to the screen, one item per line.

NOTE: The full paths to files should be in your output. (i.e. /etc/passwd would be included)

NOTE: Directory entries should not be included. (i.e. /etc would NOT be included)

function q1()
{
  #Valid Variables are:
  dirpath=$1
  #Your code here
}
------------------------------------------------------------------------------------------------
