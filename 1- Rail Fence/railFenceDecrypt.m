function plainText = railFenceDecrypt(cipherText, rails)
    % Preallocate the plainText variable
    plainText = repmat(' ', 1, length(cipherText));
    
    % Calculate the number of characters in each rail
    charsInRail = zeros(1, rails);
    charsInRail(1) = ceil(length(cipherText) / (2 * rails - 2));
    for i = 2:rails-1
        charsInRail(i) = 2 * charsInRail(1);
    end
    charsInRail(rails) = charsInRail(1);
    
    % Initialize variables
    idx = 1;
    direction = 1;
    
    % Loop through each rail
    for row = 1:rails
        i = row;
        while i <= length(cipherText) && idx <= length(cipherText)
            plainText(i) = cipherText(idx);
            idx = idx + 1;
            if row == 1 || row == rails
                i = i + (rails - 1) * 2;
            elseif direction == 1
                i = i + (rails - row) * 2;
                direction = 0;
            else
                i = i + (row - 1) * 2;
                direction = 1;
            end
        end
        direction = 1;
    end
end