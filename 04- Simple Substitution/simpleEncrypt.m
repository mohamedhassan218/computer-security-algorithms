function [encryptedText, shiftValue] = simpleEncrypt(originalText, shift)
    % Convert the original text to lowercase.
    originalText = lower(originalText);

    % Remove spaces from the original text.
    originalText = originalText(originalText ~= ' ');

    % Initialize the encrypted text as an empty string.
    encryptedText = '';

    % Define the alphabet.
    alphabet = 'a':'z';

    % Ensure the shift value wraps around the alphabet.
    shiftValue = mod(shift, 26);

    % Iterate over each character in the original text.
    for i = 1:length(originalText)
        % Check if the character is in the alphabet.
        if ismember(originalText(i), alphabet)
            % Find the index of the character in the alphabet.
            originalIndex = find(alphabet == originalText(i));

            % Calculate the new index after the shift.
            newIndex = mod(originalIndex - 1 + shiftValue, 26) + 1;

            % Append the encrypted character to the encrypted text.
            encryptedText = [encryptedText, alphabet(newIndex)];
        else
            % If the character is not in the alphabet, keep it unchanged.
            encryptedText = [encryptedText, originalText(i)];
        end

    end

end
