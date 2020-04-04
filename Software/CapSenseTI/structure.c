/* --COPYRIGHT--,BSD
 * Copyright (c) 2012, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * --/COPYRIGHT--*/
/*
 *
 * Texas Instruments, Inc.
 * MCU Touch Systems
 *
 * MSP-TouchPro Button Tuning Example
 * CCSv5.2
 *
 * MSP430G2553
 * MSP-EXP430G2 LaunchPad
 * 3-Button 1-Prox BoosterPack
 *
 * structure.c
 * fRO (Fast RO Method)
 *
 *
 * December 2012
 * Rev 1.0
 *
 */

#include "structure.h"

const struct Element buttonElement0 =
{
    .inputBits = BIT0,
    .inputPxselRegister = (unsigned char *)&P2SEL,
    .inputPxsel2Register = (unsigned char *)&P2SEL2,
    .threshold = 25

};

const struct Element buttonElement1 =
{
    .inputBits = BIT1,
    .inputPxselRegister = (unsigned char *)&P2SEL,
    .inputPxsel2Register = (unsigned char *)&P2SEL2,
    .threshold = 25

};

const struct Element buttonElement2 =
{
    .inputBits = BIT2,
    .inputPxselRegister = (unsigned char *)&P2SEL,
    .inputPxsel2Register = (unsigned char *)&P2SEL2,
    .threshold = 25

};

const struct Element buttonElement3 =
{
    .inputBits = BIT4,
    .inputPxselRegister = (unsigned char *)&P2SEL,
    .inputPxsel2Register = (unsigned char *)&P2SEL2,
    .threshold = 25

};

const struct Element buttonElement4 =
{
    .inputBits = BIT6,
    .inputPxselRegister = (unsigned char *)&P2SEL,
    .inputPxsel2Register = (unsigned char *)&P2SEL2,
    .threshold = 25

};

const struct Sensor buttonSensor0 =
{
    .halDefinition = fRO_PINOSC_TA0_TA1,
    .numElements = 1,
    .baseOffset = 0,
    // Pointer to elements
    .arrayPtr[0] = &buttonElement0,
    .sourceScale = TIMER_SOURCE_DIV_0,
    .measGateSource = TIMER_SMCLK,
    .accumulationCycles = 150
};

const struct Sensor buttonSensor1 =
{
    .halDefinition = fRO_PINOSC_TA0_TA1,
    .numElements = 1,
    .baseOffset = 1,
    // Pointer to elements
    .arrayPtr[0] = &buttonElement1,
    .sourceScale = TIMER_SOURCE_DIV_0,
    .measGateSource = TIMER_SMCLK,
    .accumulationCycles = 150
};

const struct Sensor buttonSensor2 =
{
    .halDefinition = fRO_PINOSC_TA0_TA1,
    .numElements = 1,
    .baseOffset = 2,
    // Pointer to elements
    .arrayPtr[0] = &buttonElement2,
    .sourceScale = TIMER_SOURCE_DIV_0,
    .measGateSource = TIMER_SMCLK,
    .accumulationCycles = 150
};

const struct Sensor buttonSensor3 =
{
    .halDefinition = fRO_PINOSC_TA0_TA1,
    .numElements = 1,
    .baseOffset = 3,
    // Pointer to elements
    .arrayPtr[0] = &buttonElement3,
    .sourceScale = TIMER_SOURCE_DIV_0,
    .measGateSource = TIMER_SMCLK,
    .accumulationCycles = 150
};

const struct Sensor buttonSensor4 =
{
    .halDefinition = fRO_PINOSC_TA0_TA1,
    .numElements = 1,
    .baseOffset = 4,
    // Pointer to elements
    .arrayPtr[0] = &buttonElement4,
    .sourceScale = TIMER_SOURCE_DIV_0,
    .measGateSource = TIMER_SMCLK,
    .accumulationCycles = 150
};
