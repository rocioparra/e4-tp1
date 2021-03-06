clearvars;
close all;

data = csvread('e4_tp1_ej3_c.csv', 1, 0);
t_3 = data(:,1);
vd_3 = data(:,2);
vg_3 = data(:,3);
id_3 = data(:,4);

data = csvread('e4_tp1_ej1_c.csv', 1, 0);
t_1 = data(:,1);
vd_1 = data(:,2);
vg_1 = data(:,3);
id_1 = data(:,4);

fs = 50e3;
Ts = 1/fs;
Tf = 3*Ts;

ax1 = subplot(3,1,1);
plot(t_1, vg_1);
hold on;
plot(t_3, vg_3);
xlim([0, Tf]);
ylim([-1, 11]);
xticklabels({});
formataxes('', '', '$v_G(t)$ (V)', 'Llave sola', 'Llave en buck');

ax2 = subplot(3,1,2);
plot(t_1, vd_1);
hold on;
plot(t_3, vd_3);
ylim([-2, 57]);
xlim([0, Tf]);
xticklabels({});
formataxes('', '', '$v_D(t)$ (V)');

ax3 = subplot(3,1,3);
plot(t_1, id_1);
hold on;
plot(t_3, id_3);
xlim([0, Tf]);
ylim([-1, 7]);
formataxes('', 'Tiempo (s)', '$i_D(t)$ (A)');

