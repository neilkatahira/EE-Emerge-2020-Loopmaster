#include <msp430g2553.h>
#include <stdint.h>
#include "structure.h"
#include "CTS_Layer.h"


#define DELAY_50ms  (400000)      // 8MHz MCLK Cycles for 50ms Delay


void UARTSendArray(unsigned char *TxArray, unsigned char ArrayLength);

uint16_t runCapTouch(void);
void InitCapSenseButtons(void);

 
void main(void)
{
    uint16_t buttonStates = 0;

    WDTCTL = WDTPW + WDTHOLD; // Stop WDT

    // Set the LEDs on P2.0, P2.5 as outputs
    P2DIR |= BIT3 + BIT5;

    // Configure Clocks
    DCOCTL = 0;
    BCSCTL1 = CALBC1_12MHZ;         // Set frequency range for 12 MHz Operation
    DCOCTL = CALDCO_12MHZ;          // Set DCO to Calibrated 12 MHz

    //#if 0
    /* Configure hardware UART */
    P1SEL |= BIT1 + BIT2 ;  // P1.1 = RXD, P1.2=TXD
    P1SEL2 |= BIT1 + BIT2 ; // P1.1 = RXD, P1.2=TXD
    UCA0CTL1 |= UCSSEL_2;  // Use SMCLK
    UCA0BR1 = 0x00;           // Set baud rate to 9600 with 12MHz clock, High byte
    UCA0BR0 = 0x68;         // Set baud rate to 9600 with 12MHz clock (Data Sheet 15.3.13), low byte
    
    UCA0MCTL = UCBRS0;     // Modulation UCBRSx = 1
    UCA0CTL1 &= ~UCSWRST;  // Initialize USCI state machine

    IE2 |= UCA0RXIE;       // Enable USCI_A0 RX interrupt
    //#endif

    InitCapSenseButtons();

    //__bis_SR_register(LPM0_bits + GIE); // Enter LPM0, interrupts enabled
    while(1)
    {

        buttonStates = runCapTouch();
        if(buttonStates)
        {
            P2OUT |= BIT3;
        }
        else
        {
            P2OUT &= ~BIT3;
        }
        
        
        __delay_cycles(DELAY_50ms);                     // Delay 50ms (14Hz button scan rate)
    }
}

//#if 0
#pragma vector=USCIAB0RX_VECTOR
__interrupt void USCI0RX_ISR(void)
{
    static volatile int data = 0;
    data = UCA0RXBUF;
    UARTSendArray("Received command: ", 18);
    UARTSendArray(&data, 1);
    UARTSendArray("\n\r", 2);
     
    switch(data)
    {
         case 'R':
            P1OUT |= BIT0;
            break;
         case 'r':
            P1OUT &= ~BIT0;
            break;
         case 'G':
            P1OUT |= BIT6;
            break;
         case 'g':
            P1OUT &= ~BIT6;
            break;
         default:
             break;
     }
}
//#endif

void UARTSendArray(unsigned char *TxArray, unsigned char ArrayLength)
{
    // Send number of bytes Specified in ArrayLength in the array at using the hardware UART 0
    // Example usage: UARTSendArray("Hello", 5);
    // int data[2]={1023, 235};
    // UARTSendArray(data, 4); // Note because the UART transmits bytes it is necessary to send two bytes for each integer hence the data length is twice the array length
 
    // Loop until StringLength == 0 and post decrement
    while(ArrayLength--)
    {
        while(!(IFG2 & UCA0TXIFG)); // Wait for TX buffer to be ready for new data
        UCA0TXBUF = *TxArray; //Write the character at the location specified py the pointer
        TxArray++; //Increment the TxString pointer to point to the next character
    }
}


/*
 * runCapTouch()
 */
uint16_t runCapTouch(void)
{
    uint16_t result = 0x0000;
    if(TI_CAPT_Button(&buttonSensor0))
    {
        result |= (0x1<<0);
        while(!(IFG2 & UCA0TXIFG));
        UCA0TXBUF = 'a';
    }

    if(TI_CAPT_Button(&buttonSensor1))
    {
        result |= (0x1<<1);
        while(!(IFG2 & UCA0TXIFG));
        UCA0TXBUF = 'b';
    }
    
    if(TI_CAPT_Button(&buttonSensor2))
    {
        result |= (0x1<<2);
        while(!(IFG2 & UCA0TXIFG));
        UCA0TXBUF = 'c';
    }

    if(TI_CAPT_Button(&buttonSensor3))
    {
        result |= (0x1<<3);
        while(!(IFG2 & UCA0TXIFG));
        UCA0TXBUF = 'd';
    }
    
    if(TI_CAPT_Button(&buttonSensor4))
    {
        result |= (0x1<<4);
        while(!(IFG2 & UCA0TXIFG));
        UCA0TXBUF = 'e';
    }
    return result;
}

void InitCapSenseButtons(void)
{
    // Init each of the cap sense sensor. 
    TI_CAPT_Init_Baseline(&buttonSensor0);       // Establish baseline
    TI_CAPT_Update_Baseline(&buttonSensor0, 10); // Average 10 baseline measurements


    TI_CAPT_Init_Baseline(&buttonSensor1);       // Establish baseline
    TI_CAPT_Update_Baseline(&buttonSensor1, 10); // Average 10 baseline measurements
    
    TI_CAPT_Init_Baseline(&buttonSensor2);       // Establish baseline
    TI_CAPT_Update_Baseline(&buttonSensor2, 10); // Average 10 baseline measurements


    TI_CAPT_Init_Baseline(&buttonSensor3);       // Establish baseline
    TI_CAPT_Update_Baseline(&buttonSensor3, 10); // Average 10 baseline measurements
    
    TI_CAPT_Init_Baseline(&buttonSensor4);       // Establish baseline
    TI_CAPT_Update_Baseline(&buttonSensor4, 10); // Average 10 baseline measurements

    TI_CAPT_Update_Tracking_Rate(TRIDOI_VSLOW | TRADOI_FAST);   // Set baseline update rate to VSLOW in direction of interest
}
