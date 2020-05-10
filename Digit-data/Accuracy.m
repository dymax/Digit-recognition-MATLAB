function [acc, NumCorrectDetection, NumWrongDetection] = Accuracy(...
                                                                    funcStr,...
                                                                    Table,...
                                                                    imgTrain,...
                                                                    imgTest)


% This function determine the classification accuracy, number of images 
% that classified correctly and number of images didnot classified correctly
% Inputs:
%       funcStr (string):   expression to print on command window 
%       Table (table):      results in table format
%       imgTrain:           images from traning set 
%       imgTest:            images from testing set 
% Outputs: 
%       acc:                 classification accuracy 
%       NumCorrectDetection: number of images that classified correctly
%       NumWrongDetection:   number of images that didn't classified correctly
%       







fprintf('Classication performane with %s:\n', funcStr);
fprintf('================================================================\n');

% Number of total correct digit classifications
NumCorrectDetection = sum(Table.TestLabel == Table.TrainLabel);
fprintf('\tNumber of correct classifications: %f\n', NumCorrectDetection);

% Number of total wrong digit classifications
NumWrongDetection = sum(Table.TestLabel ~= Table.TrainLabel);
fprintf('\tNumber of wrong classifications: %f\n', NumWrongDetection);

% determine the classification error 
acc = NumCorrectDetection/ length(Table.TestLabel);
fprintf('\tClassification accuracy with corr2: %%%f\n\n', acc*100);

% extract the image indexes that wrongly classified 
indexWrong = find(Table.TestLabel ~= Table.TrainLabel);

% index of the traning data 
idxTrain =  Table.Train_Test_index(:,1);

% index of the testing data 
idxTest =  Table.Train_Test_index(:,2);
TrainIndex = idxTrain(indexWrong);
TestIndex = idxTest(indexWrong);

% show all images that wrongly classified 
for i = 1:length(TestIndex)
    if (TestIndex(i) ~= -1  && TrainIndex(i) ~= -1) 
        imageListTrain{i} = imgTrain{TrainIndex(i)};
        imageListTest{i} = imgTest{TestIndex(i)};
    else
        break
    end
end

if (TestIndex(i) ~= -1  && TrainIndex(i) ~= -1)
figure; 
subplot(1,2,1); montage(imageListTrain); title('Train image');
subplot(1,2,2); montage(imageListTest); title('Test image');
end
