function I = load_img_and_binarize(fname)
I = imread(fname);
if length(size(I)) >= 3
    I=(rgb2gray(I) < 127);
else
    Max = max(I(:));
    Min = min(I(:));
    I = I < (Max-Min)/2;
end
end
