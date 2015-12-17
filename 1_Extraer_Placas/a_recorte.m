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
%----------------- Recorta una imagen en t�rminos de ---------------------
%------------------porentaje seg�n se indique en las ---------------------
%----------------- variables:                        ---------------------
%-----------------  a= imagen de entrada             ---------------------
%-----------------  b= imagen de salida              ---------------------
%-----------------  por_sup = porcentaje superior recorte  ---------------
%-----------------  por_inf = porcentaje inferior recorte  ---------------
%-----------------  por_izq = porcentaje izquierda recorte  --------------
%-----------------  por_der = porcentaje derecha recorte   ---------------
%-------------------------------------------------------------------------
function b=a_recorte(a,por_sup,por_inf,por_izq,por_der)

[fil,col,cap]=size(a);
fil_sup=ceil(por_sup*fil/100);
fil_inf=fil-floor(por_inf*fil/100);
col_izq=ceil(por_izq*col/100);
col_der=col-floor(por_der*col/100);
b=a(fil_sup:fil_inf,col_izq:col_der,:);
%
%     figure(2);imshow(b)
%     pause
% close all
