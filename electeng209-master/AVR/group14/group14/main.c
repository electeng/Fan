/*
* group14.c
*
* Created: 10/08/2016 11:38:11 a.m.
* Author : Eugene Fong
*/
#include "uartlib.h"


int main(void)
{
	uart_init(); //set up uart
	
	uint8_t data[] = {0b11111111, 0b01100101, 0b01010111, 0b00100110, 0b00000001}; //display 5 7. 6 1
	int i;
	
	while (1)
	{
		for (i = 0; i < 5; i++){
			uart_transmit(data[i]); //transmit data in char array to uart
		}
	}
}

