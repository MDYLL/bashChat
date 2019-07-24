#!/bin/bash
getMessage(){
	getMessage=`cat file.txt`
	rm file.txt
	echo $partnerPID : $getMessage
}

trap "getMessage" SIGUSR1
echo My PID is $$
read -p 'Input PID of my partner: ' partnerPID
postMessage=Hello
exitMessage=-1
echo message for exit is $exitMessage
while [ "$postMessage" != "$exitMessage" ]
do
	read postMessage
	echo $postMessage >> file.txt
	kill -SIGUSR1 $partnerPID
done
