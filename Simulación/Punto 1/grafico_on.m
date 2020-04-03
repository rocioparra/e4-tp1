function [Vg, Id, Vds, Ig] = grafico_on(t)
    delays;
    %VG
    if t < 0
        Vg = 0;
    elseif t < t1
        Vg = V1*(1-exp(-t/tau_1));
    elseif t < t1+tfv
        Vg = Vg_id_on;
    else
        tp = t-(t1+tfv);
        Vg = Vg_id_on*exp(-tp/tau_2)+V1*(1-exp(-tp/tau_2));
    end
    %ID
    if t < tdon
        Id = 0;
    elseif t < t1
        tp = t-tdon;
        alpha = tp/tri;
        Id = alpha*Io_on;
    else
        Id = Io_on;
    end
    %Vds
    if t < t1
        Vds = Vd;
    elseif t < t1+tfv
        tp = t - t1;
        alpha = tp/tfv;
        Vds = Io_on*Rds_on*alpha+(1-alpha)*Vd;
    else
        Vds = Io_on*Rds_on;
    end
    Ig = (V1-Vg)/Rg;
end