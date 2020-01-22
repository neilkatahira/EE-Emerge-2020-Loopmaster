#include "Button_Interface.h"
#include "Wire.h"

#define IO_EXPANDER_ADDR (0x41)
#define PCA9536_INPUT_PORT_REG         (0x00)
#define PCA9536_OUTPUT_PORT_REG        (0x01)
#define PCA9536_POLARITY_INVERSION_REG (0x02)
#define PCA9536_CTRL_REG               (0x03)


// Each element represents a button. only two bits are used, the two LSBs. 
// bit 1 is the previous button state and bit 0 is the current state. 
// There are four states the be in. 
// 00 -> False
// 01 -> False
// 10 -> True
// 11 -> False
static char buttonPressedFlags[4] = {0, 0, 0, 0};

static char flags[4] = {0,0,0,0};

void Buttons_Init(void)
{
    // Software I2C is used by default on MS430. Can be MASTER ONLY.
    Wire.begin();
    
    // Set all 4 pins as input pins
    Wire.beginTransmission(IO_EXPANDER_ADDR);
    Wire.write(PCA9536_CTRL_REG);
    Wire.write(0x0F);
    Wire.endTransmission();

    // Buttons are normally closed. Following inverts the signals 
    // so that positive logic can be used.
    Wire.beginTransmission(IO_EXPANDER_ADDR);
    Wire.write(PCA9536_POLARITY_INVERSION_REG);
    Wire.write(0x0F);
    Wire.endTransmission();
}

static char GetButtonsStates(void)
{
    char c = 0x00;
    Wire.beginTransmission(IO_EXPANDER_ADDR); 
    Wire.write(PCA9536_INPUT_PORT_REG);
    Wire.endTransmission();
    Wire.requestFrom(IO_EXPANDER_ADDR, 1 );   
    while(Wire.available())    // slave may send less than requested
    { 
        // Only lower 4 bits are valid, upper 4 are dont cares. 
        c = Wire.read() & 0x0F; // receive a byte as character
    }

    return c;
}


char State_Button1(void)
{
    return ((GetButtonsStates() & 0x01) ? 0x01 : 0x00);
}
char State_Button2(void)
{
    return ((GetButtonsStates() & 0x02) ? 0x01 : 0x00);
}
char State_Button3(void)
{
    return ((GetButtonsStates() & 0x04) ? 0x01 : 0x00);
}
char State_Button4(void)
{
    return ((GetButtonsStates() & 0x08) ? 0x01 : 0x00);
}