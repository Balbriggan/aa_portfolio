#!/bin/bash
file=aatest.txt
for i in `cat $file`
do
#if $i= "Monday"
if [ "$i" == "Monday" ] ; then
echo "Monday is here"
exit 0
else
echo "I have NFI"
exit 1
fi
#echo "$i"
done

exit 0
