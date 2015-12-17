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

%--------------------------------------------------------------------------
%----------------- Identifica caracter ascii mas correlacionado con -------
%----------------- una imagen dada ----------------------------------------
%----------------- variables:                        ---------------
%-----------------  caracter = imagen que se desea correlacionar ----------
%-----------------  c = caracter ascii de mayor correlación con la imagen -
%-----------------  value = valor de la correlación de c con la imagen dada
%--------------------------------------------------------------------------
function [c, value] = IdentificarCorrelacion( caracter )

    % caracteres ascii. letras y números.
    caracteres = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
    
    % se crea una copia de la imagen del caracter
    b = caracter;
    
    % se redimensiona la imagen
    b = imresize(b,[48 28]);
    
    % se crea array para almacenar los valores de las correlaciones
    d=[];
    
    % Se realiza un ciclo desde 1 hasta el tamaño del arreglo donde se almacena el alfabeto y los numeros.
    for i = 1:length(caracteres)
        
        % Secarga la imagen correspondiente al caracter en la posicion posicion indicada por Abcdario del arreglo.
        a = imread(['.\..\..\Data\Caracteres_Letras_Numeros\',caracteres(i),'.bmp']);
        
        % Se redimenciona la imagen a un tamaño definido.
        a = imresize(a,[48 28]); 
        
        % Se establece la correlacion entre la imagen cargada y la imagen 
        % extraida de la placa.
        c = corr2(a, b);
        
        % Se almacena la correlacion encontrada.
        d = [d,c]; 
    end
    
    % se extrae el indice y el valor del caracter ascii que presenta la
    % mayor correlación
    [value, indice] = max(d);
    
    % con el indice se extrae el caracter ascii del arreglo de los mismos.
    c = caracteres(indice);
    

end

