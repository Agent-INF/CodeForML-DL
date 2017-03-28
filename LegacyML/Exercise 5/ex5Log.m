x = load('ex5Logx.dat');
y = load('ex5Logy.dat');

figure
pos = find(y == 1);
neg = find(y == 0);
plot(x(pos, 1), x(pos, 2), '+');
hold on
plot(x(neg, 1), x(neg, 2), 'o');
xlabel('u');
ylabel('v');

g = inline('1.0 ./ (1.0 + exp(-z))');

x = map_feature(x(:, 1), x(:, 2));
sizex = size(x);
m = sizex(1);
n = sizex(2);
theta = zeros(n, 1);

lamda = 0;
iters = 15;
J = zeros(1, iters);
for num_iter = 1:iters
    h = g(x * theta);
    gradJ = sum((h - y) .* x)' + lamda * theta;
    gradJ(1) = gradJ(1) - lamda * theta(1);
    
    H = zeros(n);
    matr = eye(n);
    matr(1) = 0;
    for i = 1:m
        hi = g(x(i, :) * theta);
        H = H + (hi * (1 - hi) * x(i, :)' * x(i, :))';
    end
    H = H + lamda * matr;
    
    theta = theta - H \ gradJ;
    J(num_iter) = - m \ sum(y .* log(h) + (1 - y) .* log(1- h))...
        + (2 * m) \ lamda * (sum(theta .^ 2) - theta(1) ^ 2);
end
%{
figure
plot(1:iters, J, '-')
%}
u = linspace(-1, 1.5, 200);
v = linspace(-1, 1.5, 200);
z = zeros(length(u), length(v));

for i = 1:length(u)
    for j = 1:length(v)
        z(j, i) = map_feature(u(i), v(j)) * theta;
    end
end

%z = z';
contour(u, v, z, [0, 0], 'LineWidth', 2)
legend('y = 1', 'y = 0', 'Decision Boundary');

norm(theta)




