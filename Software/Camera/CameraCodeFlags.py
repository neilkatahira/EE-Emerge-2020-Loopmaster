# Untitled - By: cdrow - Tue Feb 4 2020
#Single Color Grayscale Blob Tracking Example
#
# This example shows off single color grayscale tracking using the OpenMV Cam.

import sensor, image, time, pyb
from pyb import UART

# Color Tracking Thresholds (Grayscale Min, Grayscale Max)
# The below grayscale threshold is set to only find extremely bright white areas.
thresholds = (253, 255)
uart = UART(3,115200,timeout_char=1000)
uart.init(115200, bits=8, parity=None, stop=1, timeout_char=1000)

sensor.reset()
sensor.set_pixformat(sensor.GRAYSCALE)
sensor.set_framesize(sensor.QQVGA)
sensor.skip_frames(time = 2000)
sensor.set_auto_gain(False) # must be turned off for color tracking
sensor.set_auto_whitebal(False) # must be turned off for color tracking
clock = time.clock()
chordold = "0";
# lcd.init() # Initialize the lcd screen.

# Only blobs that with more pixels than "pixel_threshold" and more area than "area_threshold" are
# returned by "find_blobs" below. Change "pixels_threshold" and "area_threshold" if you change the
# camera resolution. "merge=True" merges all overlapping blobs in the image.

while(True):
   clock.tick()
   img = sensor.snapshot()
   chord = "0"
   for blob in img.find_blobs([thresholds], pixels_threshold=10, area_threshold=10, merge=True):
       img.draw_rectangle(blob.rect())
       img.draw_cross(blob.cx(), blob.cy())
       #all this code above just draws the outline of what it find, for troubleshooting
       # split the screen into 5 regions
       if ((blob.cx() <= 45) and (blob.cy() <= 45)):
           img.draw_rectangle(0,0,45,45,(255,0,0))
           chord = "1"
           #print("1")
       if ((blob.cx() <= 45) and (blob.cy() >= 120-45)):
           img.draw_rectangle(0,120-45,45,45,(255,0,0))
           chord = "4"
           #print("4")
       if (blob.cx() >= 128 and blob.cy() <= 32):
           img.draw_rectangle(160-45,0,45,45,(255,0,0))
           chord = "2"
           #print("2")
       if (blob.cx() >= 128 and blob.cy() >= 88):
           img.draw_rectangle(160-45,120-45,45,45,(255,0,0))
           chord = "3"
           #print("3")
       #if ((blob.cx() >= 64 and blob.cx() <= 96) and (blob.cy() >= 45 and blob.cy() <= 77)):
           #img.draw_rectangle(64,45,45,45,(255,0,0))
          #chord = "5"
       if (chordold != chord):
           uart.write(chord)
           print(chord)
       chordold = chord;
