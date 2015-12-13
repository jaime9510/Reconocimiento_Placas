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
    
    
     
%     