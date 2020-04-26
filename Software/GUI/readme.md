## MATLAB GUI
Found in the MATLAB folder is a MATLAB App Designer GUI with an exported .m file for full modification.

## Arduino
In the Arduino folder, there resides a file for taking serial data from MATLAB, parsing and sending with UART. There is also a second optional Arduino file for sniffing what is sent with MATLAB.

## Setup
1. Connect Arduino to computer by USB.
2. Connect Arduino TX -> Beaglebone BELA RX. Alternatively, connect to another Arduino UNO with TEST_serialReceive.ino. Connect to ground to establish physical UART.
* If using second Arduino UNO, load code in TEST_serialReceive.ino with GND disconnected. Then, reconnect GND.
3. Open UART_GUI.ino in Arduino IDE. Check COM ports and upload to board.
4. Open LoopMasterApp.mlapp. Check COM port and baudrate in line 45. Change accordingly and run. Make sure connections are secure and data is sent/received.
