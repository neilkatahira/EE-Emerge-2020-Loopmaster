# Bela + Software 
Multiple programming languages and development environments were used to design instrument logic as well as handle audio processing.  

## Pure Data  
Pure Data is an open source programming language with a focus on multimedia applications. It was used for the Loopmaster's core audio backend since Pure Data has core native support on the Bela Cape Board. More information about the project's main .pd module and its abstractions can be found in its subdirectory.  

![Pure Data](https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/PureData.PNG?raw=true)  
 
## GUI  
The GUI was created with MATLAB's App Designer. It utilizes UART to send data to an Arduino Uno, which then is sent and processed by the Beaglebone + Bela with the help of PureData.    

<p align="center">
  <img width="520" height="460" src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/gui.png?raw=true">
</p>

