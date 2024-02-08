function matchingIndex = FindSingleCorr(SSDRow, threshold)
    % Find the index of the matching target feature based on the given SSD row and threshold
    
    % Find which elements smaller than the threshold
    % Creates logical of 0 or 1, where 1 means it is below threshold
    belowThreshold = SSDRow < threshold;
    
    % Find the minimum ssd value and its index
    [minSSD, minIndex] = min(SSDRow);
    
    % Check if there is any element not zero
    if any(belowThreshold)

        % Set the current min to empty to exclude it
        SSDRow(minIndex) = [];

        % Find new smallest (excluding current smallest)
        secondSmallest = min(SSDRow);

        % Check if smallest is less than 0.8 * second
        if minSSD < 0.8 * secondSmallest
            % Matching target feature found
            matchingIndex = minIndex;
            return;
        end
    end
    
    % No matching target feature found
    matchingIndex = 0;
end
