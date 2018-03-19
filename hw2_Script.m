close all; clc;
cropR1 = ["150:375","100:375","100:375"];
cropR2 = ["200:375","100:425","100:425"];
cropR3 = ["225:400","175:375","175:375"];
cropR4 = ["250:400","125:375","100:300"];


cropC1 = ["300:375","250:375","250:500"];
cropC2 = ["300:400","200:400","275:500"];
cropC3 = ["250:400","225:400","250:500"];
cropC4 = ["300:425","200:450","300:500"];
color = ['r','b','g'];
%%
X = zeros(6,226);
for l = 1:3
    I1 = eval(strcat('vidFrames',num2str(l),'_1'));
    cropI1 = I1(eval(cropR4(l)),eval(cropC4(l)),:,:);
    x1 = 1:226;
    y1 = 1:226;
    for k = 1:226
        i = cropI1(:,:,:,k);
        I = imbinarize(i); %convert to binary 
        [r1,c1] = find(I == max(I(:))); %find the coordinates of the brightest spot
        %find the average position in the matrix
        y1(k) = median(r1);
        x1(k) = median(c1);
    end
    X(2*l-1,:) = x1;
    X(2*l,:) = y1;
end

%% Start analysis of videos
[m,n]=size(X); % compute data size
mn=mean(X,2); % compute mean for each row
X=X-repmat(mn,1,n); % subtract mean

[u,s,v] = svd(X); %get the svd
o = diag(s);
Y = u.'*X; %principal component projection
Cy = (1/(n-1))*Y*Y.'; %covariance matrix of zero redundancy
%%
figure(1);
plot(o/sum(o),'ro'),title('percent correlation of singular values','fontsize',18),xlabel('singular value'),ylabel('percent');

%%
figure(2);
plot(Y(1:4,:).'), title('principal components projection'), legend('mode 1','mode 2','mode 3','mode 4')


