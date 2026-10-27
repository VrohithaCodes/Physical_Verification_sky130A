# Open-Source VLSI EDA Toolchain Documentation

This repository contains lab documentation, schematics, simulations, and layouts built using the open-source Electronic Design Automation (EDA) toolchain.

It walks through the complete flow of a small CMOS design (for example, an inverter) using the SkyWater 130nm (sky130) PDK: schematic capture, simulation, layout, design rule checking, parasitic extraction, layout versus schematic (LVS) verification, and post-layout simulation.

## Index
* [Chapter 0 - Software Toolchain Overview](#chapter-0---software-toolchain-overview)
* [Chapter 1 - Getting the Tools](#chapter-1---getting-the-tools)
* [Chapter 2 - Xschem](#chapter-2---xschem)
* [Chapter 3 - Magic](#chapter-3---magic)
* [Chapter 4 - Netgen](#chapter-4---netgen)
* [Chapter 5 - Verification Workflow (DRC, EXT, LVS, Post-Layout Simulation)](#chapter-5---verification-workflow)

## Chapter 0 - Software Toolchain Overview

![toolchain](https://github.com/user-attachments/assets/df505509-2d60-4e02-9eff-3f33f354e7ea)

| Tool | Purpose | Latest Version | Command |
|------|---------|----------------|---------|
| **Xschem** | Hierarchical schematic capture; generates SPICE netlists for simulation | v3.4.8 | `xschem` |
| **Ngspice** | Mixed-level, mixed-signal circuit simulator based on Berkeley SPICE 3f5; performs DC, AC and transient analyses | Ngspice-47 | `ngspice schematic.spice` |
| **Magic** | Interactive VLSI layout editor with built-in DRC and parasitic extraction | Magic-8.3 | `magic -T sky130A` |
| **Netgen** | Netlist comparison tool used for LVS verification | Compatible with Magic / Open_PDKs (v1.5+) | `netgen -batch lvs "schematic.spice cell_name" "layout.spice cell_name"` |

### Basic Workflow: From Schematic to Simulation
1. **Open Xschem:** Run `xschem` in your working folder.
2. **Place Components:** Press `Shift + i` to add transistors (e.g., `sky130_fd_pr__nfet_01v8` and `sky130_fd_pr__pfet_01v8`), power sources (`vdd`), ground (`gnd`), and input/output pins (`ipin`, `opin`).
3. **Connect Wires:** Press `w` to route wires between terminal pins.
4. **Set Attributes:** Press `q` on transistors to set width ($W$) and length ($L$).
5. **Generate Netlist:** Click **Netlist** in the top-right toolbar or select **Options → Generate Netlist**.
6. **Run Simulation:** Click **Simulate** to pass the exported netlist directly into Ngspice.

## Chapter 1 - Getting the Tools

To use the open-source SkyWater 130nm PDK and follow this flow, the following tools need to be installed:
- magic
- netgen
- xschem
- ngspice
- open_pdks

*Note: open_pdks has to be installed last so it can correctly associate the xschem and magic directories.*
*Note: if the configure step fails during any process, it is most likely due to missing additional packages, which need to be installed (preferably from source) to complete the installation.*

### Magic
```
$ git clone git://opencircuitdesign.com/magic
$ cd magic
$ ./configure
$ make
$ sudo make install
```
More info: [http://opencircuitdesign.com/magic/index.html](http://opencircuitdesign.com/magic/index.html)

### Netgen
```
$ git clone git://opencircuitdesign.com/netgen
$ cd netgen
$ ./configure
$ make
$ sudo make install
```
More info: [http://opencircuitdesign.com/netgen/index.html](http://opencircuitdesign.com/netgen/index.html)

### Xschem
```
$ git clone https://github.com/StefanSchippers/xschem.git xschem_git
$ cd xschem_git
$ ./configure
$ make
$ sudo make install
```
More info: [http://repo.hu/projects/xschem/index.html](http://repo.hu/projects/xschem/index.html)

### Ngspice
After downloading the tarball from [https://sourceforge.net/projects/ngspice/files/](https://sourceforge.net/projects/ngspice/files/), unpack and build it (replace the version number with the one you downloaded):
```
$ tar -zxvf ngspice-47.tar.gz
$ cd ngspice-47
$ mkdir release
$ cd release
$ ../configure --with-x --with-readline=yes --disable-debug
$ make
$ sudo make install
```
To view simulation graphs, `xterm` is required:
```
$ sudo apt-get update
$ sudo apt-get install xterm
```
More info: [https://ngspice.sourceforge.io/index.html](https://ngspice.sourceforge.io/index.html)

### open_pdks
Open_PDKs supports the Google/SkyWater sky130 process and sets up an environment for using it with open-source EDA tools such as Magic, Netgen, Xschem, OpenLane and KLayout.
```
$ git clone git://opencircuitdesign.com/open_pdks
$ cd open_pdks
$ ./configure --enable-sky130-pdk
$ make
$ sudo make install
```

## Chapter 2 - Xschem

![xschem](https://github.com/user-attachments/assets/56d07b9d-0b5b-42cf-b4ea-c62e163903b9)

Xschem is an open-source, hierarchical schematic capture tool designed for VLSI and analog/digital circuit design. It acts as the graphical front-end where you draw circuits (such as CMOS inverters, basic logic gates, or operational amplifiers) and export them as SPICE netlists for simulation.

### Core Functions & Features
- **Hierarchical Schematic Capture:** Create reusable sub-circuits (symbols) and instantiate them inside larger designs.
- **SPICE Netlist Generation:** Automatically translates symbols, pins and wires into SPICE netlists (`.spice` or `.cir`) compatible with simulators like Ngspice.
- **PDK Integration:** Integrates with open-source PDKs such as SkyWater 130nm (sky130) and GlobalFoundries 180nm (gf180mcu).
- **Symbol Creation:** Custom symbols (`.sym` files) with defined pins, properties and parameters.

### Launching Xschem
Standard launch with default global configuration:
```
$ xschem
```
Open an existing schematic:
```
$ xschem inverter.sch
```
Launch with the sky130 configuration:
```
$ xschem -rcfile $PDK_ROOT/sky130A/libs.tech/xschem/xschemrc inverter.sch

##Generating the symbol for xschem
<img width="1280" height="800" alt="symbol" src="https://github.com/user-attachments/assets/f040f7a3-b6bb-4289-8c59-41fdc924ad02" />

** After generating symbol simulating the testbench cricuit
<img width="1280" height="800" alt="testbench" src="https://github.com/user-attachments/assets/8239bba0-9fc4-40e4-97df-8216ad1251fa" />

## Generating spice for the xschem
<img width="1280" height="800" alt="spice" src="https://github.com/user-attachments/assets/d2d36a9c-025a-4ea7-9c89-c64b88908781" />
After generating the spice we move to magic part
```

## Chapter 3 - Magic

<img width="2880" height="1574" alt="image" src="https://github.com/user-attachments/assets/90e819de-1e6a-47c5-bfe9-c38f3d03b70d" />

Magic is an open-source interactive layout editor for VLSI design. It handles physical mask geometry creation, letting designers translate schematics into layouts (polygons representing metal, polysilicon, diffusion and contacts) that can be sent to a foundry for fabrication.

### Core Functions & Features
- **Interactive Layout Editing:** Draw, stretch, paint and modify geometric shapes representing physical layout layers.
- **Built-In Design Rule Checking (DRC):** Incremental DRC runs in real time as you draw. Violations of rules such as minimum width or spacing are highlighted immediately with diagnostic feedback.
- **Parasitic Extraction (EXT):** Extracts parasitic resistances and capacitances from the layout into SPICE or SPEF netlists for post-layout simulation.
- **CIF/GDSII Export:** Generates foundry-ready files (`.gds` or `.cif`) required for tape-out.
- **PDK Support:** Fully integrated with open-source PDKs such as sky130 through technology files (`sky130A.tech`).

### Launching Magic
Default technology setup:
```
$ magic
```
With the sky130 technology file:
```
$ magic -T sky130A
```
Open an existing layout:
```
$ magic -T sky130A inverter.mag
```

### Basic Layout Workflow
1. **Launch Magic** with the sky130 technology file (`magic -T sky130A`).
2. **Paint Layers:** Select the appropriate layers (`ndiff`, `pdiff`, `poly`, `metal1`, ...) and paint the transistors and routing wires on the interactive grid.

## Chapter 4 - Netgen

Netgen compares two netlists to ensure they match in terms of devices, sizing and node connectivity before the design is sent for fabrication.

### Core Functions & Features
- **Layout Versus Schematic (LVS):** Compares schematic and layout netlists to catch missing connections, short circuits or incorrect transistor sizing.
- **Hierarchical Comparison:** Compares flattened or deeply nested hierarchical circuits efficiently.
- **Device Property Verification:** Checks parameters such as transistor width ($W$) and length ($L$) between schematic and layout.
- **Blackboxing:** Masks out complex pre-existing cells (standard cell libraries, pad frames) during comparison.

### Launching Netgen
Interactive mode (Tcl shell):
```
$ netgen
```
Batch mode LVS (most common):
```
$ netgen -batch lvs "schematic_netlist.spice cell_name" "layout_netlist.spice cell_name" setup_file.tcl
```

### Basic LVS Workflow: CMOS Inverter Example
1. **Generate the schematic netlist:** Export from Xschem (e.g., `inverter.spice`).
2. **Extract the layout netlist:** Run the extraction commands inside Magic (e.g., `inverter_layout.spice`).
3. **Run Netgen LVS** using the sky130 setup file:
   ```
   $ netgen -batch lvs "inverter.spice inverter" "inverter_layout.spice inverter" $PDK_ROOT/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs_result.log
   ```
4. **Check the output:** Open the log file or terminal summary. If everything is correct you will see:
   ```
   Result: Circuits match uniquely.
   ```

## Chapter 5 - Verification Workflow

### 1. Design Rule Checking (DRC) — Magic
Check that the layout complies with the foundry's manufacturing constraints (e.g., SkyWater 130nm rules), ensuring features are not too close, too thin or too wide.

**Command:**
```
% drc check
```
**Verify success:** Run `drc why` or check the Magic console to confirm that there are **0 DRC errors**.

### 2. Layout Parasitic Extraction (EXT) — Magic
Extract the physical geometry into a netlist containing device connections and the parasitic capacitances/resistances of the wires.

**Commands:**
```
% extract all
% ext2spice lvs
% ext2spice
```
**Verify success:** The layout SPICE netlist (e.g., `inverter.spice` or `inverter_layout.spice`) appears in your working directory.

### 3. Layout Versus Schematic (LVS) — Netgen
Compare the netlist extracted from the layout against the original Xschem schematic netlist to verify that transistors, pins and node connections match.

**Command:**
```
$ netgen -batch lvs "schematic.spice cell" "layout.spice cell" $PDK_ROOT/sky130A/libs.tech/netgen/sky130A_setup.tcl lvs.log
```
**Verify success:** `lvs.log` (or the terminal summary) ends with:
```
Result: Circuits match uniquely.
```

### 4. Post-Layout (Parasitic) Simulation — Ngspice
Simulate the extracted netlist (which now includes interconnect parasitics) to see how real-world resistance and capacitance affect propagation delay and switching speed.

**Command:**
```
$ ngspice inverter_layout.spice
```
**Verify success:** Plot the transient waveform and confirm the circuit still functions correctly and meets timing margins, with only a minor, acceptable increase in propagation delay compared with the pre-layout simulation.
