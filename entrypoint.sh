#!/bin/sh
while [ 1 ]
do
   waitTime=$(shuf -i 1-5 -n 1)
   sleep $waitTime &
   wait $!
   instruction=$(shuf -i 0-4 -n 1)
   d=`date -Iseconds`
   case "$instruction" in
      "1") cat << EOF
            $d level=ERROR, message=something happened in this execution.
            This is a 2nd line
            This is a 3rd line
           EOF
      ;;
      "2") cat << EOF
            $d level=INFO, message=Nothing to see here.
            This is a 2nd line
            This is a 3rd line
           EOF
      ;;
      "3") cat << EOF
            $d level=WARNING, message=Another issue has occurred.
            This is a 2nd line
            This is a 3rd line
           EOF
      ;;
      "4") cat << EOF
            $d level=DEBUG, message=something happened that should not have.
            This is a 2nd line
            This is a 3rd line
           EOF
      ;;
   esac
done
