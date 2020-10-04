% Solution of x in Ax=b using Jacobi Method

%% first we get number of equations as input
clc
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
[A_1 , b_1]=equationsToMatrix(eqns,vars);

disp(A_1);
disp(b_1);
A = double(A_1);
b = double(b_1);
disp(A);
disp(b);

% before calculations we put zeros in all x vector
x=zeros(n,1);
normVal=Inf; 

% tolerable error
tol=1e-5;
itr = 0;
%% Implementation: Jacobi Method


while (normVal>tol) & (itr<9)
    xold=x
    for i=1:n
        sigma=0;
        
        for j=1:n
            
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end
            
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=abs(xold-x);
end

%% output is x vector 

