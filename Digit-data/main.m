%% This is the main file to run digit classition 
clear all;
close all; 

% load images from training dataset
[imgTrain, labelTrain] = readImgTxt('training.txt');
[imgTest, labelTest] = readImgTxt('test.txt');
clc; 

%% Classification with positve images


fprintf('Classification with correlation coefficient (positve images)\n');
tic
% Classification with correlation coefficient (positve images)
resultsCorrPos = digitRecognitionCorr(imgTrain, labelTrain,...
                          imgTest,  labelTest);            
toc
T_corr_pos = cell2table(resultsCorrPos, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                 'Train_Test_index'});
                             
% determine the classfication perfomance for corr2 with positive images 
Accuracy('corr2 performance with positive images', T_corr_pos, imgTrain, imgTest);
% fprintf('Press Enter to continue\n');
% pause;

% Classification with cross correlation (positive images) 
fprintf('Classification with cross correlation (positve images)\n');

tic
resultsXCorrPos = digitRecognitionXCorr(imgTrain, labelTrain,...
                          imgTest,  labelTest);                       
toc

% convert cell to table to analysis the results later
T_xcorr_pos = cell2table(resultsXCorrPos, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                  'Train_Test_index'});
% determine the classfication perfomance for xcorr2 with positive images 
Accuracy('xcorr2 performance with positive images', T_xcorr_pos,imgTrain, imgTest);
% fprintf('Press Enter to continue\n');
% pause;

%% use the negatives of the training and test images instead of the positive images.
negativeImgTrain = pos2neg(imgTrain);
negativeImgTest = pos2neg(imgTest);

% classification with corr2 (negative images)
fprintf('Classification with correlation coefficient (negative images)\n');
resultsCorrNegative = digitRecognitionCorr(negativeImgTrain, labelTrain,...
                          negativeImgTest,  labelTest);            
toc
T_corr_neg = cell2table(resultsCorrNegative, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                 'Train_Test_index'});
% determine the classfication perfomance for corr2 with negative images 
Accuracy('corr2 performance with negative images', T_corr_neg, negativeImgTrain, negativeImgTest);
% fprintf('Press Enter to continue\n');
% pause;

% Classification with cross correlation for negative images   
fprintf('Classification with cross correlation (negative images)\n');
tic
resultsXCorrNegative = digitRecognitionXCorr(negativeImgTrain, labelTrain,...
                          negativeImgTest,  labelTest);                       
toc

% convert cell to table to analysis the results later
T_xcorr_neg = cell2table(resultsXCorrNegative, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                  'Train_Test_index'});
                              
% determine the classfication perfomance for xcorr2 with negative images 
Accuracy('xcorr2 performance with negative images', T_xcorr_neg, negativeImgTrain, negativeImgTest);
% fprintf('Press Enter to continue\n');
% pause;

%% use images that are slightly rotated in your training set 

rotateTrain  = rotateImage(imgTrain,-10); % rotate image 10 degree clockwise

fprintf('Classification with correlation coefficient (rotate images)\n');

% classification with corr2 (rotate images)
resultsCorrRotate = digitRecognitionCorr(rotateTrain, labelTrain,...
                          imgTest,  labelTest);            
toc
% convert cell to table to analysis the results later
T_corr_rotate = cell2table(resultsCorrRotate, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                 'Train_Test_index'});
% determine the classfication perfomance for corr2 with rotate images
Accuracy('corr2 performance rotated images', T_corr_rotate, rotateTrain , imgTest);

% fprintf('Press Enter to continue\n');
% pause;

% Classification with cross correlation (rotating images) 
fprintf('Classification with cross correlation (rotate images)\n');
tic
resultsXCorrRotate = digitRecognitionXCorr(rotateTrain, labelTrain,...
                          imgTest,  labelTest);                       
toc

% convert cell to table to analysis the results later
T_xcorr_rotate = cell2table(resultsXCorrRotate, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                  'Train_Test_index'});
% determine the classfication perfomance for xcorr2 with rotate images
Accuracy('Xcorr2 perfromance with rotate image', T_xcorr_rotate, rotateTrain, imgTest);
% fprintf('Press Enter to continue\n');
% pause;

%% use images with some noise added in training set 
noiseTrain  = gausNoise(imgTrain, 1);  % add gaussian noise to image with mean of 1

fprintf('Classification with correlation coefficient (images with gaussian noise)\n');

% classification with corr2 (gaussian noise)
resultsCorrNoise = digitRecognitionCorr(noiseTrain, labelTrain,...
                          imgTest,  labelTest);            
toc
T_corr_noise = cell2table(resultsCorrNoise, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                 'Train_Test_index'});
% determine the classfication perfomance for corr2 with noise images
Accuracy('corr2 performance noise images', T_corr_noise, noiseTrain , imgTest);


% Classification with cross correlation (noise images) 
fprintf('Classification with cross correlation (images with gaussian noise)\n');
tic
resultsXCorrNoise = digitRecognitionXCorr(noiseTrain, labelTrain,...
                          imgTest,  labelTest);                       
toc
% convert cell to table to analysis the results later
T_xcorr_noise = cell2table(resultsXCorrNoise, 'VariableNames', {'CorrValue',...
                                  'TrainLabel',...
                                  'TestLabel',...
                                  'Train_Test_index'});
% determine the classfication perfomance for xcorr2 with noise images
Accuracy('Xcorr2 perfromance with noise image', T_xcorr_noise, noiseTrain, imgTest);
% fprintf('Press Enter to continue\n');
% pause;

