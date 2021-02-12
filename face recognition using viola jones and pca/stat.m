function [true false] =stat(img,number)
load pcadb;
imgo=img;
img=rgb2gray(img);
img=imresize(img,[M,N]);
img=double(reshape(img,[1,M*N]));
imgpca=(img-m)*Ppca;
true=0;
false=0;
distarray=zeros(n,1);
for i=1:n
    distarray(i)=sum(abs(T(i,:)-imgpca));
end
[r,index]=min(distarray);
if r>1.8e+04
    false=false+1;
else
    true_n=ceil(number/20);
    b=ceil(index/10);
    if(true_n==b)
    true=true+1;
    else
        false=false+1;
    end
    
end
r