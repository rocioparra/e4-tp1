function [Vg, Id, Vds, Ig] = grafico_off(t)
    delays;
    %VG
    if t < 0
        Vg = V1;
    elseif t < tdof
        Vg = V1*exp(-t/tau_2);
    elseif t < tdof+trv
        Vg = Vg_id_off;
    else
        tp = t-tdof-trv;
        Vg = Vg_id_off*exp(-tp/tau_1);
    end
    %ID
    if t < tdof+trv
        Id = Io_off;
    elseif t < tdof+trv+tfi
        tp = t-(tdof+trv);
        alpha = tp/tfi;
        Id = (1-alpha)*Io_off;
    else
        Id = 0;
    end
    %Vds
    if t < tdof
        Vds = Rds_on*Io_off;
    elseif t < tdof+trv
        tp = t - tdof;
        alpha = tp/trv;
        Vds = Vd*alpha+(1-alpha)*Rds_on*Io_off;
    else
        Vds = Vd;
    end
    Ig = (V1-Vg)/Rg;
end