function [f] = builtaHIB_getf(hum_GO_uni,hum_GO);
%
%  计算hum_GO中每个GO出现的次数
f = []; %
sizenum = size(hum_GO,2);
for i = 1:size(hum_GO_uni,2)
    [hang lie]=find(cellfun(@(x) strcmp(x,hum_GO_uni(1,i)),hum_GO)); % hum_GO_uni(1,j)在hum_GO中出现的位置
    %     temp = size(lie,2);
    %     f = [f,temp/sizenum];
    f = [f,size(lie,2)];
end
end

