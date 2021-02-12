function dec_rsa
import javax.crypto.Cipher;
load cihperimage.mat;
load key.mat;
cipher = Cipher.getInstance('RSA');
cipher.init(Cipher.DECRYPT_MODE, public_key);
decryptedBytes1=[];
decryptedBytes2=[];
decryptedBytes3=[];
decryptedText1=[];
decryptedText2=[];
decryptedText3=[];
for i=1:2880
    decryptedBytes1 =[decryptedBytes1 cipher.doFinal(ciphertext1(:,i)) ];
   decryptedText1 = [decryptedText1  typecast(decryptedBytes1(:,i), 'int8')];  
       decryptedBytes2 =[decryptedBytes2 cipher.doFinal(ciphertext2(:,i)) ];
   decryptedText2 = [decryptedText2  typecast(decryptedBytes2(:,i), 'int8')]; 
       decryptedBytes3 =[decryptedBytes3 cipher.doFinal(ciphertext3(:,i)) ];
   decryptedText3 = [decryptedText3  typecast(decryptedBytes3(:,i), 'int8')]; 
end

image1=[];
image2=[];
image3=[];
for i=1:2880
    image1 =[image1 ; decryptedText1(:,i) ];
    image2 =[image2 ; decryptedText2(:,i) ];
    image3 =[image3 ; decryptedText3(:,i) ];
end
image1=reshape(image1,[400,360]);
image2=reshape(image2,[400,360]);
image3=reshape(image3,[400,360]);
ciphertext1=reshape(ciphertext1,[720,512]);
ciphertext2=reshape(ciphertext2,[720,512]);
ciphertext3=reshape(ciphertext3,[720,512]);

final_image=[];
final_crypted_image=[];
final_crypted_image(:,:,1)=ciphertext1;
final_crypted_image(:,:,2)=ciphertext2;
final_crypted_image(:,:,3)=ciphertext3;


final_image(:,:,1)=image1;
final_image(:,:,2)=image2;
final_image(:,:,3)=image3;
final_image=uint8(final_image);
final_crypted_image=uint8(final_crypted_image);
figure(2);

subplot(121)
imshow(final_image);
title('image');
subplot(122)
imshow(final_crypted_image);
title('rsa img');


