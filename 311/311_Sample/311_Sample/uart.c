/*
 * uart.c
 *
 * Created: 7/09/2017 1:31:40 p.m.
 *  Author: xcao031
 */ 

 #include "uart.h"


 void uart_init(){
	UBRR0	= UBRR; //Setting baud rate to 9600
	//Enable transmitter and receiver
	UCSR0B |= (1<<TXEN0)|(1<<RXCIE0)|(1<<TXCIE0);
 }



 void uart_transmit(unsigned char data){
	while(!(UCSR0A&(1<<UDRE0)));
	UDR0 = data;
 }


 unsigned char uart_receive(){
	while(!(UCSR0A&(1<<RXC0)));
	return UDR0;
 }
