pkg load image

ases = 0;
dois = 0;
quatro = 0;
sete = 0;
oito = 0;
nove = 0;
dez = 0;
jota = 0;
que = 0;
rei = 0;

auxiliar = 1;

cont = 0;

#Contagem de pixeis da sobreposicao

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'A.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++; 
    endif
  endfor
endfor

ases = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '2.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

dois = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '4.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

quatro = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '7.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

sete = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '8.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

oito = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '9.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

nove = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '10.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++; 
    endif
  endfor
endfor

dez = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'J.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

jota = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'Q.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

que = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'K.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNumero(i,j))
      cont++;
    endif
  endfor
endfor

rei = cont;
cont = 0;

#Condicionais para Numeros

if(ases > dois 
   && ases > quatro 
   && ases > sete
   && ases > oito 
   && ases > nove
   && ases > dez
   && ases > jota 
   && ases > que
   && ases > rei)
   disp('Eh um As')
   resultadoNumero = sprintf("As")

   
  elseif(dois > ases 
   && dois > quatro 
   && dois > sete
   && dois > oito 
   && dois > nove
   && dois > dez
   && dois > jota 
   && dois > que
   && dois > rei)
    disp('Eh um dois')
    resultadoNumero = sprintf("Dois")
    
  elseif(quatro > ases 
   && quatro > dois 
   && quatro > sete
   && quatro > oito 
   && quatro > nove
   && quatro > dez
   && quatro > jota 
   && quatro > que
   && quatro > rei)
    disp('Eh um quatro')
    resultadoNumero = sprintf("Quatro")
    
  elseif(sete > ases 
   && sete > dois 
   && sete > quatro
   && sete > oito
   && sete > nove
   && sete > dez
   && sete > jota 
   && sete > que
   && sete > rei)
    disp('Eh um sete')
    resultadoNumero = sprintf("Sete")
    
  elseif(oito > ases 
   && oito > dois
   && oito > quatro 
   && oito > sete
   && oito > dois 
   && oito > nove
   && oito > dez
   && oito > jota 
   && oito > que
   && oito > rei)
    disp('Eh um oito')
    resultadoNumero = sprintf("Oito")
    
  elseif(nove > ases 
   && nove > dois 
   && nove > quatro 
   && nove > sete
   && nove > oito
   && nove > dez
   && nove > jota 
   && nove > que
   && nove > rei)
    disp('Eh um nove')
    resultadoNumero = sprintf("Nove")
    
  elseif(dez > ases 
   && dez > dois 
   && dez > quatro 
   && dez > sete 
   && dez > oito
   && dez > nove
   && dez > jota
   && dez > que
   && dez > rei)
    disp('Eh um Dez')
    resultadoNumero = sprintf("Dez")
    
  elseif(jota > ases 
   && jota > dois 
   && jota > quatro 
   && jota > sete 
   && jota > oito
   && jota > nove
   && jota > dez
   && jota > que
   && jota > rei)
    disp('Eh um Valete')
    resultadoNumero = sprintf("Valete")
    
  elseif(que > ases 
   && que > dois 
   && que > quatro 
   && que > sete
   && que > oito 
   && que > nove
   && que > dez
   && que > jota
   && que > rei)
    disp('Eh uma Rainha')
    resultadoNumero = sprintf("Rainha")
    
  elseif(rei > ases 
   && rei > dois 
   && rei > quatro 
   && rei > sete
   && rei > oito 
   && rei > nove 
   && rei > dez
   && rei > jota
   && rei > que)
    disp('Eh um Rei')
    resultadoNumero = sprintf("Rei")
    
  else
    disp('Numero nao reconhecido')
    resultadoNumero = sprintf("Numero nao reconhecido")
end

ases
dois 
quatro 
sete 
oito
nove
dez
jota
que
rei