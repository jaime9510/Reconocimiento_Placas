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


%---- Funcion para extraer el objeto de mayor tamaño de una imagen --------
% tiene como parametro de entrada la imagen que se desea procesar
% y como parametros de salida el objeto de mayor tamaño en la imagen
function g=e_obj_mayor(f)

 %----------------------------------------------------------------------
    %----------------- Sobrevive el objeto mas grande   -------------------
    %----------------------------------------------------------------------

    area=[];                            % inicializamos areas
    [l,num]=bwlabel(f);               % etiquetamos objetos resultados
    f1=zeros(size(l));                 % creamos comodin
   
   %----------------- encontramos las areas de los objetos  ---------------
   
   if num>0
   
    for i=1:num
        ind=find(l==i);
        area_i=size(ind,1);
        area=[area,area_i];
    end
    
    %----------------- encontramos la mayor area de los objetos -----------

    ind=max(find(area==max(area)));
    f1(find(l==ind))=255;
   end
   
   if num<=0
       f1=f;
   end
   
   g=uint8(f1);  % volvemos imagen el comodin
    