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
t3 = (Io-delta_iL/2)/didt;
t4 = 34e-9;
trr = 50e-9;
t5 = trr -t4;
Irr = didt *t4;


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
t_spice = data(:,1);
vl_spice = data(:,2);
id_spice = data(:,3);
il_spice = data(:,4);

ax1 = subplot(4,1,1);
plot(t, disparo);
ylim([-0.5, 1.5]);
xlim([0, Tf]);
xticklabels({});
formataxes('', '', 'Nivel l\''ogico');

ax2 = subplot(4,1,2);
plot(t, vL);
hold on;
plot(t_spice, vl_spice);
xlim([0, Tf]);
xticklabels({});
formataxes('', '', '$v_L(t)$ (V)', 'C\''alculo', 'Simulaci\''on');

ax3 = subplot(4,1,3);
plot(t, iL);
hold on;
plot(t_spice, il_spice);
xlim([0, Tf]);
xticklabels({});
formataxes('', '', '$i_L(t)$ (A)', 'C\''alculo', 'Simulaci\''on');


ax4 = subplot(4,1,4);
plot(t, id);
hold on;
plot(t_spice, id_spice);
xlim([0, Tf]);
ylim([-2, 0.8]);
formataxes('', 'Tiempo (s)', '$i_D(t)$ (A)', 'C\''alculo', 'Simulaci\''on');


