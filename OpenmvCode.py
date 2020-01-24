

import sensor, image, time, pyb, ustruct
from pyb import UART

# Color Tracking Thresholds (L Min, L Max, A Min, A Max, B Min, B Max)
# The below thresholds track in general red/green things. You may wish to tune them...
thresholds = [(30, 100, 15, 127, 15, 127), # generic_red_thresholds -> index is 0 so code == (1 << 0)
              (30, 100, -64, -8, -32, 32), # generic_green_thresholds -> index is 1 so code == (1 << 1)
              (0, 15, 0, 40, -80, -20)] # generic_blue_thresholds -> index is 2 so code == (1 << 2)
# Codes are or'ed together when "merge=True" for "find_blobs".

uart = UART(3,115200,timeout_char=1000)
uart.init(115200, bits=8, parity=None, stop=1, timeout_char=1000)

sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QQVGA) #QQVGA = frame of 160x 120
#                                   QVGA = frame of 320x240
sensor.skip_frames(time = 2000)
sensor.set_auto_gain(False) # must be turned off for color tracking
sensor.set_auto_whitebal(False) # must be turned off for color tracking
clock = time.clock()

# OpenMV Cam Ground                   - Arduino Ground


while(True):
    clock.tick()
    img = sensor.snapshot()
    chord = "0"
    #takes a snapshot -> returns class image
    #findblobs takes class image, and returns a list of class blob
    for blob in img.find_blobs(thresholds, pixels_threshold=10, area_threshold=10, merge=True):
        if blob.code() == 3:
        #blob.code() is a predefined function looking for an item that is both red and green(==3) in close proximity
            img.draw_rectangle(blob.rect())
            img.draw_cross(blob.cx(), blob.cy())
            img.draw_string(blob.x() + 2, blob.y() + 2, "r/g")
            #all this code above just draws the outline of what it find, for troubleshooting
            # split the screen into 5 regions
            if ((blob.cx() <= 45) and (blob.cy() <= 45)):
                print("1")
                img.draw_rectangle(0,0,45,45,(255,0,0))
                chord = "1"
            if ((blob.cx() <= 45) and (blob.cy() >= 120-45)):
                print("2")
                img.draw_rectangle(0,120-45,45,45,(255,0,0))
                chord = "2"
            if (blob.cx() >= 128 and blob.cy() <= 32):
                print("3")
                img.draw_rectangle(160-45,0,45,45,(255,0,0))
                chord = "3"
            if (blob.cx() >= 128 and blob.cy() >= 88):
                print("4")
                img.draw_rectangle(160-45,120-45,45,45,(255,0,0))
                chord = "4"
            if ((blob.cx() >= 64 and blob.cx() <= 96) and (blob.cy() >= 45 and blob.cy() <= 77)):
                print("5")
                img.draw_rectangle(64,45,45,45,(255,0,0))
                chord = "5"
    uart.write(chord)
