#!/bin/bash

DATETIME=`date +%Y%m%d%H%M%S`

counter=10000

echo -n "Waiting until you changed the window: "
sleep 5
echo -n "."
sleep 5
echo -n "."
sleep 5
echo -n "."
sleep 5
echo

while [ 1 ]
do
	DATETIME=`date +%Y%m%d%H%M%S`
	echo $DATETIME
	screencapture -m -x -t jpg screen$DATETIME.jpg
	sleep 10
done
