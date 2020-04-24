# Loop Master

[Loopmaster](https://neilkatahira.github.io/EE-Emerge-2020-Loopmaster/) is a musical project created by a team of UC Davis [EE-Emerge](https://www.ece.ucdavis.edu/ieee/home/ee-emerge/) (EEC 105ABC) students. This project tackles the idea of creating your own musical melodies or riffs, regardless of skill level or knowledge. Currently, three custom "instruments" interface together to output notes based on the user's selections.

## Table of Contents

1. [About the Project](#about-the-project)
2. [Project Status](#project-status)
3. [Getting Started](#getting-started)
    1. [Dependencies](#dependencies)
    1. [Building](#building)
    1. [Usage](#usage)
4. [How to Get Help](#how-to-get-help)
5. [Further Reading](#further-reading)
6. [Authors](#authors)
7. [Acknowledgements](#acknowledgements)

# About the Project

Three instruments (Drumpad, Camera Vision, and Footpad) work with selections specified in a MATLAB GUI. In tandem, a BeagleBone Black and a Bela Cape is utilized to process user inputs and output different notes.
The Drumpad works akin to a traditional MIDI pad, where each of the twelve buttons are mapped to notes that relate to a selection of instruments. The Camera vision, on the other hand, maps different notes to select areas in a camera's view and outputs sound when a trigger is visible. The Footpad takes input from a user's feet and output's sound based on the pressed key.

# Project Status

Final assembly and code refinement.

# Getting Started

This repository can be downloaded at the top [here](https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster), or cloned by:
```
git clone https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster
```

## Dependencies

#### Software
[Code Composer Studio](https://software-dl.ti.com/ccs/esd/documents/ccs_downloads.html)  
CCS is required for the Drumpad and the Footpad. When prompted, select the MSP430 if interfacing with the Drumpad or Footpad.

[PureData](https://github.com/BelaPlatform/Bela/wiki/Getting-started-with-Bela)  
The Bela IDE is used for the majority of the workflow for the Beaglebone + Bela.

#### Hardware & Model Creation
[Altium](https://www.altium.com/) was used for PCB creation.  
[Fusion 360](https://www.autodesk.com/products/fusion-360/overview) was used for the creation of enclosures and other mechanical files.  
[Cura](https://ultimaker.com/software/ultimaker-cura) was used as our main slicer for 3D printing. The UC Davis ESDC's Ultimaker's and personal Ender 3 Pro's were used for fabrication here.  

## Building

PCB and enclosure files will be located in their respective subdirectories. These were fabricated either with a 3D printer or with a laser cutter.
Software for the instruments will just have to be compiled and loaded into their respective MCU's either in the Puredata IDE or in CCS Cloud.

## Usage

TBD

# How to Get Help

You can request any changes by making a [pull request](https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/pulls) or opening an issue.

# Further Reading
* [Airdrum](https://hackaday.com/2019/11/15/finally-your-air-drumming-has-an-outlet/)
* [Foot Piano](https://www.instructables.com/id/Build-a-Big-Piano/)

# Authors

* [Benjamin Moore](https://github.com/mooreben34)
* [Conrad Rowling](https://github.com/Conrad-Rowling)
* [Neil Katahira](https://github.com/neilkatahira)
* [Jocelyn Park](https://github.com/spectivePer)
* [Isabelle Asistin](https://github.com/ijasistin)
* [Varsha Senthil](https://github.com/varshaaaaa)
* [Tyler Kelley](https://github.com/tfkelley)
* [Ryan Ma](https://github.com/RyanMa1)
* [Devon Liu](https://github.com/dvnliu)

# Acknowledgments

Thanks to Texas Instruments for sponsoring EE-Emerge, along with Sean and Professor Knoesen. We would not have gotten this far without their help and support.
Huge mention to Alessandro Verdiesen and Luuk van Kuijk with the original idea and inspiration of the [Airdrum](https://hackaday.com/2019/11/15/finally-your-air-drumming-has-an-outlet/) and the whole project.
