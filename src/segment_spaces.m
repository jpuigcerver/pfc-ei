function X = segment_spaces(img)
W = size(img, 2);

x0=1;
while sum(img(:,x0)) == 0 && x0 < W
    x0 = x0 + 1;
end

X=[x0 0]; prev=1;
for x=x0+1:W
    srow = sum(img(:,x));
    if srow >= 1 && prev == 0
        X=[X; x 0];
        prev = 1;
    elseif srow == 0 && prev == 1
        X(end,2) = x;
        prev = 0;
    end 
end

if X(end,end) == 0
    X(end,end) = W;
end
end

