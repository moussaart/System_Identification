clear all ;
close all ;
A=[2,-1];
B=[1,0.7];
bruit=true;
alpha=1000;
lamda=2;
teta=Moindres_Carres_Recursifs_Ponderes_en_temps_reel(1000,A,B,alpha,lamda,bruit);


%vérifecation 
U=sin(0:1:50)+exp(-(0:1:50));
Y1(1:2)=[0,0];
for i=3:50;
    Y1(i)=-B(1)*Y1(i-1)-B(2)*Y1(i-2)+A(1)*U(i-2)+A(2)*U(i-2);
end
Y2(1:2)=[0,0];
for i=3:50;
    Y2(i)=-teta(1)*Y2(i-1)-teta(2)*Y2(i-2)+teta(3)*U(i-1)+teta(4)*U(i-2);
end
f5=figure;
plot(1:1:50,Y1,'r',1:1:50,Y2,'g')
E=0;
for i=1:50;
    E=(Y1(i)-Y2(i))^2+E;
end 
E=E/50