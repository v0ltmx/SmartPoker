novoNaipe = cortandoNipe;
novoNumero = cortandoNumero;

aux1 = 9999;
aux2 = 9999;
aux3 = 9999;
aux4 = 9999;

#Alinhando o naipe

for i = 5:size(cortandoNipe,1)
  for j = 1:size(cortandoNipe,2)
    
    if(cortandoNipe(i,j,:) == 0)
      if(aux1>i)
        aux1 = i;
      endif
    endif
    
    if(cortandoNipe(i,j,:) == 0)
      if(aux2>j)
        aux2 = j;
      endif
    endif
    
  endfor
endfor

for i = aux1: size(novoNaipe,1)
  for j = aux2: size(novoNaipe,2)
   novoNaipe(i-aux1+1,j-aux2+1,:) = cortandoNipe(i,j,:);
   novoNaipe(i,j,:) = 255;
  endfor
endfor

#Alinhando o Numero

for i = 3:size(cortandoNumero,1)
  for j = 1:size(cortandoNumero,2)
    
    if(cortandoNumero(i,j,:) == 0)
      if(aux3>i)
        aux3 = i;
      endif
    endif
    
    if(cortandoNumero(i,j,:) == 0)
      if(aux4>j)
        aux4 = j;
      endif
    endif
    
  endfor
endfor

for i = aux3: size(novoNumero,1)
  for j = aux4: size(novoNumero,2)
   novoNumero(i-aux3+1,j-aux4+1,:) = novoNumero(i,j,:);
   novoNumero(i,j,:) = 255;
  endfor
endfor

figure('Name', 'Naipe'), imshow(novoNaipe);
figure('Name', 'Numero'), imshow(novoNumero);

cortandoNumero = novoNumero;
cortandoNipe = novoNaipe;
