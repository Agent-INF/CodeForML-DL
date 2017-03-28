x = load('ex5Linx.dat');
y = load('ex5Liny.dat');

figure;
plot(x, y, 'O');

%theta = zeros(6, 1);
m = length(y);
x = [ones(m, 1), x, x.^2, x.^3, x.^4, x.^5];

sizex = size(x);
n = sizex(2);
matr = eye(n);
matr(1) = 0;

lamda = 1;
theta = (x' * x + lamda * matr) \ (x' * y);

hold on
res_x = linspace(-1, 1, 100);
poly_x = [ones(100, 1), res_x', res_x'.^2, res_x'.^3, res_x'.^4, res_x'.^5];
res_y = poly_x * theta;
plot(res_x, res_y, '-');
