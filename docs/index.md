# LoopMaster

[LoopMaster](https://neilkatahira.github.io/EE-Emerge-2020-Loopmaster/) is a musical project created by a team of UC Davis [EE-Emerge](https://www.ece.ucdavis.edu/ieee/home/ee-emerge/) (EEC 105ABC) students. This project allows you to create your own musical melodies or riffs, regardless of skill level or knowledge. Three custom "instruments" interface together to output notes, chords, and audio manipulations based on the user's selections.  

{%include youtubePlayer.html id="1H5Hb9ecIn0"%}  


# About the Project:
The goal of this project was to create a functional music creation tool, and demonstrate various input methods. We wanted to make something that was easy for beginners to pick up and make something that sounds nice, but also create an enjoyable experience for someone more serious.<br/>

However there are many factors that can detract from musical creation, particulary poor sound quality and latency. To ensure that the music we were making was responsive and sounded good, we designed our project around the [Bela](https://shop.bela.io/products/bela-starter-kit):

{%include youtubePlayer.html id="Os2ljj1cIog"%}

We used it in conjunction with a [BeagleBone Black](https://beagleboard.org/black) to process incoming signals, and respond with fast - quality sound. <br/>

The next step was creating a way to get user input; we thought of a couple very creative was to use technologies like [Capsense Buttons](https://en.wikipedia.org/wiki/Capacitive_sensing) and an easy to use [Computer Vision Module](https://openmv.io/). We built our own Circuit Boards to house MicroControllers that would process our user input, and convert it to UART. We chose the [MSP430G2553](https://www.ti.com/product/MSP430G2553?utm_source=google&utm_medium=cpc&utm_campaign=epd-null-null-GPN_EN-cpc-pf-google-wwe&utm_content=MSP430G2553&ds_k=%7b_dssearchterm%7d&DCM=yes&gclid=EAIaIQobChMIla_IpeDY6QIVksDACh221wHbEAAYASAAEgIOUPD_BwE&gclsrc=aw.ds) for our microcontroller because [TI](https://www.ti.com/) sponsored our course, and the associated [Launchpad](http://www.ti.com/tool/MSP-EXP430G2) drastically increased our software development time. <br/>

Then we decided to take the project wireless! using a straightforward network of [XBee](https://www.adafruit.com/product/964) modules we were able to send multiple UART messages in unison, and create a modular sleek look to the system.

Our final signal flow chart ended up like this:

<p align="center">
  <img width="460" height="460" src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/FlowChart.png?raw=true">
</p>

<video>  
