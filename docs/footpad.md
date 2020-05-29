# FootPad  
The FootPad is a large six input floor board where inputs are passed with a user's feet. The FoodPad manipulates the sounds created by the Camera Vision and Drumpad.

## Hardware
The FootPad uses the same main XBee PCB as the DrumPad. Each board press is detected as separate lines with UART.  

<img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/XBee.png?raw=true" width="280">  <img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/drumkeypcb.png?raw=true" width="460"> 

## Mechanical  
The FootPad was created using 1/4" Plywood, 1/2" foam, copper tape, and screws. For each input, we wrapped one 4" x 1" x 1/4" Plywood pieces with copper tape and a 3" strip down the middle of two 6" x 24" x 1/4" Plywood pieces. The two pieces of plywood are then screwed together separated by 1/2" foam to prevent the copper tape from touching each other, creating a basic switch.

<img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/key1.png?raw=true" width="370"><img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/key2.png?raw=true" width="370"> 

## Software  
Software used for the FootPad was created using CCS Cloud / Energia and was loaded onto a MSP430.  It is the same as code used in the DrumPad.
