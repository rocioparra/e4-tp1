function [td,t1,tri,tfv,trv,tfi,t2]= VarTP1 (A,Vth,Vio1,Vio2,T1,T2,Q1,Q2,R1)
td=-T1*log(1-(Vth/A));
t1=-T1*log(1-(Vio1/A));
tri=t1-td;
tfv=(Q1*R1)/(A-Vio1);
trv=(Q2*R1)/(Vio2);
tfi=-T1*log(Vth/Vio2);
t2=-T2*log(Vio2/A);
end