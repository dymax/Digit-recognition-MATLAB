function negativeImage = pos2neg(image)

% convert postive images to negative image 
% Inputs: 
%          image:   positive image(s)
%
% Output: 
%          negativeImage: negative images     
%


negativeImage = {}; % initialise negativeImage with empty cell
for i = 1 : length(image)
    negativeImage{i} = 1 - image{i};  % convert postive image to negativ image
end