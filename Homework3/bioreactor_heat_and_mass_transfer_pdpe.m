%% Biological and Agricultural Engineering Department
% Modeling and Analysis of Physical and Biological Processes: EBS 270
% Homework No. 3 - Probelm 4 - Due Date: May 28, 2019
% Student: Guilherme De Moura Araujo
%% Problem 4
clear all; clc;
global A B Ea1 Ea2 R a b k1 k2 h rho cp Tinf
A = 2.694 * 10^11;
B = 1.3 * 10^47;
Ea1 = 70225;
Ea2 = 283356;
R = 8.31447;
a = 0.53;
b = 0.58*10^-5;
k1 = 0;
k2 = 18;
h = 10.14;
rho = 0.7;
cp = 4.19;
Tinf = 35;
m = 1;
x = linspace(0,0.06,30);
t = linspace(0,120,11);
sol = pdepe(m, @pdefun, @pdeic, @pdebc, x, t);
u1 = sol(:,:,1);
u2 = sol(:,:,2);

%% Plot Results
figure
surf(x, t, u1);
title('Concentration of Microorganism');
xlabel('Radius [m]');
ylabel('Time [h]');
 
figure
surf(x, t, u2);
title('Temperature [oC]');
xlabel('Radius [m]');
ylabel('Time [h]');

%%
sol2(:,:,2) = sol(:,:,2)+273;
t0 = sol2(1,:,2);
t1 = sol2(3,:,2);
t2 = sol2(5,:,2);
t3 = sol2(7,:,2);
t4 = sol2(9,:,2);
t5 = sol2(11,:,2);
plot(x,t0,'b',x,t1,'g',x,t2,'r',x,t3,'c',x,t4,'m',x,t5,'y');
legend('0s','1 day','2 days','3 days','4 days','5 days');
xlabel('Radius [cm]');
ylabel('Temperature [oC]');
grid
%% Comments:
% We can see that the microorganisms grow until a certain point and then
% mantain its concentration constant, where the growth of new microbes
% offsets the death of old ones. Therefore, we conclude that upon a certain
% point, the concentration of microorganisms stays constant as time goes.
% It makes sense if we look at the system equation, in which we have a term
% umax*X*[1-X/Xmax], suggesting that after X = Xmax there's no change in
% the concentration.
% The temperature has somehow a similar behavior. As the original
% concentration of microorganisms goes up the heat generation also goes up,
% which increases the temperature. As the concentration of microorganisms
% stabilizes the temperature goes down and remain constant, mostly due to
% the convective heat loss between the bioreactor surface and the water
% jacket (which acts as a cooling jacket everytime the bioreactor
% temperatures is above 35 oC). The steady state temperature is maintained
% at 35 oC, which is the temperature of the water jacket.

%% Functions

% pdepe
function[c, f, s] = pdefun(x, t, u, DuDx)
global A B Ea1 Ea2 R a b k2 rho cp
c = [1; rho*cp];
f = [0; k2].*DuDx;
exp1 = exp(-Ea1/(R * (u(2) + 273)));
exp2 = exp(-Ea2/(R * (u(2) + 273)));
umax = A * exp1/(1 + B * exp2);
xmax = (-127.08 + 7.95*u(2) - 0.016*u(2)^2 - 4.03*10^(-3)*u(2)^3 + 4.73*10^(-5)*u(2)^4)/100;
DxDt = umax*u(1)*(1-u(1)/xmax);
mCO2 = 674000/(6*44)*(a*DxDt+b*u(1));
s = [DxDt; mCO2];
end
% IC
function u0 = pdeic(x)
u0 = [8.74*10^-4; 35];
end
% BC
function [p1, q1, pr, qr] = pdebc(x1, u1, xr, ur, t)
global h Tinf
p1 = [0;0];
q1 = [1;1];
pr = [0;h*(ur(2)-Tinf)];
qr = [1;1];
end
