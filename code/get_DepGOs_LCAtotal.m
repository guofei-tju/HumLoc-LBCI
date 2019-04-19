% path1 = 'D:\BUILTGOTREE\87listGOTree';
% path_87 = [];
% for i=1:87
%     fasta_file_name = [path1 '\' num2str(i-1) '.mat'];
%     path_87 = [path_87;cellstr(fasta_file_name)];
% end
path1 = 'C:\Users\shenyinan\Desktop\预测结果\519Tree\';
path_519 = [];
for i=1:519
    fasta_file_name = [path1 '\' num2str(i-1) '.mat'];
    path_519 = [path_519;cellstr(fasta_file_name)];
end
path2 = 'D:\BUILTGOTREE\1628GOTree';
path_1628 = [];
for i=1:1628
    fasta_file_name = [path2 '\' num2str(i-1) '.mat'];
    path_1628 = [path_1628;cellstr(fasta_file_name)];
end
%%% 得到树的深度
%Dep_total_tree = [];
% DisValue = [];
% for i = 1:153
%     temp = [];
%     load(path_153{i,1});
%     p1 = p;
%     sizei = size(p1,1) - 1;
%     for j = 1:10354
%         if LCAtotal(i,j) == 0
%             temp = [temp,-1];
%         else
%             load(path_10354{j,1});
%             p2 = p;
%             sizej = size(p2,1) - 1;
%             temp = [temp,max(sizei,sizej) - LCAtotal(i,j)];
%         end
%         j
%     end
%      DisValue = [DisValue;temp];
%     i
% end
%%%
depgos = 0;
DepGOs = [];
LCAtotal = [];
for i = 1:519
    i
    load(path_519{i,1});
    p1 = p;
    n = strread(cell2mat(p1(1,1)),'%s','delimiter','G');
    n(1) = [];
    DEPgos = [];
    lcpar = [];
    for j = 1:1628
        lca = [];
        load(path_1628{j,1});
        p2 = p;
        pardep = [];
        pardep(1,1) = 0;
        [G1alltoG2] = findLCA_getcompar(p1,p2);
        if ~isempty(G1alltoG2) % 如果两个又共同祖先，判断GOS在整个关系中的位置
            for k = 1:size(G1alltoG2,1)
                lca = [lca;max(G1alltoG2(k,:))]; % 两个值中大的那个就是共同祖先的位置
            end
            [Lca,loc] = min(lca); % 最小共同祖先的位置
            pardep(1,1:Lca) = 1;
            temp = find(G1alltoG2(loc,:)==Lca);
            if temp==2
                if  G1alltoG2(loc,1) == 1
                    depgos = Lca;
                else
                    depgos = 1;
                end
            end
        else  %如果两个没有共同祖先的话
            pardep = pardep; % 第均为0
            depgos = 1;
        end
        lcpar = [lcpar,sum(pardep(1,:))];
        DEPgos = [DEPgos,depgos];
        clear p;
        clear p2;
        j
    end
    DepGOs = [DepGOs;DEPgos];
    LCAtotal = [LCAtotal;lcpar];
    clear p1;
end
% save('153_DepGOs.mat','DepGOs');
% save('153_LCAtotal.mat','LCAtotal');

% for i = 1:153
%     for j = 1:10354
%         if LCAtotal(i,j) == 0 && DepGOs(i,j) == 0
%             DepGOs(i,j) = 1;
%         end
%     end
%     i
% end
%
