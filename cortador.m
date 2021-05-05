pkg load image

imagem = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '10.png'));
##cortandoNipe = imagem;
##alinhador;
##imagem = cortandoNipe;
##i = 1;
##j = 1;

aux1 = 0;
aux2 = 0;

cont = 0;

##for i = 1: size(imagem,1)
##  for j = 1: size(imagem, 2)
##     
##     if(cont >= size(imagem,1)-1)
##        auxi = i;
##     elseif(imagem(i,j,:) > 0)
##        cont++;
##     else
##        cont = 0;
##     endif
##
##  endfor
##endfor

for i = 5:size(imagem,1)
  for j = 1:size(imagem,2)
    
    if(imagem(i,j,:) == 0)
      if(aux1<i)
        aux1 = i;
      endif
    endif
    
    if(imagem(i,j,:) == 0)
      if(aux2<j)
        aux2 = j;
      endif
    endif
    
  endfor
endfor

novaImagem = imagem(1:aux1, 1: aux2, :);
imwrite(novaImagem, 'D:\Desktop\PD Imagens\figurasCortadas\10.png');


figure, imshow(novaImagem);