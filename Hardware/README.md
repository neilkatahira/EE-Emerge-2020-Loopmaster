# Hardware Designs
We used several Integrated Processors in the development of our project. In most cases we used development boards, jumperwires and breadboards which allowed easy connections to test functionality. The pre-fabricated boards accelerated the software developement but the finished project was something professional, so we designed our own boards to house the integrated chips we were programming (MSP430's) as well as capes for the pre-fabricated boards we were using (OpenMV H7 and BeagleBone Black/Bela Cape).This allowed us to create more stable connection points, remove unnecessary functions, and create room for new functions (Xbee wireless Communication).

## MSP430 Boards
We developed one board that would function for both the Drumpad as well as the foot keyboard. It housed a MSP430 and provided ample room for the GPIO pins that were needed in instrument function.(MORE DETAILS) THe board replaced the GPIO pin out with screw terminals for better permanent connections. The board was also made with a footprint for an Xbee module to be soldered on.

## BeagleBone Black Cape
We designed a board that would connect to the breakout pins of the BeagleBoneBlack. It replaced the GPIO pinnouts with screw terminal connections for the required Serial ports and 3.3V rail. It also laid a footprint for a permanent addition of an Xbee module.

## Drumpad LED Board
We designed a board that simplified the wiring harness for 12 capacitive sense buttons. Each button required an op-amp to forward the button data as well as provide power to LEDs. We developed a board that made this complex wiring array compact and easy to trouble shoot. This allowed us to reduce the overall size requirements of the Drumpad Enclosure as well as reducing EM noise within the enclosure.

## Camera Cape
The most simple board we designed for the OpenMV camera module, it took the pinouts we needed from the development board and implemented screw terminals for better permanent connections.
