# 1010 Sequence Detector — Moore & Mealy FSM (Verilog)

Implements a sequence detector for the binary pattern **1010** using both **Moore** and **Mealy** FSM architectures in Verilog HDL.  
Synthesized and simulated on **Xilinx Vivado 2024.2** targeting the **Artix-7 (xc7a35tcpg236-1)** FPGA.

---

## Features
- Moore FSM: 5 states (S0–S4), output registered on state entry
- Mealy FSM: 4 states (S0–S3), output depends on state + input
- Supports both **overlapping** and **non-overlapping** detection via parameter
- Common testbench for side-by-side comparison

## Repository Structure
src/ -> RTL source files

simulation/ -> Vivado simulation waveforms and utilization report

## FSM Overview

| Architecture | States | Output Type | Detection |
| Moore | 5 (S0–S4) | State-based | Overlapping / Non-overlapping |
| Mealy | 4 (S0–S3) | State+Input | Overlapping / Non-overlapping |

## Simulation Results

**Full waveform — Moore vs Mealy comparison:**  
![Waveform Full](simulation/waveform_full_view.png)

**State transition detail:**  
![Waveform Detail](simulation/waveform_state_detail.png)

## Utilization (Post-Synthesis)
| Resource | Used | Available |
| Slice LUTs | 2 | 20800 |
| Flip Flops (FDRE) | 3 | 41600 |
| Bonded IOBs | 4 | 106 |
| BUFG | 1 | 32 |

> Synthesized design: `seq_1010_moore` | Device: xc7a35tcpg236-1

## Tools Used
- Xilinx Vivado 2024.2
- Verilog HDL
- Target: Artix-7 FPGA

## How to Simulate
1. Open Vivado → Create project → Add sources from `src/`
2. Set `seq_1010_tb.v` as simulation top
3. Run Behavioral Simulation
