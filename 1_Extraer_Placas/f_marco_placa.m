function [h,k,p]=f_marco_placa(g,b);


        h=uint8(bwconvhull(g,'objects'))*255; % envoltura convexa sobrevive
        [filas,colu]=find(h==255);
        fila_m=min(filas(:));
        fila_x=max(filas(:));
        colu_m=min(colu(:));
        colu_x=max(colu(:));
        h(fila_m:fila_x,colu_m:colu_x)=255;
               
        [fil,col,cap]=size(b);
        j=reshape([h,h,h],[fil,col,cap]);
        
        k=b;
        k(find(j==0))=0; 
        p=k(fila_m:fila_x,colu_m:colu_x,:);
        