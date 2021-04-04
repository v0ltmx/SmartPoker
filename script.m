<<<<<<< HEAD
clear all
pkg load image

imagem = strcat('C:\Users\lucas\Desktop\SmartPoker\banco\', '8_ouro.jpg');

figure('Name','Imagem Lida');
imshow(imagem);


img = imread(imagem);

img_gray = rgb2gray(img);

LIMIAR = 220;

B = img_gray;
B(B<=LIMIAR) = 0;
B(B>LIMIAR) = 255;

figure('Name', 'Imagem Binarizada'); 
imshow(B);

#peq = B;
=======

pkg load image
>>>>>>> 63853a6c937f2fa81dfcf9e93e15d96e76b45c7f

#Cortando a imagem 
##I2 = B(500:1400, 1100:1630,:);
I2=B;
##
#peq = I2;

<<<<<<< HEAD
#Redução de coordenadas
x=1;
for i=2:2:size(I2,1)
    y=1;
    for j=2:2:size(I2,2)
        peq(x,y) = I2(i,j);
        y=y+1;
    end
    x=x+1;
end
    
bool1 = 0;
bool2 = 0;
aux = 2;
aux2 = 2;
auy = 2;
auy2 = 2;
=======
%%PrÃ©-processamento  && SeguimentaÃ§Ã£o%%

img = imread(imagem);
>>>>>>> 63853a6c937f2fa81dfcf9e93e15d96e76b45c7f

for i=10:size(peq,1)-1
  
      if(bool1 == 1 && bool2 == 1)
        break;
      endif
  for j=10:size(peq,2)-1
        if(peq(i,j,:)==255   
          &&peq(i-1,j,:)==255
          &&peq(i+1,j,:)==255
          &&peq(i,j-1,:)==0
          &&peq(i,j+1,:)==255
          &&bool1==0)
                     
          
           aux = i;
           aux2 = j+7;      
           bool1 = 1;
            
          
        endif
        
          if(peq(i,j,:)==0 
          &&peq(i-3,j,:)==255
          &&peq(i+3,j,:)==255
          &&peq(i,j+1,:)==0
          &&peq(i,j-1,:)==0
          &&bool2== 0)
              
            auy = i+150;
            auy2 = j-10;
            bool2 = 1;
          
        endif
  endfor
endfor

aux
aux2
auy
auy2

I3 = peq(aux:auy, aux2:auy2,:); 


figure('Name', 'Imagem crop peq');
imshow(peq);

<<<<<<< HEAD
figure('Name', 'Imagem final');
imshow(I3);

I3
=======
figure, imshow(B);
>>>>>>> 63853a6c937f2fa81dfcf9e93e15d96e76b45c7f
