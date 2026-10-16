v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -50 -20 -30 -20 {lab=vin}
N -50 -20 -50 60 {lab=vin}
N -50 60 -30 60 {lab=vin}
N -60 -0 -50 -0 {lab=vin}
N 10 10 10 30 {lab=vout}
N 10 20 60 20 {lab=vout}
N 10 90 10 120 {lab=0}
N 10 -70 10 -50 {lab=VDD}
N 10 60 50 60 {lab=0}
N 50 60 50 100 {lab=0}
N 10 100 50 100 {lab=0}
N 10 -20 60 -20 {lab=VDD}
N 60 -60 60 -20 {lab=VDD}
N 10 -60 60 -60 {lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} -10 -20 0 0 {name=M1
W=1
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -10 60 0 0 {name=M2
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {gnd.sym} 10 120 0 0 {name=l1 lab=0}
C {ipin.sym} -60 0 0 0 {name=p1 lab=vin}
C {opin.sym} 60 20 0 0 {name=p2 lab=vout
}
C {code.sym} -200 -100 0 0 {name=s1 only_toplevel=false value="
V_VDD VDD 0 1.8
V_VIN vin 0 0
.control
 dc V_VIN 0 1.8 0.01
 plot v(vout) v(vin)
.endc"}
C {vdd.sym} 10 -70 0 0 {name=l2 lab=VDD}
C {code_shown.sym} 100 -60 0 0 {name=s2 only_toplevel=false value=.lib  "/foss/pdks/ciel/sky130/versions/1689ac3f2dc763876eaf967227c7dfe831b031ae/sky130A/libs.tech/ngspice/sky130.lib.spice"  tt}
