function [f] = builtaHIB_getf(hum_GO_uni,hum_GO);
%
%  ����hum_GO��ÿ��GO���ֵĴ���
f = []; %
sizenum = size(hum_GO,2);
for i = 1:size(hum_GO_uni,2)
    [hang lie]=find(cellfun(@(x) strcmp(x,hum_GO_uni(1,i)),hum_GO)); % hum_GO_uni(1,j)��hum_GO�г��ֵ�λ��
    %     temp = size(lie,2);
    %     f = [f,temp/sizenum];
    f = [f,size(lie,2)];
end
end

