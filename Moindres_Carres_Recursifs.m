%fonction pour identifier les parémetre de systéme par MCR

function [MCR1] = Moindres_Carres_Recursifs(N,B,A,B0,A0,alpha,bruit) 
 % N : Les nombre d'échantillons de temps
 % na : les nombres des paramètres multiplier par U(k-i) i=1...na 
 % nb : les nombres des paramètres multiplier par Y(k-i) i=1...nb
 % si bruit= true on ajouter de bruit dans la sortie y
 U=randi([0,1],1,N);
 %Les données initial de probléme
 na=length(A0);
 nb=length(B0);
 na1=length(A);
 nb1=length(B);
 B0=B0';%B=[b1,.......,b{nb}].T
 A0=A0';%A=[a1,.....,a{na}].T
 %Simulation de systéme par les données initial
for i=1:nb1 ;
    Y(i)=0;
end
for i=nb1+1:N ;
    Y(i)=-B(1)*Y(i-1);
    for j=2:nb1;
        Y(i)=Y(i)-B(j)*Y(i-j);
    end
    for j=1:na1;
        Y(i)=Y(i)+A(j)*U(i-j);
    end 
end
if bruit==true
   b=randn(1,N);
   b=b*0.1;
   Y=Y+b;
end 
%=========identifecation de systéme par MCR==========
%Teta=[B;A]=[b1;...........;b_{nb};a1;...........;a_{na}]          
teta=[B0;A0];
TETA=teta;
P=alpha*eye(nb+na);

for k=nb+1:N;
    h=-Y(k-1);
    for j=2:nb;
        h=[h,-Y(k-j)];
    end
    for j=1:na;
        h=[h,U(k-j)];
    end
    h=h';
    G=P*h*inv(1+h'*P*h);
    teta=teta+G*(Y(k)-h'*teta);
    TETA=[TETA,teta];
    P=(eye(na+nb)-G*h')*P;
end

%=========traçage des courbes=========== 
n=na+nb;
f1 = figure('Name','Moindres_Carres_Recursifs');
for i=1:nb+na;
    subplot(na,nb,i)
    plot(1:N-nb+1,TETA(i,:))
    if i<nb+1 
        title1="b "+int2str(i);
    else 
        title1="a "+int2str(i-nb);
    end 
    title(title1)
end
MCR1=teta;
 
end

