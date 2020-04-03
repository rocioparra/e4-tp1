function [Vg, Ig, Id, Vds] = getplot(t)
    %Definicion de parámetros
    Rg = 1e3;
    toff = 1/50e3*05;
    t1 = 20.1600e-9;
    t2 = t1+3.0238e-9;
    t3 = 0;
    t4 = t2+66.6667e-9;
    ta = 1;
    tb = 1;
    tc = 1;
    tau_1 = 1;
    tau_2 = 1;
    Vgg = 1;
    Vg_io_on = 1;
    Vg_io_off = 1;
    I0 = 1;
    I1 = 1;
    Vd = 1;
    Vdson = 1;
    if t < toff
        %Cálculo VG
        if t < 0
            Vg = 0;
        elseif t < t2
            Vg = Vgg*(1-exp(-t/tau_1));
        elseif t < t4
            Vg = Vg_io_on;
        else
            Vg = Vg_io_on*exp(-t/tau_2)+Vgg*(1-exp(-t/tau_2));
        end
        %Cálculo Id
        if t < t1
            Id = 0;
        elseif t < t2
            Id = I0*(t-t1)/(t2-t1);
        else
            Id = I0;
        end
        %Cálculo Vds
        if t < t2
            Vds = Vd;
        elseif t < t4
            alpha = (t-t3)/(t4-t3);
            Vds = Vd*alpha+Vdson*(1-alpha);
        else
            Vds = Vdson;
        end
    else
        t = t - toff;
        %Cálculo VG
        if t < ta
            Vg = Vgg*exp(-t/tau_2);
        elseif t < tb
            Vg = Vg_io_off;
        else
            tpp = t-tb;
            Vg = Vg_io_off*exp(-tpp/tau_1);
        end
        %Cálculo Id
        if t < tb
            Id = I1;
        elseif t < tc
            alpha = (t-tb)/(tc-tb);
            Id = I1*alpha;
        else
            Id = 0;
        end
        %Cálculo Vds
        if t < ta
            Vds = Vdson;
        elseif t < tb
            alpha = (t-ta)/(tb-ta);
            Vds = Vdson*alpha+Vd*(1-alpha);
        else
            Vds = Vdson;
        end
    end
    Ig = (Vgg-Vg)/Rg;
end