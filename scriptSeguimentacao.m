pkg load image

imagem = strcat('C:\Users\lucas\Desktop\SmartPoker\banco\', 'A_paus.jpg');

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



#Cortando a imagem 
I2 = B(500:1400, 1100:1630,:);


#Redução de coordenadas
x=1;
for i=1:2:size(I2,1)
    y=1;
    for j=1:2:size(I2,2)
        peq(x,y) = I2(i,j);
        y=y+1;
    end
    x=x+1;
end


    
bool1 = 0;
bool2 = 0;

aux = 1;
aux2 = 1;
auy = 1;
auy2 = 1;

##aux =[];
##auy =[];
for i=2:size(peq,1)-1
  
      if(bool1 == 1 && bool2 == 1)
        break;
      endif
  for j=2:size(peq,2)-1
        if(peq(i,j,:)==255   
          &&peq(i-1,j,:)==255
          &&peq(i+1,j,:)==255
          &&peq(i,j-1,:)==0
          &&peq(i,j+1,:)==255
          &&bool1==0)
                     
          
           aux = i;
           aux2 = j;      
           bool1 = 1;
            
          
        endif
        
          if(peq(i,j,:)==255 
          &&peq(i-1,j,:)==0
          &&peq(i+1,j,:)==0
          &&peq(i,j+1,:)==255
          &&peq(i,j-1,:)==255
          &&bool2== 0)
              
            auy = i ;
            auy2 = j-10;
            bool2 = 1;
          
        endif
  endfor
endfor

I3 = peq(aux:auy, aux2:auy2,:); 

figure('Name', 'Imagem crop peq');
imshow(peq);

figure('Name', 'Imagem cortada');
imshow(I3);

