#!/bin/bash
# USAGE: ./netreload
# PURPOSE: reload all network interfaces for proxmox; especially useful when openvswitching is used

# strict error exits
#set -e

# variables for network/interfaces files
ONET=/etc/network/interfaces
NNET=/etc/network/interfaces.new
NET="<IP ADDRESS>"
REVNET_RESULT=""
SAVNET_RESULT=""
CHGNET_RESULT=""
RSTNET_RESULT=""
TSTNET_RESULT=""
QSTION_RESULT=""
ANSWER=""

revertnet () {
	# code for reverting to old network interfaces file
	echo "some code for reverting to old network interfaces file"
	if [ -f $ONET.OLD ]; then
		echo "cp'ing $ONET to /etc/network/interfaces"
		command cp $ONET.OLD $ONET
		restartnet
		REVNET_RESULT=0
	else
		echo "$ONET.OLD doesn't exist"
		REVNET_RESULT=1
	fi
}

savenet () {
	# some code for saving network interface files
	echo "saving $ONET"
	
	command cp "$ONET" "$ONET.OLD"
	
	[ -f "$ONET.OLD" ] && SAVNET_RESULT=0 || SAVNET_RESULT=1
}

changenet () {
	# some code for changing network/interfaces file to new version
	echo "changing $NNET to $ONET"

	command cp "$NNET" "$ONET"
	NDIFF_RESULT="$(netdiff $ONET $NNET)"
	if [ "$NDIFF_RESULT" ]; then
		CHGNET_RESULT=1
	else
		CHGNET_RESULT=0
	fi
}

restartnet () {
	# some code for restarting networking service and ifup|down interfaces
	echo "restartnet function"
	
    NICS="$(egrep 'e[a-z]{2}[0-9]|vmbr[0-9]{1,4}' /proc/net/dev | awk '{ print $1 }' | tr -d :)"
    for NIC in $NICS; do
        ifdown $NICS
        sleep 1
        ifup $NIC
        sleep 2
    done
    command /etc/init.d/networking stop && sleep 5 && /etc/init.d/networking start &

    # ifup ovs bridges a second time
    for NIC in $NICS; do
        case $NIC in
            vmbr*) echo "vmbridge up $NIC";
                ifup $NIC;;
            *) echo "not vmbridge interface $NIC";;
        esac
    done

	RSTNET_RESULT=0
}

testnet () {
	# some code for testing network connectivity
	local NET=$1
	echo "testnet function"
	local PING_RESULT="$(command ping -c 1 $NET > /dev/null ; echo $?)"
	if [ $PING_RESULT ]; then
		TSTNET_RESULT=0
        echo "network ping success from testnet()"
	elif [ $PING_RESULT == 2 ]; then
		TSTNET_RESULT=1
	else
		TSTNET_RESULT=1
	fi
}

netdiff () {
	# some code for testing if there are network changes present
	# check how many variables were passed
	local FILE1=$1
	local FILE2=$2
	if [ "$#" != 2 ]; then
		echo "must pass 2 filenames to function"
		return 255
	fi
	
	# check to see if files exist
	[ -f $FILE1 -a -f $FILE2 ] && echo "files exist!" || echo "files don't exist!"; return 254

	# check for file differences and return 0 for different and 1 for same
	if [ "$(diff $1 $2)" ]; then
		echo "files are different!"
		return 0
	else
		echo "files are same!"
		return 1
	fi
}

NDIFF_RESULT="$(netdiff $ONET $NNET)"
if [ "$NDIFF_RESULT" ]; then
	echo "files are different"
fi

read -p "backup $ONET? [y,n]" ANSWER
if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" ]]; then
	QSTION_RESULT=0
	#savenet
else
	QSTION_RESULT=1
fi

echo "question result $QSTION_RESULT"
echo "from backup questions" 
echo

if [ "$SAVNET_RESULT" == 0 ]; then
	echo "saved $ONET successfully"
fi

read -p "$ONET with $NNET? [y,n]" ANSWER
QSTION_RESULT="$([[ $ANSWER == 'y' || $ANSWER == 'Y' ]] && echo 0 || echo 1)"

if [[ "$QSTION_RESULT" == 0 ]]; then
    echo "question result $QSTION_RESULT"
    echo "changing interfaces.new to interfaces"
    #changenet
fi

if [ "$CHGNET_RESULT" == 0 ]; then
	echo "$? is var ? and : $CHGNET_RESULT is chgnet_result"
	#restartnet
	testnet $NET
	echo "$TSTNET_RESULT is testnet result"
	if [ $TSTNET_RESULT ]; then
		echo "ping test success"
		echo "exiting script"
	else
		echo "ping test failed"
		echo "reverting networks"
		#revertnet
	fi
fi
