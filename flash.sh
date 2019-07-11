#!/bin/bash
STM32_BIN=build-stm32/*/stm32-cmake-template.bin
OFFSET=0x8000000
st-flash --reset write "${STM32_BIN}" "${OFFSET}"
