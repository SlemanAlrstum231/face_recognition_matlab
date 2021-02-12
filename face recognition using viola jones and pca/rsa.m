function rsa(img)
import javax.crypto.Cipher;

plaintext = img;

plaintext= imresize(plaintext,[400,360]);
imshow(plaintext)
[M,N,Z]=size(plaintext)
plaintext1=reshape(plaintext(:,:,1),[1,M*N]);
plaintext2=reshape(plaintext(:,:,2),[1,M*N]);
plaintext3=reshape(plaintext(:,:,3),[1,M*N]);
p1=[]
p2=[]
p3=[]
for i=1:2880
    b=i-1;
   
   p1=[p1 ;[  plaintext1((b*50)+1:(50*i))]];
   p2=[p2 ;[  plaintext2((b*50)+1:(50*i))]];
   p3=[p3 ;[  plaintext3((b*50)+1:(50*i))]];
end
   
cipher = Cipher.getInstance('RSA');
keygen = java.security.KeyPairGenerator.getInstance('RSA');
keyPair = keygen.genKeyPair();
cipher.init(Cipher.ENCRYPT_MODE, keyPair.getPrivate());
keyPair.getPrivate()
keyPair.getPublic()

plaintextUnicodeVals1=[];
plaintextUnicodeVals2=[];
plaintextUnicodeVals3=[];
plaintextBytes2=[];
plaintextBytes3=[];
plaintextBytes1=[];
ciphertext1=[];
ciphertext2=[];
ciphertext3=[];
for i=1:2880
    plaintextUnicodeVals1=[plaintextUnicodeVals1 ;int8(p1(i,:))];
    plaintextUnicodeVals2=[plaintextUnicodeVals2 ;int8(p2(i,:))];
    plaintextUnicodeVals3=[plaintextUnicodeVals3 ;int8(p3(i,:))];
   plaintextBytes1 = [plaintextBytes1 ; typecast(plaintextUnicodeVals1(i,:), 'int8')];
   plaintextBytes2 = [plaintextBytes2 ; typecast(plaintextUnicodeVals2(i,:), 'int8')];
   plaintextBytes3 = [plaintextBytes3 ; typecast(plaintextUnicodeVals3(i,:), 'int8')];
   ciphertext1 =[ ciphertext1  cipher.doFinal(plaintextBytes1(i,:))];
   ciphertext2 =[ ciphertext2  cipher.doFinal(plaintextBytes2(i,:))];
   ciphertext3 =[ ciphertext3  cipher.doFinal(plaintextBytes3(i,:))];
  
   
end
public_key=keyPair.getPublic();
private_key=keyPair.getPrivate();
save cihperimage.mat ciphertext1 ciphertext2 ciphertext3
save key.mat public_key

ciphertext1=reshape(ciphertext1,[720,512]);
ciphertext2=reshape(ciphertext2,[720,512]);
ciphertext3=reshape(ciphertext3,[720,512]);

final_crypted_image=[];
final_crypted_image(:,:,1)=ciphertext1;
final_crypted_image(:,:,2)=ciphertext2;
final_crypted_image(:,:,3)=ciphertext3;
final_crypted_image=uint8(final_crypted_image);
figure(2);

subplot(121)
imshow(img);
title('image');
subplot(122)
imshow(final_crypted_image);
title('rsa img');
prompt = {'Enter image name to save:'};
dlgtitle = 'save encrypted image';
answer = inputdlg(prompt,dlgtitle);
answer{1,1}=strcat(answer{1,1},'.jpg');

imwrite(final_crypted_image,answer{1,1});