function cipherText = railFenceEncrypt(plainText, rails)
    % Remove spaces from plaintext
    plainText = strrep(plainText, ' ', '');

    % Preallocate the cipherText variable
    cipherText = repmat(' ', 1, length(plainText));
    
    % Initialize variables
    idx = 1;
    direction = 1;
    
    % Loop through each rail
    for row = 1:rails
        i = row;
        while i <= length(plainText)
            cipherText(idx) = plainText(i);
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