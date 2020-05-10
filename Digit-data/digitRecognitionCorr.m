function results = digitRecognitionCorr(imgTrain, labelTrain,...
                                                  imgTest, labelTest)
                                              
% Determine the correlation coefficeint between the given test image and the
% traning images in order to detect the label for the test image.
% 
%
% Inputs
%       imgTrain:       dataset of the training images
%       labelTrain:     labels of the training images
%       imgTest:        dataset of the test images
%       labelTest:      labels of the test images
%
% Outputs
%       results{ 1 }:   containes correlation coefficients for the matched image 
%       results{ 2 }:   containes the matched label for  the training image
%       results{ 3 }:   containes the matched label for the testing image
%       results{ 4 }:   containes index of the match images of traning and
%                       tesing images 
                                              
                                              
                                              
% size of traning and testing set 
sizeTrain = length(labelTrain);
sizeTest = length(labelTest);
detectedTainingLabel = -1;  % initialise detected train label to -1
detectedTestLabel = -2;   % initialise detected test label to -2 
indexMatchTrain = -1;     % initialise the index of match image in traning to -1
indexMatchTest = -1;      % initialise the index of the match image in testing to -1


count = 0; % keep tracking of which index in traning and testing images matched
for i = 1 : sizeTest
    threshCorr = 0;  % intialise the maximum corr2 to zero
    for j = 1 : sizeTrain
        % show images
        testPattern = imgTest{i};
        refPattern = imgTrain{j};
        % remove dc offser from the image 
        testPattern = testPattern - mean(testPattern(:));
        refPattern = refPattern - mean(refPattern(:));
        
        CorrValue = corr2(testPattern,refPattern);  % determine the corr2 

        % if the corr2 exceed the threshCorr then hold the calculated
        % corr2
        if CorrValue > threshCorr
            threshCorr = CorrValue;
            detectedTainingLabel = labelTrain(j); % record the matched training label
            detectedTestLabel = labelTest(i);  % the matched testing label
            indexMatchTrain = j;   % index of the matched training image
            indexMatchTest = i;    % index of the matched testing image

        end
    end
   count = count + 1;   % increament the index 
   results{count,1} = CorrValue;  % maximum of the matched xcorr
   results{count,2} = detectedTainingLabel; % the matched training label 
   results{count,3} = detectedTestLabel;  % the matched testing label
   results{count,4} = [indexMatchTrain,indexMatchTest];  % index of the matched training and testing image
end



