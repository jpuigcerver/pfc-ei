function P = least_squares(img, X)
Ntr = size(X,1);
P = zeros(Ntr, 2);
for i=1:Ntr
    x0 = X(i, 1);
    x1 = X(i, 2);
    imagesc(img(:,x0:x1));
    hold;
    [Yb, Xb] = get_black_pixels(img(:,x0:x1));
    P(i, :) = polyfit(Xb, Yb, 1);
    plot([0 x1-x0], [polyval(P(i, :), 0) polyval(P(i, :), x1-x0)]);
    hold off;
    pause
end
end

