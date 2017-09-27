/*
 * uart.h
 *
 * Created: 7/09/2017 1:30:09 p.m.
 *  Author: xcao031
 */ 


#ifndef UART_H_
#define UART_H_

#include <avr/io.h>
#define BAUD 9600
#define FOSC 8000000UL
#define UBRR (FOSC/(16UL*BAUD)) - 1

void uart_init();
void uart_transmit(unsigned char data);




#endif /* UART_H_ */