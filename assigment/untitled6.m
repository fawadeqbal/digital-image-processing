% Re% Read the image, discarding colormap information
I = imread('./images/Group-1-3-5.tif');
I=I(:,:,1:3);
function filteredImage = LMSFilter(inputImage, filterSize, stepSize)
  % Pad the image to handle boundaries
  paddedImage = padarray(inputImage, [floor(filterSize/2) floor(filterSize/2)], 'symmetric');
  
  % Get image dimensions
  [rows, cols] = size(paddedImage);
  
  % Initialize filtered image and filter weights
  filteredImage = zeros(rows - filterSize + 1, cols - filterSize + 1);
  filterWeights = ones(filterSize^2, 1);
  
  % Iterate through each pixel (excluding borders due to padding)
  for i = 1+floor(filterSize/2):rows-floor(filterSize/2)
    for j = 1+floor(filterSize/2):cols-floor(filterSize/2)
      % Extract image neighborhood
      neighborhood = paddedImage(i-floor(filterSize/2):i+floor(filterSize/2), j-floor(filterSize/2):j+floor(filterSize/2));
      
      % Calculate filter output
      filterOutput = sum(neighborhood(:) .* filterWeights);
      
      % Calculate error (desired signal is the original pixel value)
      error = inputImage(i, j) - filterOutput;
      
      % Update filter weights
      filterWeights = filterWeights + stepSize * error * neighborhood(:);
    end
  end
  
  % Remove padding from filtered image
  filteredImage = filteredImage(1:size(inputImage,1), 1:size(inputImage,2));
end

% Convert to grayscale (optional, for the filter)
Igray = rgb2gray(I); % Convert to grayscale for LMS filter (optional)

% Define filter parameters (adjust as needed)
filterSize = 3; % Size of the LMS filter (e.g., 3x3)
stepSize = 0.01; % Step size for LMS adaptation

% Apply LMS filter (using grayscale for illustration)
% You can modify this to use I instead of Igray if preferred
filteredGray = LMSFilter(Igray, filterSize, stepSize);

% Convert back to RGB if filtered grayscale (optional)
if (isequal(Igray, I))
  filtered = filteredGray;
else
  filtered = repmat(filteredGray, [1 1 3]); % Replicate for RGB channels
end

% Display the original image and the filtered image
figure;
subplot(121); imshow(I); title('Original Image');
subplot(122); imshow(filtered); title('LMS Filtered (First 3 Channels)');
