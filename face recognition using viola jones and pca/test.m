function test(img)
load pcadb;
imgo=img;
img=rgb2gray(img);
img=imresize(img,[M,N]);
img=double(reshape(img,[1,M*N]));
imgpca=(img-m)*Ppca;
distarray=zeros(n,1);
for i=1:n
    distarray(i)=sum(abs(T(i,:)-imgpca));
end 
[r,index]=min(distarray);
if r>1.8e+04
    msgbox('not found');
else
    figure(2);
rimg=imread(sprintf('./traindb/%d.jpg',index));
subplot(121)
imshow(imgo);
title('query face');
subplot(122)
imshow(rimg);
title('recognized face');
end
r