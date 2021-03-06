clearvars;
close all;

fs = 50e3;
Ts = 1/fs;

C = 39e-6;
rC = 0.23;

L = 220e-6;
rL = 0.65;

R = 10;
Vdf = 0.8;

Vi = 9;
Vo = 3.7;
Io = Vo/R;

D = ( Vo * (1+rL/R) + Vdf ) / (Vi + Vdf);
Ton = D*Ts;
Toff = Ts-Ton;

delta_iL = (Vdf+Vo*(1+rL/R))*Toff/L;

didt = 50e+6;
Irr = 1.7;
trr = 75e-9;

t3 = (Io-delta_iL/2)/didt;
t4 = Irr/didt;
t5 = trr-t4;


N = 50000;
Tf = 3*Ts;
t = linspace(0, Tf, N);
disparo = t;
iL = t;
vL = t;
id = t;

for i=1:N
    tt = mod(t(i), Ts);
    if tt <= Ton
        disparo(i) = 1;
        vL(i) = Vi - Vo - Io*rL;
        iL(i) = Io - delta_iL/2 + vL(i)/L*tt;
        if tt <= t3+t4
            id(i) = (Io-delta_iL/2)-didt*tt;
        elseif tt <= t3+trr
            tt = tt-t3-t4;
            id(i) = Irr * (tt/t5 -1);
        else
            id(i) = 0;
        end
    else
        disparo(i) = 0;
        vL(i) = -Vdf - Vo - Io*rL;
        iL(i) = Io + delta_iL/2 + vL(i)/L*(tt-Ton);
        id(i) = iL(i);
    end
end

data = csvread('e4_tp1_ej2.csv', 1, 0);
t_2 = data(:,1);
vl_2 = data(:,2);
id_2 = data(:,3);
il_2 = data(:,4);
for i=1:size(t_2, 1)
    vl_2(i) = vl_2(i) - il_2(i)*rL;
end
disparo_2 = -(disparo-1)*10;


data = csvread('e4_tp1_ej3.csv', 1, 0);
t_3 = data(:,1);
disparo_3 = data(:,3);
vl_3 = data(:,2);
id_3 = data(:,4);
il_3 = data(:,5);



ax1 = subplot(4,1,1);
plot(t, disparo_2);
hold on;
plot(t_3, disparo_3);
ylim([-1.5, 11.5]);
xlim([0, Tf]);
xticklabels({});
formataxes('', '', '$v_s(t)$ (V)', 'Llave ideal', 'Llave real');

ax2 = subplot(4,1,2);
plot(t_2, vl_2);
hold on;
plot(t_3, vl_3);
xlim([0, Tf]);
ylim([-7, 7]);
xticklabels({});
formataxes('', '', '$v_L(t)$ (V)');

ax3 = subplot(4,1,3);
% plot(t, iL);
% hold on;
plot(t_2, il_2);
hold on;
plot(t_3, il_3);
xlim([0, Tf]);
ylim([0.21, 0.55]);
xticklabels({});
formataxes('', '', '$i_L(t)$ (A)');


ax4 = subplot(4,1,4);
plot(t_2, id_2);
hold on;
plot(t_3, id_3);
xlim([0, Tf]);
ylim([-2, 0.8]);
formataxes('', 'Tiempo (s)', '$i_D(t)$ (A)');

% plot(t, id);
% hold on;
% plot(t_2, id_2);
% xlim([0, Tf]);
% ylim([-2, 0.8]);
% formataxes('', 'Tiempo (s)', '$i_D(t)$ (A)', 'C\''alculo', 'Simulaci\''on');
% 


