pkg load image

ases = 0;
dois = 0;
sete = 0;
quatro = 0;
nove = 0;
jota = 0;
que = 0;

cont = 0;

#Contagem de pixeis da sobreposicao

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'A.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

ases = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '2.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

dois = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '4.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

quatro = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '7.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

sete = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', '9.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

nove = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'J.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

jota = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'Q.png'));

for i=1:size(cortandoNumero,1)
  for j=1:size(cortandoNumero,2)
    if(cortandoNumero(i,j) == 0 && cortandoNumero(i,j) == teste(i,j))
      cont++;
    endif
  endfor
endfor

que = cont;
cont = 0;

#Condicionais para Numeros

if(ases > dois 
   && ases > quatro 
   && ases > sete 
   && ases > nove 
   && ases > jota 
   && ases > que)
   disp('Eh um As')
   resultadoNumero = sprintf("As")

   
  elseif(dois > ases 
   && dois > quatro 
   && dois > sete 
   && dois > nove 
   && dois > jota 
   && dois > que)
    disp('Eh um dois')
    resultadoNumero = sprintf("Dois")
    
  elseif(quatro > ases 
   && quatro > dois 
   && quatro > sete 
   && quatro > nove 
   && quatro > jota 
   && quatro > que)
    disp('Eh um quatro')
    resultadoNumero = sprintf("Quatro")
    
  elseif(sete > ases 
   && sete > dois 
   && sete > quatro 
   && sete > nove 
   && sete > jota 
   && sete > que)
    disp('Eh um sete')
    resultadoNumero = sprintf("Sete")
    
  elseif(nove > ases 
   && nove > dois 
   && nove > quatro 
   && nove > sete 
   && nove > jota 
   && nove > que)
    disp('Eh um nove')
    resultadoNumero = sprintf("Nove")
    
  elseif(jota > ases 
   && jota > dois 
   && jota > quatro 
   && jota > sete 
   && jota > nove 
   && jota > que)
    disp('Eh um Valete')
    resultadoNumero = sprintf("Valete")
    
  elseif(que > ases 
   && que > dois 
   && que > quatro 
   && que > sete 
   && que > nove 
   && que > jota)
    disp('Eh uma Rainha')
    resultadoNumero = sprintf("Rainha")
  else
    disp('Numero nao reconhecido')
    resultadoNumero = sprintf("Numero nao reconhecido")
end