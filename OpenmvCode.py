import sensor, image, time, pyb, ustruct

# Color Tracking Thresholds (L Min, L Max, A Min, A Max, B Min, B Max)
# The below thresholds track in general red/green things. You may wish to tune them...
thresholds = [(30, 100, 15, 127, 15, 127), # generic_red_thresholds -> index is 0 so code == (1 << 0)
              (30, 100, -64, -8, -32, 32), # generic_green_thresholds -> index is 1 so code == (1 << 1)
              (0, 15, 0, 40, -80, -20)] # generic_blue_thresholds -> index is 2 so code == (1 << 2)
# Codes are or'ed together when "merge=True" for "find_blobs".

sensor.reset()
sensor.set_pixformat(sensor.RGB565)
sensor.set_framesize(sensor.QQVGA) #QQVGA = frame of 160x 120
#                                   QVGA = frame of 320x240
sensor.skip_frames(time = 2000)
sensor.set_auto_gain(False) # must be turned off for color tracking
sensor.set_auto_whitebal(False) # must be turned off for color tracking
clock = time.clock()

# The hardware SPI bus for your OpenMV Cam is always SPI bus 2.
# polarity = 0 -> clock is idle low.
# phase = 0 -> sample data on rising clock edge, output data on falling clock edge.

spi = pyb.SPI(2, pyb.SPI.SLAVE, polarity=0, phase=0)

    # NSS callback: send data when the Interupt is triggered
def nss_callback(line):
    global spi, data
    try:
        spi.send(data, timeout=1000)
    except OSError as err:
        pass 
        # Don't care about errors - so pass.
        # Note that there are 3 possible errors. A timeout error, a general purpose error, or
        # a busy error. The error codes are 116, 5, 16 respectively for "err.arg[0]".


# SPI with the Arduino as the master device and the OpenMV Cam as the slave.
#
# Please wire up your OpenMV Cam to your Arduino like this:
#
# OpenMV Cam Master Out Slave In (P0) - Arduino Uno MOSI (11)
# OpenMV Cam Master In Slave Out (P1) - Arduino Uno MISO (12)
# OpenMV Cam Serial Clock        (P2) - Arduino Uno SCK  (13)
# OpenMV Cam Slave Select        (P3) - Arduino Uno SS   (10)
# OpenMV Cam Ground                   - Arduino Ground


while(True):
    clock.tick()
    img = sensor.snapshot()
      #takes a snapshot -> returns class image
      
    for blob in img.find_blobs(thresholds, pixels_threshold=10, area_threshold=10, merge=True):
      #findblobs takes class image, and returns a list of class blob
      
        if blob.code() == 3:
          #blob.code() is a predefined function looking for an item that is both red and green(==3) in close proximity
            img.draw_rectangle(blob.rect())
            img.draw_cross(blob.cx(), blob.cy())
            img.draw_string(blob.x() + 2, blob.y() + 2, "r/g")
            #all this code above just draws the outline of what it find, for troubleshooting

            # split the screen into 5 regions
            if ((blob.cx() <= 32) and (blob.cy() <= 32)):
                print("1")
                chord = 1
            if ((blob.cx() <= 32) and (blob.cy() >= 88)):
                print("2")
                chord = 2
            if (blob.cx() >= 128 and blob.cy() <= 32):
                print("3")
                chord = 3
            if (blob.cx() >= 128 and blob.cy() >= 88):
                print("4")
                chord = 4
            if ((blob.cx() >= 64 and blob.cx() <= 96) and (blob.cy() >= 45 and blob.cy() <= 77)):
                print("5")
                chord = 5
            else:
                print("0")
                chord = 0

    data = ustruct.pack("i", 85, chord)

      # READ ME!!!
      #
      # Please understand that when your OpenMV Cam is not the SPI master it may miss responding to
      # sending data as a SPI slave no matter if you call "spi.send()" in an interrupt callback or in the
      # main loop below. Because of this you must absolutely design your communications protocol such
      # that if the slave device (the OpenMV Cam) doesn't call "spi.send()" in time that garbage data
      # read from the SPI peripheral by the master (the Arduino) is tossed. To accomplish this we use a
      # sync character of 85 (binary 01010101) which the Arduino will look for as the first byte read.
      # If it doesn't see this then it aborts the SPI transaction and will try again. Second, in order to
      # clear out the SPI peripheral state we always send a multiple of four bytes and an extra four zero
      # bytes to make sure that the SPI peripheral doesn't hold any stale data which could be 85. Note
      # that the OpenMV Cam will miss the "spi.send()" window randomly because it has to service
      # interrupts. Interrupts will happen a lot more while connected to your PC.

      # Configure NSS/CS in IRQ mode to send data when requested by the master. => when pin 3 goes from high to low, this interupt triggers & data is sent
    pyb.ExtInt(pyb.Pin("P3"), pyb.ExtInt.IRQ_FALLING, pyb.Pin.PULL_UP, nss_callback)



    img.draw_rectangle(0,0,32,32,(255,0,0))
    img.draw_rectangle(160-32,0,32,32,(255,0,0))
    img.draw_rectangle(160-32,120-32,32,32,(255,0,0))
    img.draw_rectangle(0,120-32,32,32,(255,0,0))
    img.draw_rectangle(64,45,32,32,(255,0,0))
    
# this is to draw the boxes to show the different regions

# Extra blob.codes for different Colors
# if blob.code() == 5: # r/b code
#           img.draw_rectangle(blob.rect())
#           img.draw_cross(blob.cx(), blob.cy())
#            img.draw_string(blob.x() + 2, blob.y() + 2, "r/b")
#        if blob.code() == 6: # g/b code
#            img.draw_rectangle(blob.rect())
#            img.draw_cross(blob.cx(), blob.cy())
#            img.draw_string(blob.x() + 2, blob.y() + 2, "g/b")
#        if blob.code() == 7: # r/g/b code
#            img.draw_rectangle(blob.rect())
#            img.draw_cross(blob.cx(), blob.cy())
#            img.draw_string(blob.x() + 2, blob.y() + 2, "r/g/b")
#    print(clock.fps())
