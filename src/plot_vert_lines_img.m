function plot_vert_lines_img(I, X)
figure;
colormap('gray');
imagesc(I);
hold;
for i=1:size(X, 1)
plot([X(i, 1), X(i, 1)], [0, size(I,1)]);
plot([X(i, 2), X(i, 2)], [0, size(I,1)]);
end
hold off;
end