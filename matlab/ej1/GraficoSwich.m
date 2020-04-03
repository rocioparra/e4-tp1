function [Vgs,id,Vds,t]=GraficoSwich(td,t1,tfv,t2,trv,tfi,Vgg,T1,T_2,Vio1,Vio2,Vdsmax,Io)
t_1=0:1e-10:td;
t_2=td:1e-10:t1;
t_3=t1:1e-10:(t1+tfv);
t_4=(t1+tfv):1e-10:185.7216e-9;
t_5=185.7216e-9:1e-10:(185.7216e-9+t2);
t_6=(185.7216e-9+t2):1e-10:(185.7216e-9+t2+trv);
t_7=(185.7216e-9+t2+trv):1e-10:(185.7216e-9+t2+trv+tfi);
t_8=(185.7216e-9+t2+trv+tfi):1e-10:(185.7216e-9+t2+trv+tfi+194.7225e-9);
for i = 1:(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)+length(t_7)+length(t_8) )
    if i<=length(t_1)
        t(i)=t_1(i);
    elseif i<length(t_1)+length(t_2)
        t(i)=t_2(1+i-length(t_1));
    elseif i<length(t_1)+length(t_2)+length(t_3)
        t(i)=t_3(1+i- (length(t_1)+length(t_2)) );
    elseif i<length(t_1)+length(t_2)+length(t_3)+length(t_4)
        t(i)=t_4(1+i-(length(t_1)+length(t_2)+length(t_3)));
    elseif i<length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)
        t(i)=t_5(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)));
    elseif i<length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)
        t(i)=t_6(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)));
    elseif i<length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)+length(t_7)
        t(i)=t_7(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)));
    elseif i<length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)+length(t_7)+length(t_8)
        t(i)=t_8(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)+length(t_7)));
    end
end
for i = 1:(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)+length(t_7)+length(t_8)-1 )
    if t(i)<td
        Vgs(i)=Vgg*(1-exp(-t_1(i)/T1));
        id(i)=0;
        Vds(i)=Vdsmax;
    elseif t(i)<t1
        Vgs(i)=Vgg*(1-exp(-t_2(1+i-length(t_1))/T1));
        id(i)=(Io/(t1-td))*(t_2(1+i-length(t_1))-td);
        Vds(i)=Vdsmax;
    elseif t(i)<t1+tfv
        Vgs(i)=Vio1;
        id(i)=Io;
        Vds(i)=Vdsmax*exp(-t_3(1+i-(length(t_1)+length(t_2)))/(tfv+t1));
    elseif t(i)<185.7216e-9
        Vgs(i)=Vgg*(1-exp(-t_4(1+i-(length(t_1)+length(t_2)+length(t_3)))/T_2));
        id(i)=Io;
        Vds(i)=0;
    elseif t(i)<185.7216e-9+t2
        id(i)=Io;
        Vds(i)=0;
        Vgs(i)=Vgg*exp(-t_5(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)))/T_2);
    elseif t(i)<(185.7216e-9+t2+trv)
        id(i)=Io;
        Vds(i)=Vdsmax*exp(t_6(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)))/(185.7216e-9+t2+trv));
        Vgs(i)=Vio2;
    elseif t(i)<(185.7216e-9+t2+trv+tfi)
        Vds(i)=Vdsmax;
        id(i)=Io*(1-((t_7(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)))-(185.7216e-9+t2+trv))/tfi));
        Vgs(i)=Vgg*exp(-t_7(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)))/T1);
    elseif t(i)<(185.7216e-9+t2+trv+tfi+194.7225e-9)
        id(i)=0;
        Vds(i)=Vdsmax;
        Vgs(i)=Vgg*exp(-t_8(1+i-(length(t_1)+length(t_2)+length(t_3)+length(t_4)+length(t_5)+length(t_6)+length(t_7)))/T1);
    end
end
 