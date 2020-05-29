# Drum Pad  
 The Drum Pad is a MIDI Pad-like instrument that houses twelve capacitive touch sensors. <img align="right" width="100" height="100" src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/drumpad.gif?raw=true"> These sensors are all mapped towards different sounds that are programmed within Pure Data code. When styles are changed within the GUI, the sensors will output their corresponding sounds. 


## Hardware  
Hardware that is used in the Drum Pad include two custom PCB's: one that implements a comparator circuit with LM741 OP-Amps to facilitate sensor presses, and one that houses a MSP430 and an XBee module for wireless serial communication to the BeagleBone + Bela. The latter PCB is also used with the FootPad instrument.  

<img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/drumpad_led.png?raw=true" width="480"><img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/drumkeypcb.png?raw=true" width="260">

## Mechanical  
The entire enclosure is 3D printed using an Ender 3 Pro using PLA with 0.2mm layer height. To improve printing time, a larger layer height with a larger nozzle will help.

![Drumpad Enclosure](https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/drumpad_transparent.png?raw=true)  

#### Assembly  
Drumpad Base + Walls.stl and Drumpad Top.stl go together to make a single box. Inside are standoffs for the Drumpad LED pcb, and space for the actual brains of the instrument. Sensor Enclosure.stl is a model of for a Capsense sensor, just in case you want to adapt it to another design. Drumpad PCB plate .stl is a simple plate that screws underneath the Drumpad LED pcb with M3 screws and nuts if not using the original enclosure.

#### Notes  
Supports for a hole in the Drumpad Base + Walls.stl may or may not be required depending on the capabilities of your printing solution. Print with a brim if issues such as corners warping occur. Scaling may break how everything comes together, so if your print bed is not big enough, slice in half and put together with superglue or by other means.

## Software  
Software used for the Drum Pad is created using CCS Cloud / Energia and is loaded onto a MSP430.
