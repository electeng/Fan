/*
 * PID.c
 *
 * Created: 9/26/2017 12:37:58 PM
 *  Author: peng
 */ 


#include "PID.h"

#define duty_cycle OCR1B/(OCR1A+1)

void pid(int error){
	
	int p_term = error * p_coefficient;
	
	int pid_output = p_term ;
	
	if(pid_output>267){
		pid_output = 267;
	}


	
	OCR1B = pid_output ;

	
}

