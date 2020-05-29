# Camera

## Hardware  
We chose the OpenMV H7 because it is an affordable, low power camera that is well documented and easy to work with. It has more than enough processing power to accomplish our tasks, as well as an integrated Python based IDE. Using Python allowed us to take advantage of open source libraries, which simplified the learning curve of image processing algorithms.

<img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/openmvh7.png?raw=true" width="370"><img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/tvshield.png?raw=true" width="370">

## Mechanical  
To mount the OpenMV H7 camera, we used a STL file provided by OpenMV [here](https://openmv.io/collections/products/products/openmv-cam-h7-case) and modified it in order to fit a [TV shield](https://openmv.io/collections/products/products/tv-shield) as well as screw terminals. To play the "camera instrument" live video feed is necessary to provide the user with the camera's field of view. A vertical mount was also added taking advantage of a ball socket, for a full range of adjustment. This mount was then superglued onto the main Hub of the project.  
<img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/ballandsocket.png?raw=true" width="370"><img src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/CameraModel.png?raw=true" width="370">

## Software  
The software for tracking our camera instrument was developed in the OpenMV IDE. This is a straightforward IDE with an extensive user base. It had plenty of options to improve the code using computer learning algorithms and object identification.

<p align="center">
  <img width="580" height="460" src="https://github.com/neilkatahira/EE-Emerge-2020-Loopmaster/blob/master/pictures/openmvide.png?raw=true">
</p>

We tested a variety of different ways to track an object and found that using simple algorithms lead to inaccurate readings, and using complex algorithms - TensorFlow or other computer training - to identify and track an object created too much of a delay. From those preliminary tests, we decided to simplify the object instead.  
We tracked an LED in grayscale and searched for areas in which the pixel value was white < [253]. To do this we used an algorithm provided in the OpenMV Micropython library called  findblobs(). Threshold values are passed to define what kind of blob should be detected. Given this, it will find all the blobs that meet that criteria. Then, we searched through those blobs to see if the center of any of those blobs fit inside certain areas of the screen (each corner). If a blob is in a corner, we send the BeagleBone + Bela a code to play a note designated by that corner.
