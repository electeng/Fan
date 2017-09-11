
#include <avr/io.h>

// uartlib.h
// Prototypes

#define BAUD 9600
#define FOSC 16000000UL
#define UBRR (FOSC/(16UL*BAUD)) - 1

void uart_init(void);						//initialise UART
void uart_stop(void);						//stop UART
void uart_transmit(uint8_t data);			//transmit 8-bit data to UART