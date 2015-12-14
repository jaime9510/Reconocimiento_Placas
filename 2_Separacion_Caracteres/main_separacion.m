%-------------------------------------------------------------------------
%-------------------- Sistema de Identificaci�n de Placas ----------------
%-------------------- Estrategia Unificada para el curso PDI -------------
%-------------------- 1 oct 2015 -----------------------------------------
%-------------------------------------------------------------------------

clear all, close all, clc       % inicializa todo

%-------------------------------------------------------------------------
%------------------------- Lectura de Fotos en Bucle ---------------------
%-------------------------------------------------------------------------

 result = zeros(198, 1);
 numero_placas=198;             % para las 198 placas almacenadas
 for i=1:numero_placas          % desde la primera hasta la �ltima
    % lectura ordenada de las im�genes
    imagen=['.\..\..\Data\2_Fotos_198Placas\placaCarro (',num2str(i),').jpg'];     
    a=imread(imagen);
    
    %figure; imshow(a); title(['Imagen Original']); pause
    
    % Se umbraliza la imagen
    umbral = graythresh(a);
    placaUmbralizada = im2bw(a, umbral);
    placaUmbralizada = (placaUmbralizada == 0);
    
    %figure; imshow(placaUmbralizada); title(['Imagen umbralizada']); pause
    
    % Se erosiona la imagen
    mse = strel('rectangle', [6, 4]);
    %mse = strel('square', 5);
    erode = imerode(placaUmbralizada, mse);  
    %figure; imshow(erode); title(['Imagen erosionada']); pause
    
    % Se quita los bordes de la placa y se elimina el ruido
    placa = imclearborder(erode);
    %figure; imshow(placa); title(['Imagen sin bordes']); pause
    
    pixeles = 800;
    placa = bwareaopen(placa, pixeles);
    %figure; imshow(placa); title(['Imagen con menos ruido']); pause
    
    % Se separan los caracteres de la placa
    [L, NUM] = bwlabel(placa);
    
    [x, y] = size(placa);
    result(i) = NUM;
  
%     for caracter = 1 : NUM
%         extract = zeros(x, y);
%         pix = find(L == caracter);
%         extract(pix) = 1;
%         %figure; imshow(extract); title(['Imagen final']); pause
%     end
    
 end
 
disp(['0 caracteres: ', num2str(sum(result(:) == 0))]);
disp(['1 caracteres: ', num2str(sum(result(:) == 1))]);
disp(['2 caracteres: ', num2str(sum(result(:) == 2))]);
disp(['3 caracteres: ', num2str(sum(result(:) == 3))]);
disp(['4 caracteres: ', num2str(sum(result(:) == 4))]);
disp(['5 caracteres: ', num2str(sum(result(:) == 5))]);
disp(['6 caracteres: ', num2str(sum(result(:) == 6))]);
disp(['7 caracteres: ', num2str(sum(result(:) == 7))]);
disp(['8 caracteres: ', num2str(sum(result(:) == 8))]);
disp(['9 caracteres: ', num2str(sum(result(:) == 9))]);

disp(['mas de 9 caracteres: ', num2str(sum(result(:) > 9))]);