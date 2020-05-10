function noiseImg  = gausNoise(image, meanNoise)

% add  gaussian noise to image 
% Inputs: 
%          image:        positive images
%          gausNoise:    gaussian mean
%
% Output: 
%          noiseImg:  images with added noise  
%

noiseImg = {};
for i = 1 : length(image)
    img = imnoise(image{i},  'gaussian', meanNoise); % add gaussian nosie with given mean
    noiseImg{i} = img;
end