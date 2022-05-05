%fonction pour identifier les parémetre de systéme par MCR

function [MCR1] = Moindres_Carres_Recursifs_Ponderes_en_temps_reel(N1,A,B,alpha,lamda,bruit) 
u=randi([0,1],1,N1);
 %Les données initial de probléme
 B=B';%B=[a,b].T
 A=A';%A=[c,d].T
 teta=[B;A];
 Teta=teta;
 U=0;
 Y=[0,0];
 for N=1:N1;
 %Simulation de systéme par les données intaile 
if N<3 ;
    y1=0;
else 
    U=[u(N-2),u(N-1)];
    y1=-teta(1)*Y(2)-teta(2)*Y(1)+teta(3)*U(2)+teta(4)*U(1);
    if bruit==true 
        y1=y1+randn(1)*0.1;
    end 
end

%identifecation de systéme par MCR
if N>3
    %Teta=[B,A]
   
U=[u(N-2),u(N-1)];
P=alpha*eye(4);
h=[-Y(2),-Y(1),U(2),U(1)]';
G=P*h*inv(lamda+h'*P*h);
teta=teta+G*(y1-h'*teta);
Teta=[Teta,teta];
P=(1/lamda)*(eye(4)-G*h')*P;
end

clear U ;
Y=[Y(2),y1];

 end

subplot(221)
plot(Teta(1,:),'b')
title('a')
subplot(222)
plot(Teta(2,:),'r')
title('b')
subplot(223)
plot(Teta(3,:),'y')
title('c')
subplot(224)
plot(Teta(4,:),'g')
title('d')

MCR1=Teta(:,end);
 
end


