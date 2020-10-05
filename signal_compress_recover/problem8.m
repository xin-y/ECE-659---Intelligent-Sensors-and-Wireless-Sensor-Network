% (a) Create a sparse vector of 512 random sensory values. Plot this vector
% the sparse vector has n values where k are non-zero values
n = 512; k = 20;
p = randperm(n);
x = zeros(n,1);
x(p(1:k)) = (randn(k,1));
figure(1); plot(1:n, x);


% (b) Create a random measurement matrix to compress the sensory vector

m = 128;
Phi = randn(m,n);
y = Phi*x;
figure(2); plot(1:m, y)

% (c) Use the Matlab function l1eq_pd function to recover the 512 sensory data
x0=Phi'*y;
xp = l1eq_pd(x0,Phi,[],y,1e-3);
figure(3);plot(xp);

figure(4); plot(1:n, x, 1:n, xp);

legend('truth', 'recovery');

R = corrcoef(x,xp)