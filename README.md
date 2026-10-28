# CMOS Inverter Design and Physical Verification — SKY130A

This repository documents my hands-on work on a CMOS inverter using the **SKY130A process design kit (PDK)**. The work is being carried out in a Linux virtual machine running on a Mac using UTM.

## Project Overview

A CMOS inverter is a basic digital circuit that produces the logical complement of its input. This project explores the schematic and layout stages using open-source VLSI tools.

## Tools and Environment

- **Xschem** — schematic capture and testbench setup
- **Ngspice** — circuit simulation (attempted; troubleshooting remains)
- **Magic VLSI** — layout editing and design-rule checking
- **SKY130A PDK** — device models and layout technology
- **Linux virtual machine (UTM)** — development environment

## Work Completed So Far

- Opened and worked with the inverter schematic and its Xschem testbench.
- Set up the SKY130A PDK paths for the Xschem environment.
- Created/viewed a CMOS inverter layout in Magic.
- Observed a `DRC=0` indicator in the displayed Magic window.
- Attempted Ngspice simulation; the current setup reports netlist/model-parameter errors, so a successful waveform result is **not yet available**.

## Screenshots

### 1. Xschem 



### Opening Xschem

Xschem was launched in the Linux virtual machine using the SKY130A PDK configuration. The environment was configured to access the required technology libraries and schematic symbols.
<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/acaa2c7d-eeae-4e9d-a837-3fb6b0082041" />

### Designing the CMOS Inverter Schematic

The CMOS inverter schematic was created in Xschem using the SKY130A technology. The design represents the basic inverter structure, which produces an output complementary to the input signal.
<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/a3057484-be0f-4c8d-93f6-09908d89da9a" />

### Generating the Inverter Symbol

After creating the inverter schematic, a reusable symbol was generated for use in higher-level circuit designs. This symbol provides a convenient interface for connecting the inverter to external input, output, power, and ground signals.
<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/2038d0c6-858f-48ab-9261-d8822cfeff34" />


### Creating the Testbench

A separate Xschem testbench was prepared to evaluate the inverter circuit. It includes the inverter symbol, an input pulse source, a supply voltage source, and simulation control directives.

The testbench was configured for transient analysis to observe the relationship between the input and output signals. Simulation troubleshooting is still in progress, and verified waveform results will be added after the setup issues are resolved.


 

<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/ccf881fc-a766-4f2f-b55c-2626088cdd24" />
### ngspice

<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/986c8074-969e-4e0c-bc35-7d964c9e4d65" />


### simulation
<img width="2560" height="1600" alt="image" src="https://github.com/user-attachments/assets/4765a203-6546-47a9-a47b-4673ad922c3e" />






###  Opening Magic VLSI

Magic VLSI was opened in the Linux virtual machine with the SKY130A technology configuration. The tool was used to inspect and work with the physical layout of the CMOS inverter.

### CMOS Inverter Layout

The CMOS inverter layout was created and viewed using Magic VLSI. The layout includes the PMOS and NMOS transistor regions, interconnections, and the labelled terminals required for circuit connectivity.

The input (`IN`) and output (`OUT`) terminals are labelled to represent the signal connections. The power (`VDD`) and ground (`VSS`) terminals provide the supply connections for the inverter.

###  Design Rule Check (DRC)

The Magic VLSI window displayed `DRC=0` in the captured screenshot. This indicates the status shown in the layout window at the time of capture. The complete DRC verification procedure and its final results will be documented after validation.








## Next Steps

- Perform Netgen LVS and add the results after completing the comparison.


