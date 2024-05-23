

% Decryption
function [decryptedText] = simpleDecrypt(encryptedText, shift)
    encryptedText = lower(encryptedText);
    encryptedText = encryptedText(encryptedText ~= ' ');
    decryptedText = '';
    alphabet = 'a':'z';

    shiftValue = mod(shift, 26); % Ensure the shift value wraps around the alphabet
    
    for i = 1:length(encryptedText)
        if ismember(encryptedText(i), alphabet)
            encryptedIndex = find(alphabet == encryptedText(i));
            newIndex = mod(encryptedIndex - 1 - shiftValue, 26) + 1;
            decryptedText = [decryptedText, alphabet(newIndex)];
        else
            decryptedText = [decryptedText, encryptedText(i)]; % Keep non-alphabetic characters unchanged
        end
    end
end