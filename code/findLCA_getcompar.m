function [G1alltoG2] = findLCA_getcompar(p1,p2);
%,G2alltoG1
%  得到GO1和GO2 的共同父类
% G1alltoG2 记录GO2的某个父类跟GO1所有父类有交集的位置
G1alltoG2 = [];G2alltoG1 = [];
for j = 1:size(p1,1) - 1   %比较该层父类GO和另一个GO所有父类的交集
    n2 = strread(cell2mat(p1(j,1)),'%s','delimiter','G');
    n2(1) = [];
    for k = 1:size(p2,1) - 1
        temp = [];
        m1 = strread(cell2mat(p2(k,1)),'%s','delimiter','G');
        m1(1) = [];  
        comm = intersect(m1,n2);
        if  ~isempty(comm)
            temp = [j,k];
            G1alltoG2 = [G1alltoG2;temp];
        end
    end
end
% for j = 1:size(p2,1) - 1   %比较该层父类GO和另一个GO所有父类的交集
%     n1 = strread(cell2mat(p2(j,1)),'%s','delimiter','G');
%     n1(1) = [];
%     for k = 1:size(p1,1) - 1
%         temp = [];
%         m2 = strread(cell2mat(p1(k,1)),'%s','delimiter','G');
%         m2(1) = [];
%         con = intersect(n1, m2);
%         if  ~isempty(con)
%             temp = [k,j];
%             G2alltoG1 = [G2alltoG1;temp];
%         end
%     end
% end
end

