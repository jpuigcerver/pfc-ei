function I2 = plot_lines(I, XS, P, P2)
%figure;
%colormap('gray');
%imagesc(1-I);
%image(I);
%hold;

I2 = gray2rgb(I);
%I2 = I2 /

Ntr = size(XS, 1);
for i=1:Ntr
    x0w = XS(i, 1); x1w = XS(i, 2);
    if (P(i,1) == 0 && P(i,2) == 0) || (P2(i,1) == 0 && P2(i,2) == 0)
        continue;
    end
    %[~, BPx] = get_black_pixels(I(:,x0w:x1w));
    %x0 = x0w + min(BPx) - 1;
    %x1 = x1w + max(BPx) - 1;
    %X=[x0w x1w]
    %Y=[polyval(P(i,:), 0), polyval(P(i,:), x1w-x0w)]
    %Y2=[polyval(P2(i,:), 0), polyval(P2(i,:), x1w-x0w)]
    
    %m1 = (Y(2)-Y(1))/(X(2)-X(1));
    %m2 = (Y(2)-Y(1))/(X(2)-X(1));
    for x=x0w:x1w
        y1 = round(polyval(P(i,:), x-x0w));
        y2 = round(polyval(P2(i,:), x-x0w));
        if y1 < 1 || y2 < 1
            fprintf('Part %d, y1 = %d, y2 = %d\n', i, y1, y2);
            continue;
        end
        I2(y1,x,:) = [1 0 0];
        I2(y2,x,:) = [1 0 0];
    end
    %plot(X,Y, 'r');
    %plot(X,Y2, 'r');
    %pause
end
%hold off;
image(I2);

end
