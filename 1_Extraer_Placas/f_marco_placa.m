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

%---- Funcion para extraer la placa de una imagen -------------------------
function [h,k,p]=f_marco_placa(g,b);


        h=uint8(bwconvhull(g,'objects'))*255; % envoltura convexa sobrevive
        [filas,colu]=find(h==255); % se encuentran los valores presentes en
                                   % el objeto que se va a extraer
        
        % se extraen los valores minimos y maximos de las filas y las columnas                           
        fila_m=min(filas(:));
        fila_x=max(filas(:));
        colu_m=min(colu(:));
        colu_x=max(colu(:));
        
        % se asigna 255 a todos los valores comprendididos entre el minimo
        % y el maximo de las filas y columnas que se desean extraer
        h(fila_m:fila_x,colu_m:colu_x)=255;
               
        % se extraen las propiedades de tama�o de la imagen b
        [fil,col,cap]=size(b);
        
        % se da una nueva a al imagen
        j=reshape([h,h,h],[fil,col,cap]);
        
        % se crea una copia de la imagen original
        k=b;
        
        % se hacen 0 los valores externos a la placa
        k(find(j==0))=0; 
        
        % se extrae la placa
        p=k(fila_m:fila_x,colu_m:colu_x,:);
        