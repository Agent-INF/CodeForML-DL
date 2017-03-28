x = load('ex2x.dat');
y = load('ex2y.dat');

figure
plot(x, y, 'o');
xlabel('Age in years');
ylabel('Height in meters');

m = length(y);
x = [ones(m, 1), x];
theta = zeros(2, 1);

alpha = 0.07;

for iter = 1:1500
    h = x * theta;
    hmy = h - y;
    theta = theta - (alpha / m) * sum(hmy .* x)';
end

hold on
plot(x(:, 2), x * theta, '-')
legend('Training data', 'Linear regression')

J_vals = zeros(100, 100);
theta0_vals = linspace(-3, 3, 100);
theta1_vals = linspace(-1, 1, 100);
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
        t = [theta0_vals(i); theta1_vals(j)];
        J_vals(i, j) = (1 / (2 * m)) * sum((x * t - y)' * (x * t - y));
    end
end

J_vals = J_vals';
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0');
ylabel('\theta_1');

figure;
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 2, 15))
xlabel('\theta_0');
ylabel('\theta_1');


