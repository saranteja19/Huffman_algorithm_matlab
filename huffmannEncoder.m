function [sourceCodedBits,mappingTable] = huffmannEncoder(txtData)

txtDataString = cell2mat(reshape(txtData,1,[]))';                           %TURNS WHOLE .TXT FILE INTO ONE LINE

unqDataLetters = unique(txtDataString);                                     % ELIMINATE REPEATING LETTERS

probLetter = histc(txtDataString,unqDataLetters)/length(txtDataString);     %PROBABILITY OF EACH CHARACTER

mapMatrx = fliplr([unqDataLetters,string(probLetter)]);                     %CLUB PROBABILTY WITH THEIR CHARACTER

sortedMapMat = (sortrows(mapMatrx,"descend"));                              %SORT
[c,~] = size(sortedMapMat);

sortedMapMat = [sortedMapMat(:,1),string(1:c)',sortedMapMat(:,2)];          %ASSIGN CUSTOM INDEXS
%% PROBABILITY TABLE
for ii=1:c-2
    tempMat = sortedMapMat(:,1:2);                                          %EXTRACT NEW PROBABILTY AND INDEX AFTER EVERY LOOP INTO A TEMPORARY MATRIX
    tempMat(c-ii,1) = string(sum(str2double(tempMat(c-ii:c+1-ii,1))));      % SUM OF LEAST 2 PROBABILITY
    tempMat(c-ii,2) = string(tempMat(c+1-ii,2));
    tempMat(c+1-ii,1:2) = 0;
    tempMat = circshift(tempMat,1+ii);
    sortedMapMat=[sortrows(tempMat,1,"descend"),sortedMapMat];              %SORT
end

[k,~] = size(sortedMapMat);

%% PATH TRACING
a=1;
symbol=repmat(" ",k,1);
for n =2:2:length(sortedMapMat')
    index=[str2double(sortedMapMat(a,n)) (str2double(sortedMapMat(a+1,n)))];%LIST LAST TWO INDICES
    symbol(index(1))=symbol(index(2))+symbol(index(1));                     %ASSIGN 0 TO LAST NUT ON BIT
    symbol(index(1))=symbol(index(1))+string(0);
    symbol(index(2))=symbol(index(2))+string(1);                            %ASSIGN 1 TO LAST NUT ON BIT
    a=a+1;
end

symbol=char(symbol);

%ELIMINATE BLANK SPACES FROM SYMBOL
for m = 1:size(symbol,1)
    temp=symbol(m,:);
    mappingTableBits(m,:)=string(temp(temp~=' '));
end

mappingTable = [unqDataLetters,mappingTableBits];                           % CLUB CHARACTER TO THEIR RESPECTIVE MAPPING BITS
txtDataString = string(txtDataString);
%% ENCODING

for kk=1:length(txtDataString)
    for ll = 1:length(mappingTable)
        if txtDataString(kk,:) == mappingTable(ll,1)                        % CHECK FOR CHARACTER
            txtDataString(kk,:)= mappingTable(ll,2);                        % REPLACE CHARACTER WITH THEIR MAPPING BITS
        end
    end
end
%CONVERT COLOUMN CHAR ARRAY TO A LINEAR BITS VECTOR
tempDataString = reshape(char(txtDataString'),1,[]);
sourceCodedBits = tempDataString(tempDataString~=' ')*1-48;

end
