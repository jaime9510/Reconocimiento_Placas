function b=a_recorte(a,por_sup,por_inf,por_izq,por_der)

%-------------------------------------------------------------------------
%----------------- Recorta una imagen en términos de ---------------------
%------------------porentaje según se indique en las ---------------------
%----------------- variables:                        ---------------------
%-----------------  a= imagen de entrada             ---------------------
%-----------------  b= imagen de salida              ---------------------
%-----------------  por_sup = porcentaje superior recorte  ---------------
%-----------------  por_inf = porcentaje inferior recorte  ---------------
%-----------------  por_izq = porcentaje izquierda recorte  --------------
%-----------------  por_der = porcentaje derecha recorte   ---------------
%-------------------------------------------------------------------------

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
