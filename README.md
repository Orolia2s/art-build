# Atomic Reference Time Build

This project aims at building the ART Daemon used to discipline the ART card.
it is intented to be used inside the ART repo workspace.

## Build

There are 3 main targets:

- **oscillatord**: Daemon interacting with the different devices exposed by the card's driver and the disciplining algorithm library
- **ubloxcfg**: Library to interact with the F9T serial and to parse UBX messages
- **disciplining-minipod**: Disciplining algorithm library

All these 3 targets are declined as follows:

- **make $TARGET**: builds target
- **make $TARGET-install**: install target on the host
- **make $TARGET-clean**: clean target's build repository
