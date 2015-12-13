function b=b_emborronado_dil(a);

%-------------------------------------------------------------------------
%----------------- Aplica filtros morfologicos     -----------------------
%----------------- Emborronar utilizando           -----------------------
%----------------- dilatación                      ---------------------
%-------------------------------------------------------------------------


        [fil,col,cap]=size(a);          % se establece el tamaño de la matriz
        a=reshape(a,[fil,col*cap]);     % se convierte 3 capas a una sola

         ee=strel('square',5);          % Elemento estructurante cuadrado de 5
         f2 = imdilate(a,ee);           % dilatación

        b=reshape(f2,[fil,col,cap]);    % recompone la imagen
%         
%         close all
%          figure(1); imshow([a]); 
%          figure(2); imshow([b]);         
%          title(['Dilate square de 20']); impixelinfo
%          pause
% close all
