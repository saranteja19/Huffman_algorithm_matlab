function sourceDecodedCharcters = huffmannDecoder(sourceCodedBits,mappingTable)
tempBitStr=  " ";                                                        % empty temporary string
sourceDecodedCharcters=" ";                                              % empty decoded characters string
ii = 1;
while ii<=length(sourceCodedBits)
    %append one bit at a time to temporary string starting from ii position
    %till if loop condition is met
    tempBitStr=tempBitStr + string(sourceCodedBits(1,ii));
    tempBitStr=char(tempBitStr);
    tempBitStr=string(tempBitStr(tempBitStr~=' '));
    %if the temporary string matches with certain character mapping bits
    %strings append that character to decoded characters string
if ismember(tempBitStr,mappingTable(:,2))%check matching
    [~,b]=ismember(tempBitStr,mappingTable(:,2));                       %check matching index
    sourceDecodedCharcters=sourceDecodedCharcters + mappingTable(b,1);  %append character
    tempBitStr=" ";                                                     %reset temporary string empty
end
ii=ii+1;
end
sourceDecodedCharcters=char(sourceDecodedCharcters);                    %string to character aray
sourceDecodedCharcters = string(sourceDecodedCharcters(2:end));         %eliminate initial blank space
end
