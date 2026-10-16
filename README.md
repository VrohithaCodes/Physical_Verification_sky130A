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

<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/56d07b9d-0b5b-42cf-b4ea-c62e163903b9" />
Xschem: Comprehensive Overview & Usage Guide
Xschem is an open-source, hierarchical schematic capture tool designed for Very Large Scale Integration (VLSI) and analog/digital circuit design. It acts as the front-end graphical interface where you draw your circuit diagrams (such as CMOS inverters, basic logic gates, or complex operational amplifiers) and export them into SPICE netlists for simulation.

Core Functions & Features
Hierarchical Schematic Capture: Allows you to create reusable sub-circuits (symbols) and instantiate them inside larger designs.

SPICE Netlist Generation: Automatically translates graphical symbols, pins, and wire connections into SPICE netlists (.spice or .cir files) compatible with simulators like Ngspice.

PDK Integration: Seamlessly integrates with open-source Process Design Kits (PDKs) like the SkyWater 130nm (sky130) and GlobalFoundries 180nm (gf180mcu).

Symbol Creation: Enables custom symbol creation (.sym files) with defined pins, properties, and parameters.

Commands to Launch Xschem
1. Standard Launch Command
To launch Xschem with default global configurations from any terminal window:
xschem

xschem inverter.sch
xschem -rcfile $PDK_ROOT/sky130A/libs.tech/xschem/xschemrc inverter.sch

### 2. Magic
Magic is a legendary, open-source interactive layout editor used for Very Large Scale Integration (VLSI) design. It is designed to handle physical mask geometry creation, allowing circuit designers to translate schematic diagrams into physical layouts (polygons representing metal layers, polysilicon, diffusion, and contacts) that can be sent to a semiconductor foundry for chip fabrication.

Core Functions & Features
Interactive Layout Editing: Provides a graphical environment to draw, stretch, paint, and modify geometrical shapes representing physical layout layers.

Built-In Design Rule Checking (DRC): Magic performs incremental DRC in real time as you draw. If you violate manufacturing rules (such as wire spacing or minimum width), error highlights and diagnostic feedback appear immediately.

Parasitic Extraction (EXT): Extracts parasitic resistances and capacitances from the physical layout into standard netlist formats (SPICE or SPEF) to run post-layout simulations.

CIF/GDSII Export: Generates standard foundry-ready files (.gds or .cif) required for tape-out and fabrication.

PDK Support: Fully integrated with modern open-source PDKs like SkyWater 130nm (sky130) via technology files (sky130A.tech).

Commands to Launch Magic
1. Standard Launch Command
To launch Magic using the default technology setup: magic
magic -T sky130A
magic -T sky130A inverter.mag
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/0f3849ea-e4d5-4360-ac87-4f19945854af" />

Basic Layout & Verification Workflow
Launch Magic: Open Magic loaded with the Sky130 technology file (magic -T sky130A).

Paint Layers: Select the appropriate layout layers (such as ndiff, pdiff, poly, metal1) and paint the transistors and routing wires inside the interactive grid.

### 3 Netgen
Netgen compares these two netlists to ensure they match identically in terms of devices, sizing, and node connectivity before sending your design for fabrication.Core Functions & FeaturesLayout Versus Schematic (LVS): Compares schematic and layout netlists to catch missing connections, short circuits, or incorrect transistor sizing.Hierarchical Comparison: Can compare flattened or deeply nested hierarchical circuits efficiently.Device Property Verification: Checks parameters like transistor width ($W$) and length ($L$) to ensure they match between the schematic and layout.Blackboxing: Allows designers to mask out complex pre-existing cells (like standard cell libraries or pad frames) during comparison.Commands to Launch Netgen1. Interactive ModeTo launch Netgen into an interactive Tcl shell: netgen
2. Batch Mode LVS (Most Common)
Instead of opening the interactive GUI, designers typically run LVS directly from the terminal in batch mode to quickly check if circuits match: netgen -batch lvs "schematic_netlist.spice cell_name" "layout_netlist.spice cell_name" setup_file.tcl
**Basic LVS Workflow & Execution Example***
To verify a CMOS inverter layout against its schematic using Netgen:
1.Generate Schematic Netlist: Export your netlist from Xschem (e.g., inverter.spice).
2.Extract Layout Netlist: Run extraction commands inside Magic to generate the layout netlist (e.g., inverter_layout.spice).
3.Run Netgen LVS Command: Execute the batch comparison script in your terminal using the Sky130 setup file: 
netgen -batch lvs "inverter.spice inverter" "inverter_layout.spice inverter" $PDK_ROOT/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs_result.log
4.Check the Output: Open the log file or look at the terminal summary. If everything is correct, you will see:
Result: Circuits match uniquely.
