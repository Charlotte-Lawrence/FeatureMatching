DataDir = './Data/';

FeatureFileName1 = sprintf('%sQuerySIFTFeatures.mat',DataDir);
FeatureFileName2 = sprintf('%sTargetSIFTFeatures.mat',DataDir);

load(FeatureFileName1,'FeatureDescriptors');
Img1FeatureDescriptors = FeatureDescriptors;

load(FeatureFileName2,'FeatureDescriptors');
Img2FeatureDescriptors = FeatureDescriptors;

[FeatureDescriptorSize,NumFeatures1] = size(Img1FeatureDescriptors);
[FeatureDescriptorSize,NumFeatures2] = size(Img2FeatureDescriptors);

%%% calculate SSDs
SSDMatrix = zeros(NumFeatures1,NumFeatures2);
%%% missing lines from here

% iterate through features
for i = 1:NumFeatures1
    for j = 1:NumFeatures2
        % Assign to matrix:
        % calculate sum of squared difference between the ith feature and the jth target feature
        difference = Img1FeatureDescriptors(:, i) - Img2FeatureDescriptors(:, j);
        SSDMatrix(i, j) = sum(difference(:).^2);
    end
end
%%% missing lines till here

save SSDMatrix.mat SSDMatrix;
