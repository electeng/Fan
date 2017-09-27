/*
 * PID.c
 *
 * Created: 9/26/2017 12:37:58 PM
 *  Author: peng
 */ 


#include "PID.h"


void pid(int error, int sum_error, int pre_error){
	
	int p_term = error * p_coefficient;

	int i_term = sum_error * i_coefficient;

	int pid_output = p_term;
		
	OCR1B = pid_output ;
}

