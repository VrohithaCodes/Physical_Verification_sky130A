# Open-Source VLSI EDA Toolchain Documentation

This repository contains lab documentation, schematics, simulations, and layouts built using the open-source Electronic Design Automation (EDA) toolchain. 

## Software Toolchain Overview

### 1. Xschem
* **Definition:** A hierarchical schematic capture program that allows designers to draw electronic circuits (like CMOS gates) and generate SPICE netlists for simulation.
* **Latest Version:** v3.4.8
* **Launch Command:**
  ```bash
  xschem
### 2. Ngspice
**Definition:** An open-source mixed-level, mixed-signal electronic circuit simulator based on Berkeley SPICE 3f5. It is used to perform DC, AC, and transient analyses on netlists.

**Latest Version:** Ngspice-47

**Execution/Simulation Command:** ngspice schematic.spice
### 3. Magic
**Definition:** An interactive layout editor used for Very Large Scale Integration (VLSI) layout design. It handles physical mask geometry creation and built-in Design Rule Checking (DRC).

**Latest Version:** Magic-8.3

**Launch Command:** magic -T sky130A

### 4. Netgen
**Definition:** A tool for comparing netlists, commonly used for Layout Versus Schematic (LVS) verification to ensure that the physical layout matches the original circuit schematic.

**Latest Version:** Compatible with Magic / Open_PDKs tool suite (v1.5+)

**Execution Command** (LVS Batch mode):netgen -batch lvs "schematic.spice cell_name" "layout.spice cell_name"

<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/df505509-2d60-4e02-9eff-3f33f354e7ea" />

### Basic Workflow: From Schematic to SimulationOpen Xschem: 
1.Run xschem in your working folder.
2.Place Components: Press Shift + i to add transistors (e.g., sky130_fd_pr__nfet_01v8 and sky130_fd_pr__pfet_01v8), power sources (vdd), ground (gnd), and input/output pins (ipin, opin).
3.Connect Wires: Press w to route wires between terminal pins.
4.Set Attributes: Press q on transistors to set width ($W$) and length ($L$).
5.Generate Netlist: Click Netlist in the top-right toolbar or select Options $\rightarrow$ Generate Netlist.
6.Run Simulation: Click Simulate to pass the exported netlist directly into Ngspice.

### 1. Xschem
