close all; clc
image = 50;
I1 = vidFrames3_2(:,:,:,:);
I2 = vidFrames3_4(100:300,300:500,:,:);
[a1,b1,e1,d1] = size(I1);
[a2,b2,e2,d2] = size(I2);

%%
%see the full video and the location of the paint can
for k= 1:d1
    i1 = I1(:,:,:,k);
    g1 = rgb2gray(i1);
    [r1,c2] = find(g1 == max(g1(:))); %find the coordinates of the brightest spot
    %find the average position in the matrix
    x1 = median(c2);
    y1 = median(r1);
    rgb1 = insertMarker(g1,[x1,y1],'o','color','red','size',10);
    imshow(rgb1)
end

%% 
%see the cropped video and the location of the paint can
for q= 1:d2
    i2 = I2(:,:,:,q);
    g2 = im2bw(i2,0.95);
    [r2,c2] = find(g2 == max(g2(:))); %find the coordinates of the brightest spot
    %find the average position in the matrix
    x2 = median(c2);
    y2 = median(r2);
    rgb2 = insertMarker(im2uint8(g2),[x2,y2],'o','color','red','size',10);
    imshow(rgb2)
end
