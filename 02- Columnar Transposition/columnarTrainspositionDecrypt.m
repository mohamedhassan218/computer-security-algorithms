function decryptedText = columnarTrainspositionDecrypt(cipherText, transpositionKey)
    transpositionKey = upper(transpositionKey);

    numRows = ceil(length(cipherText) / length(transpositionKey));
    numColumns = length(transpositionKey);

    resultMatrix = char(numRows, numColumns);

    [~, order] = sort(transpositionKey);
    
    currentIndexText = 1;
    decryptedText = blanks(length(numRows * numColumns)); 
    currentIndexCipherText = 1;
    
    % Filling the matrix
    for i = 1:numColumns
        currentColumn = order(i);
        for j = 1:numRows
            resultMatrix(j, currentColumn) = cipherText(currentIndexCipherText);
            currentIndexCipherText = currentIndexCipherText + 1;
        end
    end

    % Creating the decrypted text from the matrix
    for i = 1:numRows
        for j = 1:numColumns
            decryptedText(currentIndexText) = resultMatrix(i, j);
            currentIndexText = currentIndexText + 1;
        end
    end

    decryptedText = lower(decryptedText);
end