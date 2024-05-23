function cipherText = columnarTrainspositionEncrypt(plainText, transpositionKey)
    % Convert the plaintext and key to uppercase
    plainText = upper(plainText);
    transpositionKey = upper(transpositionKey);
    
    % Remove spaces from the plaintext
    plainText = strrep(plainText, ' ', '');
    
    % Calculate the number of columns and rows
    numRows = ceil(length(plainText) / length(transpositionKey));
    numColumns = length(transpositionKey);

    % Calculate the length of padding needed
    paddingLength = numColumns * numRows - length(plainText);

    % Pad the plaintext with 'X' characters
    plainText = [plainText, repmat('X', 1, paddingLength)];
    
    resultMatrix = char(numRows, numColumns);

    % Sort the characters of the key in ascending order
    [~, order] = sort(transpositionKey);
    
    currentIndexText = 1;
    cipherText = blanks(length(numRows * numColumns)); 
    currentIndexCipherText = 1;

    % Filling the matrix
    for i = 1:numRows
        for j = 1:numColumns
            resultMatrix(i, j) = plainText(currentIndexText);
            currentIndexText = currentIndexText + 1;
        end
    end

    % Extracting the ciphertext
    for i = 1:numColumns
        currentColumn = order(i);
        for j = 1:numRows
            cipherText(currentIndexCipherText) = resultMatrix(j, currentColumn);
            currentIndexCipherText = currentIndexCipherText + 1;
        end
    end
end