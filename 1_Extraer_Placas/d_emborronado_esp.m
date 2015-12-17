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

%---- Funcion para emborronar una imagen ----------------------------------
% tiene como parametro de entrada la imagen que se desea emborronar
% y como parametro de salida la imagen emborronada
function b=emborronado_esp(a);

%-------------------------------------------------------------------------
%----------------- Aplica filtros espaciales para  -----------------------
%----------------- Emborronar utilizando           -----------------------
%----------------- fspecial                        ---------------------
%-------------------------------------------------------------------------

%       'average'   averaging filter
%       'disk'      circular averaging filter
%       'gaussian'  Gaussian lowpass filter
%       'laplacian' filter approximating the 2-D Laplacian operator
%       'log'       Laplacian of Gaussian filter
%       'motion'    motion filter
%       'prewitt'   Prewitt horizontal edge-emphasizing filter
%       'sobel'     Sobel horizontal edge-emphasizing filter

        [fil,col,cap]=size(a);
        a=reshape(a,[fil,col*cap]);

%        H = fspecial('average',[10 10]);
%        f1 = imfilter(a,H);

         H = fspecial('disk',10);
         f2 = imfilter(a,H);
%         
%         H = fspecial('gaussian');
%         f3 = imfilter(a,H);
%         
%         H = fspecial('laplacian');
%         f4 = imfilter(a,H);
%         
%         H = fspecial('log');
%         f5 = imfilter(a,H);
%         
%         H = fspecial('motion');
%         f6 = imfilter(a,H);
%         
%         H = fspecial('prewitt');
%         f7 = imfilter(a,H);
%         
%         H = fspecial('sobel');
%         f8 = imfilter(a,H);
        
        b=reshape(f2,[fil,col,cap]);
%         
%         figure(1); imshow([f1,f2;f3,f4;f5,f6;f7,f8]); 
%         title(['average disk gaussian laplacian']); impixelinfo
%         
%         figure(2);imshow(b)
%         
%         pause
%         
%         close all

