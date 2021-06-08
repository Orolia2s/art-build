all: art-daemon

ubloxcfg:
	make -C ubloxcfg libubloxcfg.so

ubloxcfg-install: ubloxcfg
	sudo make -C ubloxcfg install-library

ubloxcfg-clean:
	make -C ubloxcfg clean

disciplining-minipod:
	mkdir -p disciplining-minipod/build
	cmake -S disciplining-minipod -B disciplining-minipod/build
	make -C disciplining-minipod/build

disciplining-minipod-install: disciplining-minipod
	sudo make -C disciplining-minipod/build install

disciplining-minipod-clean:
	make -C disciplining-minipod/build clean
	rm -rf disciplining-minipod/build

oscillatord: ubloxcfg-install disciplining-minipod-install
	mkdir -p oscillatord/build
	cmake -S oscillatord -B oscillatord/build
	make -C oscillatord/build

oscillatord-install: oscillatord
	sudo make -C oscillatord/build install

oscillatord-clean:
	sudo make -C oscillatord/build clean
	rm -rf oscillatord/build

art-daemon: oscillatord

art-daemon-install: oscillatord-install

clean: 
	make oscillatord-clean
	make disciplining-minipod-clean
	make ubloxcfg-clean


.PHONY: oscillatord-clean oscillatord-install disciplining-minipod disciplining-minipod-install disciplining-minipod-clean ubloxcfg ubloxcfg-install ubloxcfg-clean