function [G1alltoG2] = findLCA_getcompar(p1,p2);
%,G2alltoG1
%  �õ�GO1��GO2 �Ĺ�ͬ����
% G1alltoG2 ��¼GO2��ĳ�������GO1���и����н�����λ��
G1alltoG2 = [];G2alltoG1 = [];
for j = 1:size(p1,1) - 1   %�Ƚϸò㸸��GO����һ��GO���и���Ľ���
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
% for j = 1:size(p2,1) - 1   %�Ƚϸò㸸��GO����һ��GO���и���Ľ���
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

