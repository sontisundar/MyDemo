#!/bin/bash

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Interactive Setup Screen"
TITLE="Kafka Server Setup"
MENU="Choose one of the following options:"

OPTIONS=(1 "Help"
         2 "Kafka Server Setup"
         )

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
 
echo '#!/bin/bash' >input1.sh
echo choice=$CHOICE >>input1.sh
echo if [[ '$choice' == 1 ]] >>input1.sh

echo then sudo chmod +x ./help.sh >>input1.sh
echo ./help.sh >>input1.sh

echo elif [[ '$choice' == 2 ]] >>input1.sh

echo then sudo chmod +x ./setup.sh>>input1.sh
echo ./setup.sh >>input1.sh

echo else >>input1.sh

echo 'echo "You chose cancel"' >>input1.sh
echo fi >>input1.sh

chmod +x input1.sh

gnome-terminal  --tab -e "/bin/bash -c './input1.sh; exec /bin/bash -i'"

clear
case $CHOICE in
       	1)
            echo "You chose Option 1"
            ;;
       	2)
            echo "You chose Option 2"
            ;;
        
         
            
esac



