clear all ;
close all ;
N=400;
%les composentes de simulations de Y
A=[2,-1];
B=[1,0.7];
%les composentes de theta0
A0=[0.5,0.7,0.8];
B0=[0.77,-0.8,0.4];
bruit=true;
alpha=10000;
lamda=1.2;
teta=Moindres_Carres_Recursifs_Ponderes(N,B,A,B0,A0,alpha,lamda,bruit)

U=randi([0,1],1,50);
Y1(1:2)=[0,0];
for i=3:50;
    Y1(i)=-B(1)*Y1(i-1)-B(2)*Y1(i-2)+A(1)*U(i-2)+A(2)*U(i-2);
end
Y2(1:3)=Y1(1:3)
for i=4:50;
    Y2(i)=teta(1)*Y2(i-1)+teta(2)*Y2(i-2)+teta(3)*Y2(i-3)-teta(4)*U(i-1)-teta(5)*U(i-2)-teta(6)*U(i-3);
end
f5=figure;
plot(1:1:50,Y1,'r',1:1:50,Y2,'g')
E=0;
for i=1:50;
    E=(Y1(i)-Y2(i))^2+E;
end 
E=E/50




