topx=zeros(1,40);
topy=zeros(1,40);
for k=1:40
    imgname=strcat('~/Documents/mcm/frame',num2str(k),'.jpg');
	image = imread(imgname);
    tmp=0;
    for i=840:900
        for j=1450:1700
            if image(i,j,1)<220 && image(i,j,2)<205 && image(i,j,3)<175 && j>tmp
                tmp=j;
                topx(k)=i;
                topy(k)=j;
            end
        end
    end  
end