# Open-Source VLSI EDA Toolchain Documentation

This repository contains lab documentation, schematics, simulations, and layouts built using the open-source Electronic Design Automation (EDA) toolchain. 

## Software Toolchain Overview

### 1. Xschem
* **Definition:** A hierarchical schematic capture program that allows designers to draw electronic circuits (like CMOS gates) and generate SPICE netlists for simulation.
* **Latest Version:** v3.4.8
* **Launch Command:**
  ```bash
  xschem
  2. Ngspice
Definition: An open-source mixed-level, mixed-signal electronic circuit simulator based on Berkeley SPICE 3f5. It is used to perform DC, AC, and transient analyses on netlists.

Latest Version: Ngspice-47

Execution/Simulation Command: ngspice schematic.spice
3. Magic
Definition: An interactive layout editor used for Very Large Scale Integration (VLSI) layout design. It handles physical mask geometry creation and built-in Design Rule Checking (DRC).

Latest Version: Magic-8.3

Launch Command: magic -T sky130A
Netgen
Definition: A tool for comparing netlists, commonly used for Layout Versus Schematic (LVS) verification to ensure that the physical layout matches the original circuit schematic.

Latest Version: Compatible with Magic / Open_PDKs tool suite (v1.5+)
netgen -batch lvs "schematic.spice cell_name" "layout.spice cell_name"
Execution Command (LVS Batch mode): netgen -batch lvs "schematic.spice cell_name" "layout.spice cell_name"
