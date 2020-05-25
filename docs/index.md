# LoopMaster

[LoopMaster](https://neilkatahira.github.io/EE-Emerge-2020-Loopmaster/) is a musical project created by a team of UC Davis [EE-Emerge](https://www.ece.ucdavis.edu/ieee/home/ee-emerge/) (EEC 105ABC) students. This project allows you to create your own musical melodies or riffs, regardless of skill level or knowledge. Three custom "instruments" interface together to output notes, chords, and audio manipulations based on the user's selections.


INSERT VIDEO  

Three in-house built instruments (DrumPad, Camera, and FootPad) work with selections specified in a MATLAB GUI communicating with a BeagleBone Black and Bela Capa.  The BeagleBone Black and Bela Cape is utilized to process user inputs and output different notes or chords.

1. The Drumpad works like a traditional MIDI pad, where each of the twelve buttons are mapped to notes that relate to a selection of instruments.  

![Camera](https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/Camera%20and%20Hub.jpg)
 
 
2. The Computer Vision maps different notes to select areas in a camera's view and outputs sound when a trigger is visible.  

INSERT PIC  
 
 
3. The Footpad takes input from a user's feet and manipulates the sounds created by the Camera Vision and Drumpad.  
 
 INSERT PIC  
