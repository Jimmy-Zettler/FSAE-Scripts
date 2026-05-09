clear; clc;

data = readtable('Bus Data.csv', 'NumHeaderLines', 1);  % SavvyCAN csv
DLC = table2array(data(:,6)); % Data length codes

%%
fps = 5000; % Frames per second from SavvyCAN
baud = 1000000; % CAN baud rate

avgDLC = sum(DLC) / length(DLC);
avgBits = 47 + avgDLC*8;
avgLoad = avgBits*fps*100/baud;
fprintf('Average CAN Bus Load: %.2f%%\n', avgLoad)

