#!/bin/bash
choice=2
if [[ $choice == 1 ]]
then sudo chmod +x ./help.sh
./help.sh
elif [[ $choice == 2 ]]
then sudo chmod +x ./setup.sh
./setup.sh
else
echo "You chose cancel"
fi
