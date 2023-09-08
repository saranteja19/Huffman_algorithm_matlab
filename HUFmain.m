clc;
clearvars;
close all;

txtData = importdata("saran.txt");                                          % IMPORT DATA FROM .TXT FILE

%% HUFFMANN ENCODING

[sourceCodedBits,mappingTable] = huffmannEncoder(txtData);

%% HUFFMANN DECODING

sourceDecodedCharcters = huffmannDecoder(sourceCodedBits,mappingTable);
