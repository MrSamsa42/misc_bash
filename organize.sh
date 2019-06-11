#! /bin/bash
set -x
FILETYPE="jpg"
FILEPATH="./temp"
for FILE in ./temp/*.jpg
#for FILE in $FILEPATH/*.$FILETYPE
    do
        Date=$(stat -c %y $FILE) #Date modified
        DateTime=${Date:0:16} #Just the date and time
        DateTime=$(echo "$DateTime"|tr -d ':') #Remove colon from time
        DateTime=$(echo "$DateTime"|tr ' ' '_') #Replace spaces with underscore
        if [ ! -e "./temp/$DateTime" ]
         then
             mkdir "./temp/${DateTime}"
             mv $FILE ./temp/${DateTime}/ 
        else 
             mv $FILE ./temp/${DateTime}/
         fi
done
