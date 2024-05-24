%{
    Define a function that takes two arguments: plaintext and rails.
    It also returns the ciphertext.
%}
function cipherText = railFenceEncrypt(plainText, rails)
    %{
        Remove all spaces from our plaintext.
        strrep(): replace all occurrences of a specified character with another character.
    %}
    plainText = strrep(plainText, ' ', '');

    %{
        This line aims to initialize the cipherText variable.
        repmat(): stands for repeat matrix and it's job to repeat new matrix using placed one.
        The single space character means that the function will replicate a space character
            to create the initial value of cipherText times the length of the plainText.
        The '1' specifies the number of times the space character will be repeated along
            the row dimension.
    %}
    cipherText = repmat(' ', 1, length(plainText));

    %{
        idx: to keep track of the current position in the cipherText.
        direction: to determine wheater the next character should be add to the cipherText
            above or below the current position.
    %}
    idx = 1;
    direction = 1;

    % Begin the encryption process . . .
    for row = 1:rails
        i = row;
        % The while iterates over the characters in the plainText that belong
        %    to the current rail.
        while i <= length(plainText)
            % Add the current character from the plainText to the cipherText
            %   at the current position.
            cipherText(idx) = plainText(i);

            % Move to the next position in the cipherText array.
            idx = idx + 1;

            % This block determines the next position in the plainText array using
            %   the direction variable.
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

        % Reset our direction variable to be ready to the next rail.
        direction = 1;
    end

end
