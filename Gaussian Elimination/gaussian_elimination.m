clc
clear all
syms a b c d e f g x y z w
n = input('Please Enter the size of the equation system') ;
eqns=[];
vars=[];
for r=1:n
    e= input('Please Enter an equation ') ;
    eqns=[eqns e];
end
for r=1:n
    v= input('Please Enter a variable (a b c d e f g x y z w)') ;
    vars=[vars v];
end
[a,b]=equationsToMatrix(eqns,vars)
[m,c]=size(a);
j=1;
k=1;
n=1;
z=2;
for i=1:c-1   
for r=z:m
    if a(r,j)==0
        a(r,:)=a(r,:);b(r,:)=b(r,:);
    else
        b(r,:)=((a(r,j)/a(k,j))*b(n,:))-b(r,:)
        a(r,:)=((a(r,j)/a(k,j))*a(n,:))-a(r,:)
    end 
end
k=k+1;
n=n+1;
z=z+1;
j=j+1;
end
y=linsolve(a,b)