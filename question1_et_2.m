clear all ;
close all ;
N=400;
%les composentes de simulations de Y
A=[2,-1];
B=[1,0.7];
%les composentes de theta0
A0=[0.5,0.7];
B0=[0.77,-0.8];
bruit=true;
alpha=10000;
lamda=1.3;
Teta=Moindres_Carres_Recursifs_Ponderes(N,B,A,B0,A0,alpha,lamda,bruit)
Teta=Moindres_Carres_Recursifs_non_constant(N,B,A,B0,A0,alpha,bruit);
Teta=Moindres_Carres_Recursifs(N,B,A,B0,A0,alpha,bruit)



