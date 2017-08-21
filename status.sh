#!/bin/bash

#return code 0 = running
#return code 1 = finished successfully
#return code 2 = failed
#return code 3 = unknown

if [ -f finished ]; then
    code=`cat finished`
    if [ $code -eq 0 ]; then
        echo "finished successfully"
        exit 1 #success!
    else
        echo "finished with code:$code"
        exit 2 #failed
    fi
fi

if [ -f pid ]; then
    if ps -p $(cat pid) > /dev/null
    then
	    tail -1 stdout.log
	    exit 0
    else
	    echo "no longer running but didn't finish"
	    exit 1
    fi
fi

echo "can't determine the status!"
exit 3


