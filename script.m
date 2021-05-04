
clear all
pkg load image

imagem = strcat('C:\Users\lucas\Desktop\SmartPoker\banco\', '7_paus.jpg');

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


pkg load image


#Cortando a imagem 
##I2 = B(500:1400, 1100:1630,:);
I2=B;
##
#peq = I2;


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

%%PrÃ©-processamento  && SeguimentaÃ§Ã£o%%


for i=10:size(peq,1)
  
      if(bool1 == 1 && bool2 == 1)
        break;
      endif
  for j=10:size(peq,2)
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

##aux
##aux2
##auy
##auy2

I3 = peq(aux:auy, aux2:auy2,:); 



I4 = bwperim (I3)

 
#Cortando a imagem 
cortandoNumero = I4(1:185, 1:113,:);

cortandoNipe = I4(185: size(I4,1)-1 , :,:);
 
 cortandoNipe
 cortandoNumero
 
contadorPixels = 1;

 
 for davi=2:size(I4,1)-1
   for lucao=2:size(I4,2)-1
      if(I4(davi,lucao,:)== 1)
          contadorPixels++       
    
          endif
   endfor
 endfor
 
contadorPixels

 
I5 = regionprops(cortandoNipe, 'Area', 'Perimeter');

 
 
 ##(4*Area*pi)/(Perimeter^2)  formula

figure('Name', 'Imagem crop peq');
imshow(peq);


figure, imshow(B);

figure('Name', 'Imagem final');
imshow(I3);

figure('Name', 'Imagem BW');
imshow(I4);

figure('Name', 'Numero separado');
imshow(cortandoNumero);


figure('Name', 'Nipe separado');
imshow(cortandoNipe);

I5


