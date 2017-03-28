res = zeros(1, 14);
index = 1;
for mm = [0, 0.9]
    for lr = [0.002, 0.01, 0.05, 0.2, 1.0, 5.0, 20.0]
        ret = a3(0, 10, 70, lr, mm, false, 4);
        res(index) = ret.loss(1);
        index = index + 1;
    end
end
res