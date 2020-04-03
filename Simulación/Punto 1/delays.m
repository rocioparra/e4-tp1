%Valores
Io_off = 2.21;
Io_on = 1.12;
Vg_th = 4;
Vg_id_off = 4.8;
Vg_id_on = 4.5;
Cg1 = 650e-12;
Cg2 = 1120e-12;
DQ = 7e-9;
Rg = 100;
V1 = 15;
Rds_on = 0.077;
Vd = 50;

%Delays Conmutación
tau_1 = Rg*Cg1;
tau_2 = Rg*Cg2;
tdon = -tau_1*log(1-Vg_th/V1);
t1 = -tau_1*log(1-Vg_id_on/V1);
tri = (t1-tdon);
tfv = DQ*Rg/(V1-Vg_id_on);
tdof = -tau_2*log(Vg_id_off/V1);
trv = DQ*Rg/Vg_id_off;
tfi = -tau_1*log(Vg_th/Vg_id_off);

