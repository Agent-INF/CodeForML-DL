function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m = size(X, 1);
for xi = 1:m
%    min_dist = (X(xi, 1) - centroids(1, 1)) ^ 2 ...
%        + (X(xi, 2) - centroids(1, 2)) ^ 2;
    min_dist = pdist([X(xi, :); centroids(1, :)],'euclidean');
    idx(xi) = 1;
    if K >= 2
        for ci = 2:K
%            dist = (X(xi, 1) - centroids(ci, 1)) ^ 2 ...
%            + (X(xi, 2) - centroids(ci, 2)) ^ 2;
            dist = pdist([X(xi, :); centroids(ci, :)],'euclidean');
            if dist < min_dist
                min_dist = dist;
                idx(xi) = ci;
            end
        end
    end
end
    
% =============================================================

end

