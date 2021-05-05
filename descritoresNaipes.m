pkg load image

cont = 0;

paus = 0;
copas = 0;
espadas = 0;
ouro = 0;

#Contagem de pixeis da sobreposicao

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'Paus.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNipe(i,j))
      cont++;
    endif
  endfor
endfor

paus = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'Copas.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNipe(i,j))
      cont++;
    endif
  endfor
endfor

copas = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'Espadas.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNipe(i,j))
      cont++;
    endif
  endfor
endfor

espadas = cont;
cont = 0;

teste = imread(strcat('D:\Desktop\PD Imagens\baseConhecimento\', 'Ouro.png'));

for i=1:size(teste,1)
  for j=1:size(teste,2)
    if(teste(i,j) == 0 && teste(i,j) == cortandoNipe(i,j))
      cont++;
    endif
  endfor
endfor

ouro = cont;
cont = 0;


#Condicionais para Naipes

if(paus > copas && paus > espadas && paus > ouro)
  disp(' de paus.')
  resultadoNaipe = sprintf(" de paus.")
  elseif(copas > espadas && copas > paus && copas > ouro)
    disp(' de copas')
    resultadoNaipe = sprintf(" de copas.")

  elseif(espadas > ouro && espadas > paus && espadas > ouro)
    disp(' de espadas')
    resultadoNaipe = sprintf(" de espadas.")

  elseif(ouro > paus && ouro > espadas && ouro > copas)
    disp(' de ouro')
    resultadoNaipe = sprintf(" de ouro.")

  else
    disp('de naipe nao reconhecido')
    resultadoNaipe = sprintf(" Naipe nao reconhecido.")

 endif
 paus
 copas
 espadas
 ouro