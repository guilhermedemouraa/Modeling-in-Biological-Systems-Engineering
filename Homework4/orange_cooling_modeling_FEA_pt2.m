% Modeling and Analysis of Physical and Biological Processes
% Student: Guilherme De Moura Araujo

clear all; clc;
%%
T_Harvest = 26.7; % Ambiente Temperature at Harvest, (oC)
T_Storage = 3; % Storage temperature (oC)
rho = 998; % Density of orange (km/m3)
cp = 3900; % Specific heat of orange (J/kg/oC)
%a = 0.036; % Radius of fruit (m)
a0 = 4.71;
a1 = 3.55;
%A = a0 + a1*T; % Heat production due to respiration (J/(s-m3))
k = 0.47; % Thermal Conductivity of the fruit (W/m/oC)
h = 6; % Convective heat transfer coefficient at the fruit surface (W/m2/oC)
w = sqrt(a1/k);
he = h-k/0.036;
beta = (a0+a1*T_Harvest)/k;
u1 = 0.0;%13;
Q = beta*0.036;
G = -w^2;
L = 0.036/4;

a = 1/L+G*L/3;
b = 1/L+G*L/6;

K = [2*a -b 0 0;
    -b 2*a -b 0;
    0 -b 2*a -b;
    0 0 -b a+he/k];

for i=0:4
    R(i+1) = i*0.036/4;
end
M = [1 4 1 0; 1 4 1 0; 0 1 4 1; 0 0 1 2];
%S = beta*L/6*(M*[R(2);R(3);R(4);R(5)]);
S = beta*L*[(R(1)+R(3))/6+2*R(2)/3+b*u1;(R(2)+R(4))/6+2/3*R(3);(R(3)+R(5))/6+2/3*R(4);R(4)/6+R(5)/3];
U = inv(K)*S;
R2 = R(2:end)';
UR = U./R2;
T = UR+T_Harvest;
%%
% alpha = -(a0 + a1*T_Harvest)/a1;
% A = -(alpha*(k+he*0.036))/(he*sin(w*0.036)+k*w*cos(w*0.036));
% T(1) = A*w-((a0+a1*T_Harvest)/a1)+T_Harvest;
% for i=2:5
%     T(i) = UR(i-1)+T_Harvest;
% end
plot(R(2:end),T,'ro');
% T2(1) = A*w-((a0+a1*T_Harvest)/a1)+T_Harvest;
% for i=1:4
%     T2(i+1) = T(i);
% end
%%
R(1) = 0;
for i=1:4
    R(i+1) = i*0.036/4;
    T(i+1) = U(i)/R(i+1)+T_Harvest;
end

%%
plot(0:0.036/4:0.036,T,'ro');
hold on;
%plot(0:.036/36:0.036,T_H,'b--');
