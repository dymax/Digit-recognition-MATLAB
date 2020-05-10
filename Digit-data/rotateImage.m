function rotateImg  = rotateImage(image,angleRotate)

% rotate image 
% Inputs: 
%          image:         positive images
%          angleRotate:   angle degrees that image should be rotated 
%
% Output: 
%          rotateImg:  rotated images    
%



rotateImg = {};      % initialise negativeImage with empty cell

for i = 1 : length(image)
    % rotate image with crop flag to avoid chnaging the image size
    img = imrotate(image{i}, angleRotate,'crop');
    rotateImg{i} = img;

end