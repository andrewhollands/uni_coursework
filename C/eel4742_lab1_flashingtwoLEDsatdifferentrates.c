#include <msp430fr6989.h>
#include <stdint.h>
#define redLED BIT0
#define greenLED BIT7

void main(void) {
  volatile uint32_t i;
  WDTCTL = WDTPW | WDTHOLD; PM5CTL0 &= ~LOCKLPM5;
  P1DIR |= redLED; P1OUT &= ~redLED;
  P9DIR |= greenLED;
  P9OUT &= greenLED;
  for(;;) {
    P9OUT ^= greenLED;  // Toggle green LED again to keep turned on twice as long as the red LED
    // Delay loop
    for(i=0; i<10000; i++) {
      P1OUT ^= redLED;
    }
    for(i=0; i<10000; i++)  {
      P9OUT ^= greenLED;
    }
  } 
}
