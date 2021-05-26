a = imread('leaf9_nem.jpg');
c = rgb2hsv(a);
%figure, imshow(a)
%figure, imshow(c)

H = c(:,:,1);
S = c(:,:,2);
V = c(:,:,3);

f = fspecial('gaussian', [9,9]);
filter = imfilter(H, f);
subplot(2,2,2); imshow(filter); title('Filter Image')

if label == 'Bacteria'
    bw = filter > 0.17 & filter <0.65;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 1000]);
    subplot(2,2,3); imshow(Bw); title('Binarized Image')
    subplot(2,2,4); imshow(BW2); title('Image with Spots')
elseif label == 'Fungi' 
    bw = filter > 0.15 & filter <0.5;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 1000]);
    subplot(2,2,3); imshow(Bw); title('Binarized Image')
    subplot(2,2,4); imshow(BW2); title('Image with Spots')
elseif label == 'Nematodes' 
    bw = filter > 0.08 & filter <0.5;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 600]);
    subplot(2,2,3); imshow(Bw); title('Binarized Image')
    subplot(2,2,4); imshow(BW2); title('Image with Spots')
elseif label == 'Virus' 
    bw = filter > 0.08 & filter <0.3;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 2000]);
    subplot(2,2,3); imshow(Bw); title('Binarized Image')
    subplot(2,2,4); imshow(BW2); title('Image with Spots')
elseif label == 'Normal' 
    bw = filter > 0.1 & filter <0.5;
    Bw = ~bw;
    BW2 = bwareafilt(Bw,[5 2000]);
    subplot(2,2,3); imshow(Bw); title('Binarized Image')
    subplot(2,2,4); imshow(BW2); title('Image with Spots')
    
end

cc = bwconncomp(BW2);
Spots = cc.NumObjects ;
%disp(Spots)