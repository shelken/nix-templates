/**
 ******************************************************************************
 * @file           : main.c
 * @author         : Auto-generated by STM32CubeIDE
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2023 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */

#include <stdint.h>
#include <stddef.h>

#if !defined(__SOFT_FP__) && defined(__ARM_FP)
#warning "FPU is not initialized, but the project is compiling for an FPU. Please initialize the FPU before use."
#endif

#define RCC (volatile uint32_t*) (0x40023800U)
#define RCC_AHB1_OFFSET 0x30U

#define GPIOA (volatile uint32_t*) (0x40020000U)
#define GPIOD (volatile uint32_t*) (0x40020C00U)

#define GPIO_IDR_OFFSET 0x10U
#define GPIO_ODR_OFFSET 0x14U
//#define GPIODEN 1 << 3

/*
User LD6: blue LED is a user LED connected to the I/O PD15


0x4002 2000 - 0x4002 23FF	GPIOI
0x4002 1C00 - 0x4002 1FFF	GPIOH
0x4002 1800 - 0x4002 1BFF	GPIOG
0x4002 1400 - 0x4002 17FF	GPIOF
0x4002 1000 - 0x4002 13FF	GPIOE
0x4002 0C00 - 0x4002 0FFF	GPIOD
0x4002 0800 - 0x4002 0BFF	GPIOC
0x4002 0400 - 0x4002 07FF	GPIOB
0x4002 0000 - 0x4002 03FF	GPIOA
 * */

struct Device
{
	volatile uint32_t *clock;
	volatile uint32_t *led;
	volatile uint32_t *button;
};

void init(struct Device device)
{
	// enable io ports A and D
	*(device.clock) |= ((1 << 3) | (1 << 0));

	// set led gpio port d as output
	*(device.led) |= 1 << 30;
	*(device.led) &= ~(1 << 31);

	// set button gpio port a as input
	*(device.button) &= ~((1 << 1) | (1 << 0));
}

void delay(uint32_t time)
{
	for (volatile uint32_t i = 0; i < time; i++)
		;
}

void update(struct Device device)
{
	volatile uint32_t *button_input_register = device.button + GPIO_IDR_OFFSET;
	uint32_t button_state = 0b1 & *button_input_register;

	delay(100);

	volatile uint32_t *led_output_register = device.led + GPIO_ODR_OFFSET;
	*led_output_register = (button_state << 15);

	delay(100);
}

void blink(struct Device device)
{
	volatile uint32_t *led_output_register = device.led + GPIO_ODR_OFFSET;
	*led_output_register ^= (1 << 15);
	delay(500000);
}

int main(void)
{
	struct Device device = {
		.clock = RCC + RCC_AHB1_OFFSET,
		.led = GPIOD,
		.button = GPIOA
	};

	init(device);

	for (;;)
	{
		blink(device);
	}
}