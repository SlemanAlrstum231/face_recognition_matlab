M=100;
N=90;
n=300;
L=50;
X=zeros(n,(M*N));
T=zeros(n,L);
for count=1:n
    I=imread(sprintf('traindb/%d.jpg',count));
    preprocess(I);
    load image.mat
    
    I=rgb2gray(J);
    I=imresize(I,[M,N]);
    X(count,:)=reshape(I,[1,M*N]);
end
xb=X;
m=mean(X);
for i=1:n
X(i,:)=X(i,:)-m;
end
q=(X'*X)/(n-1);
[Evecm,Evalm]=eig(q);
Eval=diag(Evalm);
[Evalsorted,index]=sort(Eval,'descend');
Evecsorted=Evecm(:,index);
Ppca=Evecsorted(:,1:L);
for i=1:n
    T(i,:)=(xb(i,:)-m)*Ppca;
end

    