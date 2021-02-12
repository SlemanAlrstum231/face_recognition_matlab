function insert_rsa()
[f,p]=uigetfile('*.*','select image to isert data two data');
ff=strcat(p,f);
img=imread(ff);
[f,p]=uigetfile('*.*','select second image to insert data');
ff=strcat(p,f);
s_img=imread(ff);
img=imresize(img,[100,90]);
s_img=imresize(s_img,[1,20]);
img1=reshape(img(:,:,1),[1,90*100]);
img2=reshape(img(:,:,2),[1,90*100]);
img3=reshape(img(:,:,3),[1,90*100]);
s_img1=reshape(s_img(:,:,1),[1,20*1]);
s_img2=reshape(s_img(:,:,2),[1,20*1]);
s_img3=reshape(s_img(:,:,3),[1,20*1]);
final_image1=[];
final_image2=[];
final_image3=[];
for i=1:8980
    final_image1=[final_image1 img1(i)];
     final_image2=[final_image2 img2(i)];
      final_image3=[final_image3 img3(i)];
end
for i=1:20
     final_image1=[final_image1 s_img1(i)];
     final_image2=[final_image2 s_img2(i)];
      final_image3=[final_image3 s_img3(i)];
end
size(final_image1)
final_image1=reshape(final_image1,[100,90]);
final_image2=reshape(final_image2,[100,90]);
final_image3=reshape(final_image3,[100,90]);
final_image=[];
final_image(:,:,1)=final_image1;
final_image(:,:,2)=final_image2;
final_image(:,:,3)=final_image3;
prompt = {'Enter image name to save:'};
dlgtitle = 'save encrypted image';
answer = inputdlg(prompt,dlgtitle);
answer{1,1}=strcat(answer{1,1},'.jpg');
subplot(121)
imshow(img);
title('image');
subplot(122)
imshow(uint8(final_image))
title('rsa iserted img');
imwrite(final_image,answer{1,1});
    
        
