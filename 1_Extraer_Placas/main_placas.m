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
%--1. Se inicializa el sistema --------------------------------------------
%--------------------------------------------------------------------------
clear all, close all, clc       % inicializa todo

%-------------------------------------------------------------------------
%------------------------- Lectura de Fotos en Bucle ---------------------
%-------------------------------------------------------------------------

 numero_placas=198;             % para las 198 placas almacenadas
 for i=1:numero_placas          % desde la primera hasta la última
    
    % lectura ordenada de las imágenes
    imagen=['.\..\..\Data\1_Fotos_198Carros\carro (',num2str(i),').jpg'];     
    a=imread(imagen);                                   

    
    %----------------------------------------------------------------------
    %------------------------- Preprocesado -------------------------------
    %------------------------- Unificar filas < columnas ------------------
    %----------------------------------------------------------------------

    [fil,col,cap]=size(a);      % Determino la dimensión de la matriz
                                % para saber si la imagen está girada
    if fil>col                  % si las filas son mayores a las columnas
        recor=floor((fil-col)/4);   % se recorta la imagen 1/4 parte
        a=a(recor:fil,:,:);
    end
    
    %figure; imshow(a); title(['Imagen Original']); pause(1)

    %----------------------------------------------------------------------
    %------------------------- Preprocesado -------------------------------
    %------------------------- recorte porcentajes ------------------------
    %----------------------------------------------------------------------
    %----------------------------------------------------------------------

    b=a_recorte(a,30,10,20,20); % Rutina recorte en porcentaje 
    [fil,col,cap]=size(b);      % a_recorte(a,por_sup,por_inf,por_izq,por_der)
    %figure; imshow(b); title(['Imagen original recortada']); pause(1)
    
 %------------------------------------------------------------------------
 %----------------- Emborronado de la imagen filtro morfologico  ---------
 %------------------------------------------------------------------------
 
    c=b_emborronado_dil(b);   % Rutina de emborronado
    c=b_emborronado_dil(c);   % se aplica por 2da vez Rutina de emborronado
    c=b_emborronado_dil(c);   % se aplica por 3ra vez Rutina de emborronado
    %figure; imshow(c); title(['Imagen emborronada con dilatación']); pause(1)
    
 %------------------------------------------------------------------------
 %----------------- Emborronado de la imagen con filtros -----------------
 %------------------------------------------------------------------------
 
    cc=d_emborronado_esp(c);            % se toma solo el espacial
    cc=d_emborronado_esp(cc);           % se aplica de nuevo el filtro espacial
     
    %figure; imshow(cc); title(['Imagen emborronada con fitrado espacial']); pause(1)
    
 %----------------------------------------------------------------------
 %----------------- Extraen componentes de color -----------------------
 %----------------- que maximizan la placa, esto es, -------------------
 %----------------- h,s,y ----------------------------------------------
 %----------------------------------------------------------------------
    
    d=c_componentes_color(c);
    %figure; imshow(d); title(['Imagen componentes de color maximo h,s,y']); pause(1)
    
 %----------------------------------------------------------------------
 %----------------- Binarizado de la Imagen con un  --------------------
 %----------------- Umbral extraido método utsu  -----------------------
 %----------------------------------------------------------------------

    d=rgb2gray(d);          % Se convierte imagen a escala de grises
    umbral=graythresh(d);   % Función que permite extraer el umbral para
                            % convertir imagen al formato binario
    e=im2bw(d,umbral);      % con el umbral anterior se binariza la imagen
    e=uint8(e)*255;         % se convierte imagen al formato integer de 8bits
                            % y se multiplican sus valores por la constante
                            % 255
    
    %figure;
    %imshow([b,reshape([d,d,d],[fil,col,cap]),reshape([e,e,e],[fil,col,cap])])
    %title(['Imagen binarizada con umbral'])
    %pause(1)

    % %  
    %----------------------------------------------------------------------
    %----------------- Quita bordes y deja el mayor   ---------------------
    %----------------- tamaño  --------------------------------------------
    %----------------------------------------------------------------------

    f=imclearborder(e);         % Se limpian bordes
    g=e_obj_mayor(f);           % sobrevive el objeto mayor por bwlabel
    [h,k,p]=f_marco_placa(g,b); % extraemos el objeto convexo de la original

    % se crea una copia de la imagen original 
    original=b;
    
    % se extrae la imagen filtrada
    filtrada=reshape([d,d,d],[fil,col,cap]);
    
    % se extrae la imagen umbralizada
    umbralizada=reshape([e,e,e],[fil,col,cap]);
    
    % se extrae la imagen segmentada
    segmentada=reshape([g,g,g],[fil,col,cap]);
    
    % se extrae la mascara
    mascara=reshape([h,h,h],[fil,col,cap]);
    
    %se crea una copia de la placa
    placa=k;
 
    %figure;subplot 211
    %imshow([original,filtrada,umbralizada;segmentada,mascara,placa]);
    %title(['original, filtrada, umbralizada // segmentada, mascara,  placa '])
    %subplot 212
    %imshow(p)
    %title(['placa de', imagen])
    
    % Se almacena la placa extraída del carro
    name = ['.\..\..\Data\2_Fotos_198Placas\placaCarro (',num2str(i),').jpg'];
    imwrite(p, name);
    %pause
    
 end
 