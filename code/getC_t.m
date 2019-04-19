function [C] = getC(hum_GO_uni,f,DisValue,human_GO)
%GETC 此处显示有关此函数的摘要
%   此处显示详细说明
C = [];
for k = 1:519
    c = 0;
    part2 = [];Part2 = 0;
    for j = 1:size(hum_GO_uni,2)
        D1num = find(cellfun(@(x)isequal(x,hum_GO_uni{1,j}),human_GO) ~= 0); % 找 hum_GO_uni{1,j} 在 human_G O的第几列
        temp = DisValue(k,D1num);
        if temp <= 0
            part2 = [part2;f(1,j) / 2^abs(temp)];
        end
    end
    %Part2 = max(part2); % 用最大值表示
    Part2 = mean(part2); % 用平均值表示
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

