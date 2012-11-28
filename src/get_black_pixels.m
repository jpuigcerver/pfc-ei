function [Y, X] = get_black_pixels(img, b)
if nargin < 2
    b = 1;
end
[H, W] = size(img);
Y = zeros(H, 1);
X = zeros(W, 1);
N = 0;
for y=1:H
    for x=1:W
        if img(y,x) == b
            N = N + 1;
            X(N) = x;
            Y(N) = y;
        end
    end
end
Y = Y(1:N);
X = X(1:N);
end

