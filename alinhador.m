novoNaipe = cortandoNipe;

aux1 = 9999;
aux2 = 9999;

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

cortandoNipe = novoNaipe;