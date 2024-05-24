function plainText = railFenceDecrypt(cipherText, rails)
    %{
        Initialize the plainText variable (explained in details in the encryption).
    %}
    plainText = repmat(' ', 1, length(cipherText));

    %{
        This block calculates the number of characters in each rail.
        It first calculates the number of characters in the first and last rails,
            which are the same. Then calculates the number of characters in the rails in between.
    %}
    charsInRail = zeros(1, rails);
    charsInRail(1) = ceil(length(cipherText) / (2 * rails - 2));
    for i = 2:rails - 1
        charsInRail(i) = 2 * charsInRail(1);
    end
    charsInRail(rails) = charsInRail(1);

    % The same purpose as in the encryption part.
    idx = 1;
    direction = 1;

    % Begin the decryption proces . . .
    for row = 1:rails
        % Set the starting position for the current rail.
        i = row;

        % Loop to iterate over the characters in the cipherText that belong to the current rail.
        while i <= length(cipherText) && idx <= length(cipherText)
            % Add the current character from the cipherText to the plainText at the current position.
            plainText(i) = cipherText(idx);

            % Move to the next position in the cypherText.
            idx = idx + 1;

            % Determine the next position (above or below) using direction variable.
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

        % Reset our direction variable to begin the next rail.
        direction = 1;
    end

end
