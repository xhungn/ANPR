%% Step 2. Extract all the letters/characteristics
function plateNumber = step2(im,h)
Iprops=regionprops(im,'BoundingBox','Area', 'Image');
count = numel(Iprops);

plateNumber=[]; % Initializing the variable of number plate string.

for i=1:count
   ow = length(Iprops(i).Image(1,:));
   oh = length(Iprops(i).Image(:,1));
   if ow<(h/2) & oh>(h/3)
       % Step 3. Read/recognize the variables
       letter=readLetter(Iprops(i).Image); % Reading the letter corresponding the binary image 'N'.
       subplot(1,length(Iprops),i)
            imshow(Iprops(i).Image);
       plateNumber=[plateNumber letter]; % Appending every subsequent character in plateNumber variable.
   end
end