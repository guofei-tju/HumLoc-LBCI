function [C] = getC(hum_GO_uni,f,DisValue,human_GO)
%GETC �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
C = [];
for k = 1:519
    c = 0;
    part2 = [];Part2 = 0;
    for j = 1:size(hum_GO_uni,2)
        D1num = find(cellfun(@(x)isequal(x,hum_GO_uni{1,j}),human_GO) ~= 0); % �� hum_GO_uni{1,j} �� human_G O�ĵڼ���
        temp = DisValue(k,D1num);
        if temp <= 0
            part2 = [part2;f(1,j) / 2^abs(temp)];
        end
    end
    %Part2 = max(part2); % �����ֵ��ʾ
    Part2 = mean(part2); % ��ƽ��ֵ��ʾ
    Dist = [];
    for j = 1:size(hum_GO_uni,2)
        D1num = find(cellfun(@(x)isequal(x,hum_GO_uni{1,j}),human_GO) ~= 0);
        Dist = [Dist;DisValue(k,D1num)];
%         if Dist == 0
%             c = c + f(1,j);
%         elseif Dist > 0
%             c = c + 0;
%         end
    end
    if ~isempty(find(Dist <= 0))
        c = Part2;
    end
    %k
    C = [C,c];
end
end

