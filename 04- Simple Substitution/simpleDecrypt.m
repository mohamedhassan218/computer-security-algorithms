function [decryptedText] = simpleDecrypt(encryptedText, shift)
    % Convert our encrypted to lowercase.
    encryptedText = lower(encryptedText);

    % Remove spaces.
    encryptedText = encryptedText(encryptedText ~= ' ');

    % Initialize an empty string.
    decryptedText = '';

    % alphabet = "abcdefghijklmnopqrstuvwxyz".
    alphabet = 'a':'z';

    % Ensure the shift value wraps around the alphabet.
    shiftValue = mod(shift, 26);

    % Let's decrypt . . .
    for i = 1:length(encryptedText)

        if ismember(encryptedText(i), alphabet)
            encryptedIndex = find(alphabet == encryptedText(i));
            newIndex = mod(encryptedIndex - 1 - shiftValue, 26) + 1;
            decryptedText = [decryptedText, alphabet(newIndex)];
        else
            decryptedText = [decryptedText, encryptedText(i)];
        end

    end

end
