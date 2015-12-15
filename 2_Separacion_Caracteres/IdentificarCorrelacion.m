function [c, value] = IdentificarCorrelacion( caracter )
%IDENTIFICARCORRELACION Summary of this function goes here
%   Detailed explanation goes here

    caracteres = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'];
    b = caracter;
    b = imresize(b,[48 28]);
    d=[];
    for i = 1:length(caracteres) % Se realiza un ciclo desde 1 hasta el tama�o del arreglo donde se almacena el alfabeto y los numeros.
        a = imread(['.\..\..\Data\Caracteres_Letras_Numeros\',caracteres(i),'.bmp']); % Secarga la imagen correspondiente al caracter en la posicion posicion indicada por Abcdario del arreglo.
        a = imresize(a,[48 28]); % Se redimenciona la imagen a un tama�o definido.
        c = corr2(a, b); % Se establece la correlacion entre la imagen cargada y la imagen extraida de la placa.
        d = [d,c]; % Se almacena la correlacion encontrada.
    end
    
    [value, indice] = max(d);
    c = caracteres(indice);
    

end

