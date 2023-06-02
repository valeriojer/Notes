Activity: Using Brace-Expansion, create the following directories within the $HOME directory:

    1123
    1134
    1145
    1156
    
mkdir {1123,1134,1145,1156}
----------------------------------------------------------------------
Activity: Use Brace-Expansion to create the following files within the $HOME/1123 directory. You may need to create the $HOME/1123 directory.
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
Activity: Using the find command, list all files in $HOME/1123 that end in .txt.

find -name \*.txt
-----------------------------------------------------------------------
Activity: List all files in $HOME/1123 that end in .txt. Omit the files containing a tilde (~) character.

find ~/1123 -name *.txt ! -name *~*
------------------------------------------------------------------------
Activity: Copy all files in the $HOME/1123 directory, that end in ".txt", and omit files containing a tilde "~" character, to directory $HOME/CUT.
Use only the find and cp commands. You will need to utilize the -exec option on find to accomplish this activity.

find ~/1123 -name *.txt ! -name *~* -exec cp {} ~/CUT \;
---------------------------------------------------------------------------
Activity: Using ONLY the find command, find all empty files/directories in directory /var and print out ONLY the filename (not absolute path),
and the inode number, separated by newlines.

find /var -empty -printf "%i %f\n"
----------------------------------------------------------------------------
Activity: Using ONLY the find command, find all files on the system with inode 4026532575 and print only the filename to the screen, not the absolute path to the file,
separating each filename with a newline. Ensure unneeded output is not visible.

find / -inum 4026532575 -printf "%f\n"
-----------------------------------------------------------------------------
Activity: Using only the ls -l and cut Commands, write a BASH script that shows all filenames with extensions ie: 1.txt, etc., but no directories, in $HOME/CUT.
Write those to a text file called names in $HOME/CUT directory. Omit the names filename from your output.

ls -l ~/CUT | cut -d. -s -f1,2 | cut -d':' -f2| cut -d'' -f2 > ~/CUT/names
ls -l /*.* | cut -d'/' -f3
ls -l ~/CUT | cut -d. -s -f1,2 | rev | cut -d" " -f1 | rev 
-------------------------------------------------------------------------------
Activity: Write a basic bash script that greps ONLY the IP addresses in the text file provided (named StoryHiddenIPs in the current directory);
sort them uniquely by number of times they appear.

egrep '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' -o StoryHiddenIPs | sort | uniq -c | sort -r | awk {print}
-------------------------------------------------------------------------------
Activity: Using ONLY the awk command, write a BASH one-liner script that extracts ONLY the names of all the system and user accounts that are not UIDs 0-3.
Only display those that use /bin/bash as their default shell. the input file is named $HOME/passwd and is located in the current directory.
Output the results to a file called $HOME/SED/names.txt

awk -F: '($3 > 3 && $NF == "/bin/bash") {print $1}' ~/passwd > ~/SED/names.txt
-------------------------------------------------------------------------------
Activity: Find all dmesg kernel messages that contain CPU or BIOS (uppercase) in the string, but not usable or reserved (case-insensitive)  
Print only the msg itself, omitting the bracketed numerical expressions ie: [1.132775]

dmesg | egrep "(CPU)|(BIOS)" | egrep -v "(usable)|(reserved)" | cut -d] -f2-
--------------------------------------------------------------------------------
Activity: Write a Bash script using "Command Substitution" to replace all passwords, using openssl, from the file $HOME/PASS/shadow.txt with the MD5 encrypted password: Password1234, with salt: bad4u
Output of this command should go to the screen/standard output. You are not limited to a particular command, however you must use openssl. 
Type man openssl passwd for more information.

A=$(openssl passwd -1 -salt bad4u Password1234)
awk -F: -v "awk_var=$A" 'BEGIN {OFS=":"} {$2=awk_var} {print $0}' ~/PASS/shadow.txt
----------------------------------------------------------------------------------
Activity: Using ONLY sed, write all lines from $HOME/passwd into $HOME/PASS/passwd.txt that do not end with either /bin/sh or /bin/false.

sed '/\/bin\/sh/d' ~/passwd | sed '/false/d' > ~/PASS/passwd.txt
------------------------------------------------------------------------------------------------
