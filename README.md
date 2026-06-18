# Sorting Network for 8 Inputs

## Overview

This project implements an 8-input sorting network in Verilog HDL. The design employs comparator modules arranged in multiple stages to sort eight 16-bit numbers in ascending order.

## Features

- 8-input sorting network
- 16-bit data inputs
- Multi-stage architecture
- Modular comparator design
- Registered outputs
- Testbench verification

## Modules

- `sorting8_network.v` : Top module
- `BN1.v` : Comparator block
- `reg16.v` : 16-bit register
- `sorting8_network_tb.v` : Testbench

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Directory Structure

```
rtl/
├── BN1.v
├── reg16.v
└── sorting8_network.v

testbench/
└── sorting8_network_tb.v
```

## Author

Pranathi S  
BMS College of Engineering
