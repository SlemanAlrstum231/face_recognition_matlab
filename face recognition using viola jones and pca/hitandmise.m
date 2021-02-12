function [true, false]=hitandmise
true=0;
false=0;
for count=1:600
    I=imread(sprintf('testdb/%d.jpg',count));
    preprocess(I);
    load image.mat
    [a b]=stat(J,count);
    true=true+a;
    false=false+b;
   
    
end
