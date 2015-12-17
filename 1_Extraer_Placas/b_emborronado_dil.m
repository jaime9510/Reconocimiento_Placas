%--------------------------------------------------------------------------
%------- Trabajo Final: Extracción de placas, segmentación de caracteres y OCR
%------- Coceptos básicos de PDI ------------------------------------------
%------- Por: Jaime A. Londoño Ciro    jaime951@gmail.com -----------------
%-------      Estudiante Facultad de Ingenieria, UdeA  --------------------
%-------      CC 1152204237 -----------------------------------------------
%--------------------------------------------------------------------------
%-------      Carlos Mario Herrera Acevedo    carlos4505@gmail.com --------
%-------      Estudiante Facultad de Ingenieria, UdeA  --------------------
%-------      CC 1040733689 -----------------------------------------------
%------- Curso Básico de Procesamiento de Imágenes y Visión Artificial-----
%------- 16 de Diciembre de 2015-------------------------------------------
%--------------------------------------------------------------------------

%-------------------------------------------------------------------------
%----------------- Aplica filtros morfologicos     -----------------------
%----------------- Emborronar utilizando           -----------------------
%----------------- dilatación                      ---------------------
%-------------------------------------------------------------------------
function b=b_emborronado_dil(a);



        [fil,col,cap]=size(a);          % se establece el tamaño de la matriz
        a=reshape(a,[fil,col*cap]);     % se convierte 3 capas a una sola

         ee=strel('square',5);          % Elemento estructurante cuadrado de 5
         f2 = imdilate(a,ee);           % dilatación

        b=reshape(f2,[fil,col,cap]);    % recompone la imagen