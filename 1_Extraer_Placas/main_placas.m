%-------------------------------------------------------------------------
%-------------------- Sistema de Identificaci�n de Placas ----------------
%-------------------- Estrategia Unificada para el curso PDI -------------
%-------------------- 1 oct 2015 -----------------------------------------
%-------------------------------------------------------------------------

clear all, close all, clc       % inicializa todo

%-------------------------------------------------------------------------
%------------------------- Lectura de Fotos en Bucle ---------------------
%-------------------------------------------------------------------------

 numero_placas=198;             % para las 198 placas almacenadas
 for i=1:numero_placas          % desde la primera hasta la �ltima
    % lectura ordenada de las im�genes
    imagen=['.\..\..\Data\1_Fotos_198Carros\carro (',num2str(i),').jpg'];     
    a=imread(imagen);                                   

    
%-------------------------------------------------------------------------
%------------------------- Preprocesado ----------------------------------
%------------------------- Unificar filas < columnas ---------------------
%-------------------------------------------------------------------------

    [fil,col,cap]=size(a);      % Determino la dimensi�n de la matriz
                                % para saber si la imagen est� girada
    if fil>col                  % si las filas son mayores a las columnas
        recor=floor((fil-col)/4);   % se recorta la imagen 1/4 parte
        a=a(recor:fil,:,:);
    end
    %figure;
    %imshow(a)
    title(['Imagen Original'])
    %pause(1)
    
    %a=imresize(a,0.3); % Usar en caso de carga de memoria por tama�o

%-------------------------------------------------------------------------
%------------------------- Preprocesado ----------------------------------
%------------------------- recorte porcentajes ---------------------------
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

    b=a_recorte(a,30,10,20,20); % Rutina recorte en porcentaje 
    [fil,col,cap]=size(b);      % a_recorte(a,por_sup,por_inf,por_izq,por_der)
    %figure;
    %imshow(b)
    title(['Imagen original recortada'])
    %pause(1)
    
 %------------------------------------------------------------------------
 %----------------- Emborronado de la imagen filtro morfologico  ---------
 %------------------------------------------------------------------------
 
    c=b_emborronado_dil(b);   % Rutina de emborronado
    c=b_emborronado_dil(c);   
    c=b_emborronado_dil(c); 
    %figure;
    %imshow(c)
    title(['Imagen emborronada con dilataci�n'])
    %pause(1)
    
 %------------------------------------------------------------------------
 %----------------- Emborronado de la imagen con filtros -----------------
 %------------------------------------------------------------------------
 
    cc=d_emborronado_esp(c);            % se toma solo el espacial
    cc=d_emborronado_esp(cc);           % mirar rutina
     
    %figure;
    %imshow(cc)
    title(['Imagen emborronada con fitrado espacial'])
    %pause(1)
    
 %----------------------------------------------------------------------
 %----------------- Extraen componentes de color -----------------------
 %----------------- que maximizan la placa, esto es, -------------------
 %----------------- h,s,y ----------------------------------------------
 %----------------------------------------------------------------------
    d=c_componentes_color(c);
    %figure;
    %imshow(d)
    title(['Imagen componentes de color maximo h,s,y'])
    %pause(1)
    
 %----------------------------------------------------------------------
 %----------------- Binarizado de la Imagen con un  --------------------
 %----------------- Umbral extraido m�todo utsu  -----------------------
 %----------------------------------------------------------------------

    d=rgb2gray(d);
    umbral=graythresh(d);
    e=im2bw(d,umbral);
    e=uint8(e)*255;
    %figure;
    %imshow([b,reshape([d,d,d],[fil,col,cap]),reshape([e,e,e],[fil,col,cap])])
    title(['Imagen binarizada con umbral'])
    %pause(1)

% %  
 %----------------------------------------------------------------------
 %----------------- Quita bordes y deja el mayor   ---------------------
 %----------------- tama�o  --------------------------------------------
 %----------------------------------------------------------------------

    f=imclearborder(e);         % Se limpian bordes
    g=e_obj_mayor(f);           % sobrevive el objeto mayor por bwlabel
    [h,k,p]=f_marco_placa(g,b); % extraemos el objeto convexo de la original


     original=b;
     filtrada=reshape([d,d,d],[fil,col,cap]);
     umbralizada=reshape([e,e,e],[fil,col,cap]);
     segmentada=reshape([g,g,g],[fil,col,cap]);
     mascara=reshape([h,h,h],[fil,col,cap]);
     placa=k;
 
     %figure;subplot 211
     %imshow([original,filtrada,umbralizada;segmentada,mascara,placa]);
     title(['original, filtrada, umbralizada // segmentada, mascara,  placa '])
     %subplot 212
     %imshow(p)
     title(['placa de', imagen])
     name = ['.\..\..\Data\2_Fotos_198Placas\placaCarro (',num2str(i),').jpg'];
     imwrite(p, name);
     %pause
    
%     imagen=['.\2_Placas\placa_carro(',num2str(i),').jpg']; 
%     figure(3);
%     imshow(p);
%     title(imagen);
%      pause  
%     close all
 
     %imwrite(p,imagen,'bmp');
   % pause(0.01)
 end
 