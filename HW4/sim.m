clc;clear;close all;

V_r = 20;
R1 = 6750;
R2 = 67000;
R3 = 13000;
V_m_rec = zeros(100, 1);

for T = 0:100
    R_T = 2000*(1+0.075*(T-25));
    V_m = V_r*(R2*R_T-R1*R3)/((R1+R_T)*(R2+R3));
    if V_m > 0
        V_m_rec(T, :) = V_m;
    end
end

figure;
plot(1:100, V_m_rec);
title('temperature-Vm plot');  % Set the main title
xlabel('T (degC)');  % Label for the x-axis
ylabel('V_m (V)');  % Label for the y-axis
grid on;
legend('V_m');