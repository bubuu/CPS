function v=row_vec(A)
% v=row_vec(A)
% Przetwarza dowolny szereg A (1-, 2-, lub 3-D) na wektor wierszowy v.
% Jesli A ma wymiary 1xN, v=A. Jesli A ma wymiary Nx1, v=A.'.
% Jesli A jest macierza, v=A skanowana wierszami.
% Jesli A jest 3 wymiarowy, strony sa skanowane kolejno.
% Podobnie: col_vec

[Nr,Nc,Np,N4]=size(A);
if N4>1,
   error('Szereg ma wiecej niz 3 wymiary');
else
   for p=1:Np,
      A2=A(:,:,p)';
      v((p-1)*Nr*Nc+1:p*Nr*Nc)=A2(:)';
   end
end
      