//
#include <avr/io.h>
#include <uartlib.h>

//initialise UART
void uart_init(void){
	
	//UBRR fits across two registers
	UBRR0H = ((uint8_t) UBRR) >> 8;			//set upper bits of UBRR
	UBRR0L = (uint8_t) UBRR;				//set lower bits of UBRR

	//Enable Transmitter
	UCSR0B |= _BV(TXEN0);
	//alternative: UCSR0B |= (1 << TXEN0);

	//Set the bit frame to 8-bit
	UCSR0C = (3 << UCSZ00);
	//alternative: UCSR0C = (1 << UCSZ01) | (1 << UCSZ00);
}

//stop UART
void uart_stop(void){
	UCSR0B &= ~_BV(TXEN0);					//stop transmitter
	//alternative: UCSR0B &= ~(1 << TXEN0);
}

//transmit UART
void uart_transmit(unsigned char data){
	while (!(UCSR0A & _BV(UDRE0)));			//if UDRE0 in UCSR0A is not empty, wait in while loop
	//alternative: while (!(UCSR0A & (1 << UDRE0)));
	UDR0 = (uint8_t) data;					//load 8-bit data to UDR0 register and transmit
}