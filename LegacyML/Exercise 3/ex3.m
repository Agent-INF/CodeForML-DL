x = load('ex3x.dat');
y = load('ex3y.dat');
m = length(x);
x = [ones(m, 1), x];
sigma = std(x);
mu = mean(x);
x(:, 2) = (x(:, 2) - mu(2)) ./ sigma(2);
x(:, 3) = (x(:, 3) - mu(3)) ./ sigma(3);

%alpha = 0.1;

iters = 50;

figure;    
xlabel('Number of iterations');
ylabel('Cost J');
for alpha = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3]
    theta = zeros(size(x(1,:)))';
    J = zeros(iters, 1);
    for num_iter = 1:iters
        h = x * theta;
        hmy = h - y;
        J(num_iter) =  (1 / (2 * m)) * (hmy' * hmy);
        theta = theta - (alpha / m) * sum(hmy .* x)';
    end
    plot(0:49, J(1:50), '-');
    hold on;
end

ne_x = load('ex3x.dat');
ne_y = load('ex3y.dat');
ne_x = [ones(m, 1), ne_x];
ne_theta = (ne_x' * ne_x) \ (ne_x' * ne_y);
h = ne_x * ne_theta;
hmy = h - ne_y;
J(1:iters) =  (1 / (2 * m)) * (hmy' * hmy);

plot(0:49, J(1:50), '-');

xt = [1 1650 3];
xt(2) = (xt(2) - mu(2)) ./ sigma(2);
xt(3) = (xt(3) - mu(3)) ./ sigma(3);
xt * theta
xt * ne_theta
