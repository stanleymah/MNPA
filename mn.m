close all;
clear all;

% Parameters
R1 = 1;
Cap = 0.25;
R2 = 2;
L1 = 0.2;
R3 = 10;
alpha = 100;
R4 = 0.1;
RO = 1000;

% V = [ V1; V2; V3; V4; V5; IL; IS; I3]
G=zeros(8);
C=zeros(8);

G(1,:)=[1 0 0 0 0 0 0 0];
C(1,:)=[0 0 0 0 0 0 0 0]; 
G(2,:)=[(-1/R1) (1/R2+1/R1) 0 0 0 0 0 0]; 
C(2,:)=[-Cap Cap 0 0 0 0 0 0];
G(3,:)=[0 0 1/R3 0 0 -1 0 0]; 
C(3,:)=[0 0 0 0 0 0 0 0]; 
G(4,:)=[0 0 -1*alpha/R3 1 0 0 0 0]; 
C(4,:)=[0 0 0 0 0 0 0 0]; 
G(5,:)=[0 0 0 -1/R4 (1/R4+1/RO) 0 0 0]; 
C(5,:)=[0 0 0 0 0 0 0 0];
G(6,:)=[0 -1 1 0 0 0 0 0]; 
C(6,:)=[0 0 0 0 0 L1 0 0]; 
G(7,:)=[1 0 0 0 0 0 0 0];
C(7,:)=[0 0 0 0 0 0 0 0]; 
G(8,:)=[0 0 1 1 0 0 0 0]; 
C(8,:)=[0 0 0 0 0 0 0 0]; 

steps=10;
Dataset=zeros(3,steps);
Dataset(1,:)=linspace(-10,10,steps);

for i=1:steps
    F=[Dataset(1,i); 0; 0; 0; 0; 0; 0; 0];
    V=G\F;
    Dataset(2,i)=V(5);
    Dataset(3,i)=V(3);
end

figure(1)
hold on;
plot(Dataset(1,:),Dataset(2,:));
plot(Dataset(1,:),Dataset(3,:));
hold off;
% 'V_O','V_3'
title('Voltage vs Input Voltage');
ylabel('Voltage (V)');
xlabel('V (V)'); 
