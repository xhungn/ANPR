function [im,h] = step1(im)
%% Step 1. Detecting the number plate - 

im = imresize(im, [480 NaN]);

subplot(2,1,1)
    imshow(im);

%% Pre-processing
imbinary = imbinarize(rgb2gray(im));
im = edge(rgb2gray(im));

%% Dilate, fill then erode
im = imdilate(im, strel('diamond', 2));
im = imfill(im, 'holes');
im = imerode(im, strel('diamond', 10));

%% Getting the shape and area of the license plate in regards to the car
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
area = Iprops.Area;
count = numel(Iprops);
maxa= area;
boundingBox = Iprops.BoundingBox;
for i=1:count
   if maxa<Iprops(i).Area
       maxa=Iprops(i).Area;
       boundingBox=Iprops(i).BoundingBox;
   end
end 

%% Use the binary image, crop out the area of interest that was determined using the morphological method
im = imcrop(imbinary, boundingBox);
im = imresize(im, [240 NaN]); % Resize number plate to 240 NaN
%im = imopen(im, strel('rectangle', [4 4]));% Clear dust

% Remove some object if its width is too long or too small than 500
im = bwareaopen(~im, 500);

[h, w] = size(im);

subplot(2,1,2)
    imshow(im)
