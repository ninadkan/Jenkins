#!/bin/bash

NAME=$1
SURNAME=$2
SHOW=$3
if [ "$SHOW" = "true" ]; then
	echo "Hello $NAME $SURNAME"
else
	echo "Please mark the show option"
fi

