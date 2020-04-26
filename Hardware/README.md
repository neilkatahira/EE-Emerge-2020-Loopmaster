# Hardware Designs

Our system was fairly robust, and we needed quite a few board to complete it. The backbone of our hardware was based on the following boards:

[BeagleBoneBlack](https://beagleboard.org/black)  
[Bela Cape](https://beagleboard.org/p/112305/bela-low-latency-audio-sensor-cape-for-pocketbeagle-1615e0)  
[MSP430G2 LaunchPad](http://www.ti.com/tool/MSP-EXP430G2)  
[OpenMV H7](https://openmv.io/products/openmv-cam-h7)  
?Capsense Buttons?  
?Power Supply?  
?Batteries?  
?Voltage Regulator?  

Once we proved functionality, we designed our own circuitboards to improve the connections as well as size parameters of the pre-fabricated boards.

## Table of Contents


1. [Board Selection](#board-selection)  
   - [BeagleBoneBlack/BelaCape](#beagleboneblack/belaCape)  
   - [OpenMV H7](#openMv-h7)  
   - [MSP430](#msp430)  
   - [Xbee Module](#xbee-module)  
   - [Miscellaneous](#miscellaneous)  
2. [Custom Boards](#custom-boards)  
   - [Beagle Cape Cape](#beagle-cape-cape)  
   - [Drumpad/Keypad](#drumpad/keyboard)  
   - [Camera Cape](#camer-cape)  
   - [Button Wiring Harness](#button-wiring-harness)  
    
## Board Selection

### BeagleBoneBlack/BelaCape

The base of project was creating music, which meant making quality sounds at a responsive rate. This meant we needed low latency, as low as we could get it within budget! We built our system around the [BeagleBoneBlack](https://beagleboard.org/black) and [Bela Cape](https://beagleboard.org/p/112305/bela-low-latency-audio-sensor-cape-for-pocketbeagle-1615e0) which would combined process the input of instruments and output fast and quality sound.

### OpenMV H7 

We chose the OpenMV H7 because it is a relatively cheap, low power camera, that has loads of documentation and is very easy to work with. It has more than enough processing power to accomplish our tasks, as well as an IDE that uses python. 

### MSP430 

We chose to use these boards because everyone on our team had experience working with them, they are easy to use, and use an IDE that is almost identical to the Arduino IDE. They were also provided to us in launchboard form by [Texas Instruments](http://www.ti.com/) which vastly accelerated the project developement phase. - BIG THANKS! 

### Xbee Module

The Xbee module was a final implementation on the project to provide wireless communication. These modules are incredibly easy to use, and are very small. They are an excellent choice to provide wireless serial communication.

### Miscellaneous

Power Supply, Batteries, Voltage Regulators and Capsense tech

## Custom Boards

We used several Integrated Processors in the development of our project. In most cases we used development boards, jumperwires and breadboards which allowed easy connections to test functionality. We started with but the finished project was something professional, so we designed our own boards to house the integrated chips we were programming ([MSP430](http://www.ti.com/microcontrollers/msp430-ultra-low-power-mcus/overview.html)'s) as well as capes for the pre-fabricated boards we were using ([OpenMV H7](https://openmv.io/products/openmv-cam-h7) and [BeagleBoneBlack](https://beagleboard.org/black)/[Bela Cape](https://beagleboard.org/p/112305/bela-low-latency-audio-sensor-cape-for-pocketbeagle-1615e0)).This allowed us to create more stable connection points, remove unnecessary functions, and create room for new functions (Xbee wireless Communication).

### Beagle Cape Cape

We designed a board that would connect to the breakout pins of the BeagleBoneBlack. It replaced the GPIO pinnouts with screw terminal connections for the required Serial ports and 3.3V rail. It also laid a footprint for a permanent addition of an Xbee module.

### Drumpad/Keypad

We developed one board that would function for both the Drumpad as well as the foot keyboard. It housed a MSP430 and provided ample room for the GPIO pins that were needed in instrument function.(MORE DETAILS) THe board replaced the GPIO pin out with screw terminals for better permanent connections. The board was also made with a footprint for an Xbee module to be soldered on.

### Camera Cape

The most simple board we designed for the OpenMV camera module, it took the pinouts we needed from the development board and implemented screw terminals for better permanent connections.

### Drumpad Wiring Harness

We designed a board that simplified the wiring harness for 12 capacitive sense buttons. Each button required an op-amp to forward the button data as well as provide power to LEDs. We developed a board that made this complex wiring array compact and easy to trouble shoot. This allowed us to reduce the overall size requirements of the Drumpad Enclosure as well as reducing EM noise within the enclosure.
