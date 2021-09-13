cmake_minimum_required(VERSION 3.4.1)
  add_library(
              tbgpio
              SHARED
              ../../src/c_gpio.c
              ../../src/c_gpio.h
              ../../src/wiringTB.c
              ../../src/wiringTB.h
              )