function decryptedText = columnarTrainspositionDecrypt(cipherText, transpositionKey)
    % Convert our key to UPPERCASE.
    transpositionKey = upper(transpositionKey);

    % Calculate the number of rows and columns as in the encryption.
    numRows = ceil(length(cipherText) / length(transpositionKey));
    numColumns = length(transpositionKey);

    % Create empty matrix to receive the character in it
    %   (before extracting the final text).
    resultMatrix = char(numRows, numColumns);

    % Sort the characters and save the indices in the order variable.
    [~, order] = sort(transpositionKey);

    % Indx to traverse the decryptedText.
    currentIndexText = 1;

    % Initialize empty string that represents our final result.
    decryptedText = blanks(length(numRows * numColumns));

    % Initialize the index for traversing the cipherText.
    currentIndexCipherText = 1;

    % Fill the resultMatrix with characters from the encryptedText (cipherText).
    for i = 1:numColumns
        currentColumn = order(i);
        for j = 1:numRows
            resultMatrix(j, currentColumn) = cipherText(currentIndexCipherText);
            currentIndexCipherText = currentIndexCipherText + 1;
        end
    end

    % Time to extract our plainText again . . .
    for i = 1:numRows
        % This nested loop constructs the decryptedText by reading the matrix row-wise.
        for j = 1:numColumns
            decryptedText(currentIndexText) = resultMatrix(i, j);
            currentIndexText = currentIndexText + 1;
        end
    end

    % Convert our final result to lowercase.
    decryptedText = lower(decryptedText);
end
