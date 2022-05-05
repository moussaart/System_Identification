function [SBPA] = SBPA(N)
P=[1,1,1,1,1,1,1,1,1,1];
for i=1:N;
    U(i)=P(length(P));
    k= xor(P(length(P)-1),P(3));
    H=[k,P];
    P=H(1:length(P));
end
SBPA=U
end

