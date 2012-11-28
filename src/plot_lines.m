function plot_lines(I, XS, P, P2)
figure;
colormap('gray');
imagesc(1-I);
hold;

Ntr = size(XS, 1);
for i=1:Ntr
    x0w = XS(i, 1); x1w = XS(i, 2);
    [~, BPx] = get_black_pixels(I(:,x0w:x1w));
    %x0 = x0w + min(BPx) - 1;
    %x1 = x1w + max(BPx) - 1;
    X=[x0w x1w];
    Y=[polyval(P(i,:), 0), polyval(P(i,:), x1w-x0w)];
    Y2=[polyval(P2(i,:), 0), polyval(P2(i,:), x1w-x0w)];
    plot(X,Y, 'r');
    plot(X,Y2, 'r');
    pause
end
hold off;
end
