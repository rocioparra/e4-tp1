function [Ion,Ioff]=Corrientes(V2,R2,T1,T2,Trl)
Ion=(V2/R2)*( (1-exp(-T1/Trl))/(exp(T2/Trl)-exp(-T1/Trl)) );
Ioff=(V2/R2)*(exp(T2/Trl))*( (1-exp(-T1/Trl))/(exp(T2/Trl)-exp(-T1/Trl)));
end