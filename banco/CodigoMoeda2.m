clear all;
close all;
pkg load image;

################################################################
## LEITURA DA IMAGEM DE ENTRADA
imagemMoeda = imread('/mnt/Archives/JoaoGabriel/Faculdade/PDI/ProjetoPDI/Marco2/Banco/47.jpg');
figure('Name', 'Imagem Original: Moedas');
imshow(imagemMoeda);

################################################################
## PRÉ-PROCESSAMENTO
x=1;
for i=1:3:size(imagemMoeda,1)
    y=1;
    for j=1:3:size(imagemMoeda,2)
        imgMoedaReduzida(x,y,:) = imagemMoeda(i,j,:);
        y=y+1;
    end
    x=x+1;
end
figure('Name','Imagem Reduzida');
imshow(imgMoedaReduzida);

################################################################
## SEGMENTAÇÃO POR COR  

imSegmentada = uint8(zeros(size(imgMoedaReduzida,1),size(imgMoedaReduzida,2),size(imgMoedaReduzida,3)));
objetoMetrica = uint8(zeros(size(imgMoedaReduzida,1),size(imgMoedaReduzida,2),size(imgMoedaReduzida,3)));
for i=1:size(imgMoedaReduzida,1)
  for j=1:size(imgMoedaReduzida,2)
      % FUNDO AZUL
      if(imgMoedaReduzida(i,j,1)<140 && imgMoedaReduzida(i,j,2)>120 && imgMoedaReduzida(i,j,3)>120) 
         imSegmentada(i,j,:) = 0;
      %Objeto Metrica
      elseif(imgMoedaReduzida(i,j,1)>160 && imgMoedaReduzida(i,j,2) < 160 && imgMoedaReduzida(i,j,3)>170)
        imSegmentada(i,j,:) = 0;
        objetoMetrica(i,j,:) = imgMoedaReduzida(i,j,:);
      else
        imSegmentada(i,j,:) = 255;
    end
  end
end

figure('Name', 'Imagem Segmentada');
imshow(imSegmentada);

##################################################################
#### EROSÃO PARA REMOVER O RUIDO DO OBJETO METRICA

objetoMetricaBW = im2bw(objetoMetrica);
figure('Name', 'Objeto Metrica');
imshow(objetoMetricaBW, [0 1]);

EE = [1 1 1; 1 1 1; 1 1 1]; 
metricaErode = objetoMetricaBW;
for i=2:size(objetoMetricaBW,1)-1
  for j=2:size(objetoMetricaBW,2)-1
    if(objetoMetricaBW(i,j)==1) 
      if !(objetoMetricaBW(i-1,j-1) == EE(1,1) && objetoMetricaBW(i-1,j) == EE(1,2) && objetoMetricaBW(i-1,j+1) == EE(1,3) && objetoMetricaBW(i,j-1) == EE(2,1) && objetoMetricaBW(i,j) == EE(2,2) && objetoMetricaBW(i,j+1) == EE(2,3) && objetoMetricaBW(i+1,j-1) == EE(3,1) && objetoMetricaBW(i+1,j) == EE(3,2) && objetoMetricaBW(i+1,j+1) == EE (3,3))
         metricaErode(i,j) = 0;
      end    
    end
  end
end

figure('Name','Metrica - SEM RUÍDOS BRANCOS');
imshow(metricaErode, [0 1]);

##################################################################
## Remoçao de ruido preto do objeto metrica

EE = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];
metricaDilate = metricaErode;
for i=3:size(objetoMetricaBW,1)-1
  for j=3:size(objetoMetricaBW,2)-1
    if(metricaErode(i,j)==EE(2,2)) 
      if(EE(1,1)==1) metricaDilate(i-2,j-2) = 1; end
      if(EE(1,2)==1) metricaDilate(i-2,j-1) = 1; end
      if(EE(1,3)==1) metricaDilate(i-2,j) = 1; end
      if(EE(1,4)==1) metricaDilate(i-2,j+1) = 1; end
      if(EE(1,5)==1) metricaDilate(i-2,j+2) = 1; end
      if(EE(2,1)==1) metricaDilate(i-1,j-2) = 1; end
      if(EE(2,2)==1) metricaDilate(i-1,j-1) = 1; end
      if(EE(2,3)==1) metricaDilate(i-1,j) = 1; end
      if(EE(2,4)==1) metricaDilate(i-1,j+1) = 1; end
      if(EE(2,5)==1) metricaDilate(i-1,j+2) = 1; end
      if(EE(3,1)==1) metricaDilate(i,j-2) = 1; end
      if(EE(3,2)==1) metricaDilate(i,j-1) = 1; end
      if(EE(3,3)==1) metricaDilate(i,j) = 1; end
      if(EE(3,4)==1) metricaDilate(i,j+1) = 1; end
      if(EE(3,5)==1) metricaDilate(i,j+2) = 1; end
      if(EE(4,1)==1) metricaDilate(i+1,j-2) = 1; end
      if(EE(4,2)==1) metricaDilate(i+1,j-1) = 1; end
      if(EE(4,4)==1) metricaDilate(i+1,j+1) = 1; end
      if(EE(4,5)==1) metricaDilate(i+1,j+2) = 1; end
      if(EE(5,1)==1) metricaDilate(i+2,j-2) = 1; end
      if(EE(5,2)==1) metricaDilate(i+2,j-1) = 1; end
      if(EE(5,3)==1) metricaDilate(i+2,j) = 1; end
      if(EE(5,4)==1) metricaDilate(i+2,j+1) = 1; end
      if(EE(5,5)==1) metricaDilate(i+2,j+2) = 1; end
    end
  end
end

figure('Name','Metrica Dilatada - SEM RUÍDOS PRETOS');
imshow(metricaDilate, [0 1]);


##################################################################
#### EROSÃO PARA REMOVER O RUIDO BRANCO DAS MOEDAS
MoedaBW = im2bw(imSegmentada);
figure('Name', 'Imagem Binaria');
imshow(MoedaBW, [0 1]);

EE = [1 1 1; 1 1 1; 1 1 1]; 
imErode2 = MoedaBW;
for i=2:size(MoedaBW,1)-1
  for j=2:size(MoedaBW,2)-1
    if(MoedaBW(i,j)==1) 
      if !(MoedaBW(i-1,j-1) == EE(1,1) && MoedaBW(i-1,j) == EE(1,2) && MoedaBW(i-1,j+1) == EE(1,3) && MoedaBW(i,j-1) == EE(2,1) && MoedaBW(i,j) == EE(2,2) && MoedaBW(i,j+1) == EE(2,3) && MoedaBW(i+1,j-1) == EE(3,1) && MoedaBW(i+1,j) == EE(3,2) && MoedaBW(i+1,j+1) == EE (3,3))
         imErode2(i,j) = 0;
      end    
    end
  end
end

figure('Name','Imagem Erodida Geometrico - SEM RUÍDOS BRANCOS');
imshow(imErode2, [0 1]);

##################################################################
#### DILATAÇÃO PARA AUMENTAR A BORDA PERDIDA DAS MOEDAS

EE = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1];
imDilate = imErode2;
for i=3:size(MoedaBW,1)-1
  for j=3:size(MoedaBW,2)-1
    if(imErode2(i,j)==EE(2,2)) 
      if(EE(1,1)==1) imDilate(i-2,j-2) = 1; end
      if(EE(1,2)==1) imDilate(i-2,j-1) = 1; end
      if(EE(1,3)==1) imDilate(i-2,j) = 1; end
      if(EE(1,4)==1) imDilate(i-2,j+1) = 1; end
      if(EE(1,5)==1) imDilate(i-2,j+2) = 1; end
      if(EE(2,1)==1) imDilate(i-1,j-2) = 1; end
      if(EE(2,2)==1) imDilate(i-1,j-1) = 1; end
      if(EE(2,3)==1) imDilate(i-1,j) = 1; end
      if(EE(2,4)==1) imDilate(i-1,j+1) = 1; end
      if(EE(2,5)==1) imDilate(i-1,j+2) = 1; end
      if(EE(3,1)==1) imDilate(i,j-2) = 1; end
      if(EE(3,2)==1) imDilate(i,j-1) = 1; end
      if(EE(3,3)==1) imDilate(i,j) = 1; end
      if(EE(3,4)==1) imDilate(i,j+1) = 1; end
      if(EE(3,5)==1) imDilate(i,j+2) = 1; end
      if(EE(4,1)==1) imDilate(i+1,j-2) = 1; end
      if(EE(4,2)==1) imDilate(i+1,j-1) = 1; end
      if(EE(4,4)==1) imDilate(i+1,j+1) = 1; end
      if(EE(4,5)==1) imDilate(i+1,j+2) = 1; end
      if(EE(5,1)==1) imDilate(i+2,j-2) = 1; end
      if(EE(5,2)==1) imDilate(i+2,j-1) = 1; end
      if(EE(5,3)==1) imDilate(i+2,j) = 1; end
      if(EE(5,4)==1) imDilate(i+2,j+1) = 1; end
      if(EE(5,5)==1) imDilate(i+2,j+2) = 1; end
    end
  end
end

figure('Name','Imagem Dilatada Geometrico - SEM RUÍDOS PRETOS');
imshow(imDilate, [0 1]);

##################################################################
## Selecionando apenas as regiões das moedas e da metrica

rp = regionprops(imDilate, 'Image', 'Area')
rpMetrica = regionprops(metricaDilate, 'Image', 'Area')

##for i=1:size(rp,1)
##  if(rp(i).Area > 10000)
##    figure(i);
##    imshow(rp(i).Image);
##  end
##end

for i=1:size(rpMetrica,1)
    figure(i);
    imshow(rpMetrica(i).Image);
end

disp("-----------RESULTADOS---------");














