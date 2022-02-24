#include <msp430fr6989.h>
#include <stdint.h>
#define redLED BIT0

void main(void) {
  volatile uint32_t i;
  // Added to support additional integer widths
  // Changed from 'volatile unsigned int i' in order to support a larger counter integer to increase LED flash period
  WDTCTL = WDTPW | WDTHOLD; PM5CTL0 &= ~LOCKLPM5;
  P1DIR |= redLED; P1OUT &= ~redLED;
  for(;;) {
    // Delay loop
    for(i=0; i<120000; i++) {} // Changed from an upperbound of 20000 to increase delay time
    // Added identical delay loop to obtain larger delay
    for(i=0; i<120000; i++) {}
    P1OUT ^= redLED; // Toggle the red LED
  }
}
