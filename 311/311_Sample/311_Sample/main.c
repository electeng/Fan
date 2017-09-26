/*
 * 311_Sample.c
 *
 * Created: 6/09/2017 10:29:36 a.m.
 * Author : spt764
 */ 

#define F_CPU 8000000UL

#include <avr/io.h>
#include <stdlib.h>
#include <avr/portpins.h>
#include <avr/interrupt.h>
#include <string.h>
#include <stdio.h>

#include "timer.h"
#include "uart.h"
#include "ADC.h"
//#include "PID.h"



volatile int cur_speed = 0;
volatile uint16_t error;

volatile uint16_t rising_edge = 0;
volatile uint16_t falling_edge = 0;
volatile uint16_t  n_over_flow = 0;

volatile int count = 0;
volatile char data ;

volatile uint16_t cur_reading = 0;
volatile uint16_t pre_reading = 0;
volatile uint16_t current = 0;
volatile uint16_t voltage = 0;
volatile double power = 0;


ISR(PCINT0_vect){
	if (PINA & (1<<PINA0) ) {
		TOCPMCOE |= (1<<TOCC4OE);
		TOCPMCOE &= ~(1<<TOCC2OE);
	}
	else {
		TOCPMCOE |= (1<<TOCC2OE);
		TOCPMCOE &= ~(1<<TOCC4OE);
	}
}

ISR(USART0_TX_vect){
	//UCSR0B ^= (1<<RXEN0);
}

ISR(ADC_vect){

	if(count < 100){

	/*	uart_transmit('[');
		uart_transmit(pre_reading/100 +48);
		uart_transmit('.');
		uart_transmit((pre_reading%100)/10 +48);
		uart_transmit((pre_reading%100)%10 +48);*/

		
		//uart_transmit(' ');

		//Obtain the current reading
		cur_reading = cal_adc(ADC);

		
		/*uart_transmit(cur_reading/100 +48);
		uart_transmit('.');
		uart_transmit((cur_reading%100)/10 +48);
		uart_transmit((cur_reading%100)%10 +48);
		uart_transmit(' ');

		uart_transmit(']');*/

		//calculate power
		double temp_power = pre_reading * cur_reading;
		temp_power = temp_power / 10000;
		power = power + temp_power;

		//Increment the number of power values and switch channel
		count++;
		ADMUXA ^= (1<<0);

		//Update previous reading to the current reading
		pre_reading = cur_reading ;

	}else{
		
		//take the average value
		power = power/99;

		//convert power into a string using the double to string function
		/*char temp[5];
		dtostrf(power,5,2,temp);*/
		
		//Transmit power

		/*uart_transmit('|');

		uart_transmit(temp[0]);
		uart_transmit(temp[1]);
		uart_transmit(temp[2]);
		uart_transmit(temp[3]);
		uart_transmit(temp[4]);
		
		uart_transmit('|');

		uart_transmit(' ');*/

		//Reinitialize everything to start another power reading
		pre_reading = 0;
		cur_reading  = 0;
		count = 0;
		power = 0;
	}
}	


	
ISR(USART0_RX_vect){
	data = UDR0;

	UCSR0B &= ~(1<<RXEN0);
	//UCSR0B |=(1<<TXEN0);
	
	uart_transmit(data);
	//UCSR0B |= (1<<RXEN0);
}

ISR(TIMER2_CAPT_vect){

	//if rising edge triggered, update rising_edge value
	if(PINB & (1<<PB2)){
		n_over_flow = 0;
		rising_edge = ICR2;
		falling_edge = 0;

		//Change to falling edge triggered to capture 1/4 of rotation
		TCCR2B ^= (1<<ICES2);
	}else{

		falling_edge = ICR2;
		
		//Calculate the timer value between rising edge and falling edge,
		//hence calculate RPM
		int distance = n_over_flow*65536 - rising_edge + falling_edge;
		cur_speed = 1875000/distance;
		
		
		error = 2700 - cur_speed;
		
		/*
		char x[5];
		itoa(n_over_flow,x,10);

		uart_transmit(x[0]);
		uart_transmit(x[1]);
		*/

		/*char y[4] = {0};
		sprintf(y,"%d",error);
		uart_transmit(y[0]);
		uart_transmit(y[1]);
		uart_transmit(y[2]);
		uart_transmit(y[3]);
		uart_transmit(y[4]);
		uart_transmit(' ');*/
		
		rising_edge = 0;
		
		//Toggle bit to change back to rising edge triggered
		TCCR2B ^= (1<<ICES2);
	}
}


ISR(TIMER2_OVF_vect){
	n_over_flow ++;
}


int main(void)
{
	// Initialize pin
	// Output: PA5, PA3 for fan drivers
	// Input: PA0, PB0, PB1 
	//PA0 corresponds to hall sensor input
	DDRA |= (1<<DDRA5)|(1<<DDRA3);
	DDRA &= ~(1<<DDRA0);
	DDRB &= ~((1<<DDRB0)|(DDRB1)|(DDRB2));

	//enable the internal pull-up resistor for the hall sensor input
	PUEA = 0b00000001;

	cli();

	//enable interrupt on PIN7 for hall sensor input
	PCMSK0 |= (1 << PCINT0);
	GIMSK |= (1 << PCIE0);
	

	//Initialize timer, UART and ADC
	timer_init();
	uart_init();
	//adc_init();
	UCSR0B &= ~(1<<RXEN0);


	//enable global interrupt
	sei();
	
	int error;
	char temp[4];

	while (1){
		error = 2650 - cur_speed;
		pid(error);
	}
}






