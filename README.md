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

### 1. Xschem inverter testbench

The testbench includes an input source, supply source, inverter symbol, and simulation directives.

![Xschem inverter testbench](images/xschem_testbench.png)

### 2. Xschem / simulation setup

Screenshot from the Xschem environment while setting up the project.

![Xschem setup](images/xschem_setup.png)

### 3. Magic CMOS inverter layout

The layout view shows the inverter layout with input, output, VDD, and VSS labels. The Magic window displays `DRC=0` in this screenshot; this records the displayed status at the time of capture and is not a substitute for documenting the full verification flow.

<img width="2880" height="1574" alt="image" src="https://github.com/user-attachments/assets/0486d3b2-05ca-4f46-b649-e1d404b20f3f" />


### 4. Ngspice troubleshooting

Ngspice was invoked, but the current attempt stopped with netlist/model-parameter errors. Simulation troubleshooting is still in progress.

![Ngspice error output](images/ngspice_error.png)

## Current Status

| Stage | Status |
|---|---|
| Xschem schematic / testbench | Worked on |
| SKY130A PDK setup | Configured for Xschem |
| Magic layout | Layout screenshot captured |
| Magic DRC | `DRC=0` displayed in the captured window |
| Ngspice simulation | Attempted; errors remain |
| Netgen LVS | Not completed yet |

## Next Steps

- Resolve the Ngspice netlist and SKY130A model-parameter issues.
- Run the transient simulation and capture the input/output waveforms.
- Run and document the complete Magic DRC check.
- Perform Netgen LVS and add the results after completing the comparison.

## Notes

This README reflects the current progress only. Results for simulation and LVS will be added after they have been successfully completed and verified.
