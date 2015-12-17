%--------------------------------------------------------------------------
%------- Trabajo Final: Extracci�n de placas, segmentaci�n de caracteres y OCR
%------- Coceptos b�sicos de PDI ------------------------------------------
%------- Por: Jaime A. Londo�o Ciro    jaime951@gmail.com -----------------
%-------      Estudiante Facultad de Ingenieria, UdeA  --------------------
%-------      CC 1152204237 -----------------------------------------------
%--------------------------------------------------------------------------
%-------      Carlos Mario Herrera Acevedo    carlos4505@gmail.com --------
%-------      Estudiante Facultad de Ingenieria, UdeA  --------------------
%-------      CC 1040733689 -----------------------------------------------
%------- Curso B�sico de Procesamiento de Im�genes y Visi�n Artificial-----
%------- 16 de Diciembre de 2015-------------------------------------------
%--------------------------------------------------------------------------

%-------------------------------------------------------------------------
%----------------- Aplica filtros morfologicos     -----------------------
%----------------- Emborronar utilizando           -----------------------
%----------------- dilataci�n                      ---------------------
%-------------------------------------------------------------------------
function b=b_emborronado_dil(a);



        [fil,col,cap]=size(a);          % se establece el tama�o de la matriz
        a=reshape(a,[fil,col*cap]);     % se convierte 3 capas a una sola

         ee=strel('square',5);          % Elemento estructurante cuadrado de 5
         f2 = imdilate(a,ee);           % dilataci�n

        b=reshape(f2,[fil,col,cap]);    % recompone la imagen