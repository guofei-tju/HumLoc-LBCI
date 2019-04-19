%
%get the relative GO terms set of a protein
%
function [ result ] = getGOterms( protein,A)
result = [];
coll = size(A,2);
for j = 1:coll
    if isequal(cell2mat(protein),cell2mat(A(1,j)))
        result = [result,A(2,j)];
    end
end
end
