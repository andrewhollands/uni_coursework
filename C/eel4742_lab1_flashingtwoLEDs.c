#include <msp430fr6989.h>
#include <stdint.h>
#define redLED BIT0
#define greenLED BIT7 // Green LED at 9.7

void main(void) {
  volatile uint32_t i;
  WDTCTL = WDTPW | WDTHOLD;
  PM5CTL0 &= ~LOCKLPM5;
  P1DIR |= redLED; P1OUT &= ~redLED;
  P9DIR |= greenLED;  // Direct pin as output
  P9OUT &= greenLED; // Turn LED On instead of off like the red LED to allow for LEDs to be toggled out of sync
  for(;;) {
    // Delay loop
    for(i=0; i<20000; i++) {
      P1OUT ^= redLED; // Toggle the red LED; moved unedited line inside delay loop instead of outside
    }
    // Identical delay loop to contain toggle green LED
    for(i=0; i<20000; i++) {
      P9OUT ^= greenLED; // Toggle the green LED 
    }
  } 
}
