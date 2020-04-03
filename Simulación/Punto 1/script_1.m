format long
data_imported = readmatrix("punto1.xlsx","UseExcel",true);
%%
data = data_imported;
t_start = 9.5e-6;
t_end = 21.5e-6;
t_delta = 0.5e-6;
time = data(:,1);
i = find(time >= t_start,1);
j = find(time >= t_end,1);
data = data(i:j,:);
time = data(:,1);
time = time - time(1);
time = time - t_delta;
Vd = data(:,2); 
Vg = data(:,3);
Vc = data(:,4);
Ig = data(:,5); 
Id = data(:,6);

on_t_start = -0.5e-6;
on_t_end = 1e-6;
i = find(time >= on_t_start,1);
j = find(time >= on_t_end,1);
data_on = data(i:j,:);
time_on = time(i:j);
Vd_on = data_on(:,2);
Vg_on = data_on(:,3);
Vc_on = data_on(:,4);
Ig_on = data_on(:,5);
Id_on = data_on(:,6);

off_t_start = 9.5e-6;
off_t_end = 11e-6;
i = find(time >= off_t_start,1);
j = find(time >= off_t_end,1);
data_off = data(i:j,:);
time_off = time(i:j);
Vd_off = data_off(:,2);
Vg_off = data_off(:,3);
Vc_off = data_off(:,4);
Ig_off = data_off(:,5);
Id_off = data_off(:,6);

%% Prepareplots
figure(1)
subplot(4,1,1);
yyaxis left
plot(time*1e6,Vg);
xlim([min(time),max(time)]*1e6);
ylim([min(Vg*0.9),max(Vg*1.1)]);
formataxes("","time (탎)","$V_g$ (V)");
yyaxis right
plot(time*1e6,Id);
ylim([min(Idrain*0.9),max(Idrain*1.1)]);
formataxes("","time (탎)","$I_d$ (A)");
subplot(4,2,5);
yyaxis left
plot(time_on*1e6,Vg_on);
xlim([min(time_on),max(time_on)]*1e6);
ylim([min(Vg*0.9),max(Vg*1.1)]);
formataxes("","time (탎)","$V_g$ (V)");
yyaxis right
plot(time_on*1e6,Id_on);
ylim([min(Id*0.9),max(Id*1.1)]);
formataxes("","time (탎)","$I_d$ (A)");
subplot(4,2,6);
yyaxis left
plot(time_off*1e6,Vg_off);
xlim([min(time_off),max(time_off)]*1e6);
ylim([min(Vg*0.9),max(Vg*1.1)]);
formataxes("","time (탎)","$V_g$ (V)");
yyaxis right
plot(time_off*1e6,Id_off);
ylim([min(Id*0.9),max(Id*1.1)]);
formataxes("","time (탎)","$I_d$ (A)");

%% Prepareplots
subplot(4,1,2);
plot(time*1e6,Vd);
xlim([min(time),max(time)]*1e6);
ylim([min(Vd*0.9),max(Vd*1.1)]);
formataxes("","time (탎)","$V_d$ (V)");
subplot(4,2,7);
plot(time_on*1e6,Vd_on);
xlim([min(time_on),max(time_on)]*1e6);
ylim([min(Vd*0.9),max(Vd*1.1)]);
formataxes("","time (탎)","$V_d$ (V)");
subplot(4,2,8);
plot(time_off*1e6,Vd_off);
xlim([min(time_off),max(time_off)]*1e6);
ylim([min(Vd*0.9),max(Vd*1.1)]);
formataxes("","time (탎)","$V_d$ (V)");