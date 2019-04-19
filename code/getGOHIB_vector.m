% % load('D:\MATLAB 2017a\wei\3106_data\GO\all_GO_pro.mat');% all protein-GO matrix 2*439596(A)
% % load('D:\BUILTGOTREE\human_GO_10354.mat') % human_GO 1 * 10354
 load('E:\桌面new里的文档\原始GO相关\1628_GO_list.mat');%c
  load('E:\桌面new里的文档\原始GO相关\all-C-GO.mat');% C_GO
% % load('D:\自己建的数据集\GO_data sets\16classes\120_1628_depGOs_depLCA.mat');
%load('C:\Users\shenyinan\Desktop\k=2\1021_DeoGOs_LCAtotal.mat');
%load('D:\new\GO_data sets\16classes\all_uni_name.mat');
 human_GO = c';
  A = C_GO';
 DisValue = DepGOs - LCAtotal; 
 human_list = alluni_name';
 col = size(human_list,2);
HIB = [];
for i = 1:3106
    hum_GO = [];hum_GO_uni = [];
    protein = human_list(1,i);
    hum_GO = getGOterms(protein,A);
    hum_GO_uni = unique(hum_GO);
    % 找每个GO在 距离矩阵中对应的结果
    % 判断是否为0 ，计算Ct,s
    if ~isempty(hum_GO_uni)
        [f] = builtaHIB_getf(hum_GO_uni,hum_GO);
        [C] = getC_t(hum_GO_uni,f,DisValue,human_GO);
    else
        C = zeros(1,519);
    end
    HIB = [HIB;C];
    i
end
% Disvalue = [];
% for i = 1:87
%     temp = [];
%     for j = 1:10354
%         if LCAtotal(i,j) == 0
%             temp = [temp,-1];
%         else
%             temp = [temp,Dep_total_tree(i,j) - LCAtotal(i,j)];
%         end
%     end
%     Disvalue = [Disvalue;temp];
% end

