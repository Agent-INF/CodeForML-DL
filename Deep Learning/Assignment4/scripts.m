%for lrc = [0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1]
%    lrc
%    a4_main(300, .02, lrc, 1000)
%end

visible_s = data_37_cases;
hidden_p = visible_state_to_hidden_probabilities(small_test_rbm_w, visible_s);
hidden_s = sample_bernoulli(hidden_p);
products = hidden_s * visible_s' .* small_test_rbm_w;
answer = log(sum(sum(exp(-products))))