function cipherText = columnarTrainspositionEncrypt(plainText, transpositionKey)
    % Convert the plaintText and transpositionKey to UPPERCASE.
    plainText = upper(plainText);
    transpositionKey = upper(transpositionKey);

    % Remove spaces from the plaintext.
    plainText = strrep(plainText, ' ', '');

    %{
        Calculate the number of needed rows and columns.
        Columns equals to the length of the key.
        Rows calculated by dividing the length of plainText
            by numColumns and rounding up to the nearest whole number using ceil() function.
    %}
    numRows = ceil(length(plainText) / length(transpositionKey));
    numColumns = length(transpositionKey);

    %{
        Now, we need to know how many empty items will be in our matrix.
        We gonna fill them all (padding) with 'X'.
    %}
    paddingLength = numColumns * numRows - length(plainText);
    plainText = [plainText, repmat('X', 1, paddingLength)];

    % Create an empty matrix with 'numRows' rows and 'numColumns' columns.
    resultMatrix = char(numRows, numColumns);

    % Sort the characters in the key and returns the indices
    %   of the sorted order in the 'order' variable.
    [~, order] = sort(transpositionKey);

    % Initialize the index that we'll use to traverse the plainText.
    currentIndexText = 1;

    % Initialize an empty string of the required length for cipherText.
    cipherText = blanks(length(numRows * numColumns));

    % Initilize the index that we'll use to fill the cipherText.
    currentIndexCipherText = 1;

    % This block just fill the resultMatrix with characters from the plainText.
    for i = 1:numRows
        for j = 1:numColumns
            resultMatrix(i, j) = plainText(currentIndexText);
            currentIndexText = currentIndexText + 1;
        end
    end

    %{

        Now, it's time to extract our cipherText . . .
        This block constructs the final cipher text by reading the matrix
            column-wise based on the sorted order of the transposition key.
    %}
    for i = 1:numColumns
        % Get the index of the current column.
        currentColumn = order(i);

        % Iterate over each row in the current column.
        for j = 1:numRows
            % Characters from the matrix are copied to `cipherText` in order.
            cipherText(currentIndexCipherText) = resultMatrix(j, currentColumn);

            % Increment the indx to track the next position.
            currentIndexCipherText = currentIndexCipherText + 1;
        end

    end

end
