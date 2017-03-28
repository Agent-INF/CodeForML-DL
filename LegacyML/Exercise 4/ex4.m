x = load('ex4x.dat');
y = load('ex4y.dat');
m = length(y);
x = [ones(m, 1), x];

pos = find(y==1);
neg = find(y==0);

figure;
plot(x(pos, 2), x(pos, 3), '+');
hold on
plot(x(neg, 2), x(neg, 3), 'o');

g = inline('1.0 ./ (1.0 + exp(-z))');

theta = zeros(size(x(1,:)))';
iters = 10;
J = zeros(1, iters);

for num_iter = 1:iters
    h = g(x * theta);
    gradient = sum((h - y) .* x)';
    H = zeros(3);
    for i = 1:m
        theta_x = x(i, :) * theta;
        hi = g(theta_x);
        xx = x(i, :)' * x(i, :);
        H = H + (hi * (1 - hi) * xx)';
    end
    theta = theta - H \ gradient;
    J(num_iter) = - m \ sum(y .* log(h) + (1 - y) .* log(1 - h));
end


hold on
x1 = 10:70;
x2 = -(theta(1) + theta(2) * x1) / theta(3);
plot(x1, x2, '-');

figure;
plot(1:iters, J);
xlabel('Number of iterations');
ylabel('Cost');

test = [1, 20, 80];
test_res = 1 - g(test * theta);
