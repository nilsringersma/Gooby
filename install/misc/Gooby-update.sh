#!/bin/bash

clear

EXPLAINTASK

CONFIRMATION

if [[ ${REPLY} =~ ^[Yy]$ ]]; then

	sudo rm -r /opt/.Gooby > /dev/null 2>&1
	sudo git clone -b master https://github.com/TechPerplexed/Gooby /opt/.Gooby

	if [ -d /opt/.Gooby ]; then
		sudo rm -r /opt/Gooby
		sudo mv /opt/.Gooby /opt/Gooby
		sudo chmod +x -R /opt/Gooby/install
		sudo chmod +x -R /opt/Gooby/menus
		sudo chmod +x -R /opt/Gooby/scripts/bin
		sudo chmod +x -R /opt/Gooby/scripts/cron
		sudo rsync -a /opt/Gooby/scripts/bin/gooby /bin
		sudo chmod 755 /bin/gooby
	fi

	clear

	TASKCOMPLETE

else

	CANCELTHIS

fi

PAUSE
