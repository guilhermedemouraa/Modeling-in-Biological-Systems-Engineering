% Modeling and Analysis of Physical and Biological Processes
% Student: Guilherme De Moura Araujo
%% Start
clear all; clc;
%% Initialization of variables
T_Harvest = 26.7; % Ambiente Temperature at Harvest, (oC)
T_Storage = 3; % Storage temperature (oC)
rho = 998; % Density of orange (km/m3)
cp = 3900; % Specific heat of orange (J/kg/oC)
R = 0.036; % Radius of fruit (m) 
a0 = 4.71;
a1 = 3.55;
%A = a0 + a1*T; % Heat production due to respiration (J/(s-m3))
k = 0.47; % Thermal Conductivity of the fruit (W/m/oC)
h = 6; % Convective heat transfer coefficient at the fruit surface (W/m2/oC)
w = sqrt(a1/k);
he = h-k/0.036;
beta = (a0+a1*T_Harvest)/k;
u1 = 0.0;
Q = beta*0.036;
G = -w^2;
%% Analytical Solution from Homework1
% Storage conditions
dr = 0.001; %Random value adopted by student
T_Inf = T_Storage;
alpha = -(a0 + a1*T_Inf)/a1;
A = (-alpha*(k+he*R))/(he*sin(w*R)+k*w*cos(w*R));
j = 1;
TAnalytic = zeros(1,length(0:dr:R));
u = zeros(1,length(0:dr:R));
for r=0:dr:R
    if r == 0
      TAnalytic(j) = A*w-((a0+a1*T_Inf)/a1)+T_Inf;
    else
    u(j) = A*sin(w*r)+alpha*r;
    TAnalytic(j) = u(j)/r+T_Inf;
    end
    j = j+1;
end
TAnalytic = TAnalytic';
%% Finite Differences from Homework3
N = 37; % Number of nodes
dr = R/(N-1); % Delta r -> Same used for analytical solution
alpha = k/(dr*dr); % Constant
beta = a1-2*alpha;

A = zeros(N,N);
for i=1:N
    for j=1:N
        if i>=2
            if i==j
                A(i,j) = beta;
                A(i,j-1) = (alpha-alpha/(i-1));
                if i<N
                A(i,j+1) = (alpha+alpha/(i-1));
                end
            end
        end
    end
end

A(1,1) = a1-6*alpha;
A(1,2) = 6*alpha;
A(N,N-1) = 2*alpha;
A(N,N) = -2*(alpha+h/R+h/dr)+a1;

F = -a0*ones(N,1);
F(N)= -a0-2*h*(1/R+1/dr)*T_Storage;

TFinDiff = A\F;

%% Finite Element
T_Inf = T_Storage;
N = 37; % Number of nodes
L = 0.036/(N-1);
beta = (a0+a1*T_Inf)/k;
a = 1/L+G*L/3;
b = 1/L+G*L/6;
R = zeros(1,length(0:N-1));
for i=0:N-1
    R(i+1) = i*0.036/(N-1);
end

S = zeros(N-1,N-1);
for i=1:N-1
    for j=1:N-1
        if i>=2
            if i==j
                S(i,j) = 2*a;
                S(i,j-1) = -b;
                if i<N-1
                S(i,j+1) = -b;
                end
            end
        end
    end
end

S(1,1) = 2*a;
S(1,2) = -b;
S(N-1,N-2) = -b;
S(N-1,N-1) = a+he/k;

F = zeros(N-1,1);
F(1) = ((R(1)+R(3))/6+2*R(2)/3+b*u1);

for i=2:N-2
    F(i) = (R(i)+R(i+2))/6+2*R(i+1)/3;
end
F(N-1) = R(N-1)/6+R(N)/3;
F = beta*L*F;
u = S\F;
R2 = R(2:end)';
TFinEl = u./R2;
TFinEl = TFinEl + T_Inf;
%% PLOTS
plot(0:.036/36:0.036,TAnalytic,'b--');
hold on;
plot(0:.036/36:0.036,TFinDiff,'go');
plot(R2,TFinEl,'r*');
legend('Analyical Solution','Finite Difference','Finite Element'); 
title('Temperature distribution during storage');
xlabel('Fruit radii [m]');ylabel('Temperature [oC]'); grid
