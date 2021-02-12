function compare_two_image()
[f,p]=uigetfile('*.*','select image to compare data');
ff=strcat(p,f);
img=imread(ff);
[f,p]=uigetfile('*.*','select second image to compare data');
ff=strcat(p,f);
img2=imread(ff);
img=imresize(img,[100,90]);
img2=imresize(img2,[100,90]);
x=[];
y=[];
for i=1:100
    for j=1:90
      x=[x img(i,j,1)];
      y=[y img2(i,j,1)];
    end
end
figure(2);
plot(x,y,'--rs',...
    'LineWidth',2,...
    'MarkerSize',1,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor','r'),title('red color');

x=[];
y=[];
for i=1:100
    for j=1:90
      x=[x img(i,j,2)];
      y=[y abs(img2(i,j,2)-img(i,j,2))];
    end
end
figure(3);
plot(x,y,'--gs',...
    'LineWidth',2,...
    'MarkerSize',1,...
    'MarkerEdgeColor','g',...
    'MarkerFaceColor','g'),title('green color');
x=[];
y=[];
for i=1:100
    for j=1:90
      x=[x img(i,j,3)];
      y=[y img2(i,j,3)];
    end
end
figure(4);
plot(x,y,'--bs',...
    'LineWidth',2,...
    'MarkerSize',1,...
    'MarkerEdgeColor','b',...
    'MarkerFaceColor','b'),title('blue color');