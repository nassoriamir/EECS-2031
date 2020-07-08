#!/bin/sh

#######
# The purpose of the lab are to learn:
# * implementing loops
# * reading from standard input
# * checking input parameters
# * checking condition
#######

if [ $# -eq 0 ] 
then
  echo You should enter the path name for class files
  echo Use: lab3.sh path 
  echo 'Example lab3.sh ~'
  exit 1
fi

path=$1

# find files with read permission in the defined path
class_files=`find $path -type f -name '*.rec' -perm /444`

# check if we find at least one file
if [ "X${class_files}" = "X" ]
then
  echo 'There is not readable *.rec file exists in the specified path or its subdirectories!'
  exit 1
fi


# main loop
clear
prompt="command: "
printf "$prompt"

while true
do
  read command
  case $command in
    l | list) echo 'Here is the list of found class files:' 
              echo $class_files;;
    q | quit) echo goodbye
	         break;;
    *) echo 'Unrecognized command!';;
  esac
  
  printf "$prompt"         
done


exit 0