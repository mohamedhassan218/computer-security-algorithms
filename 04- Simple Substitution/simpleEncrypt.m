% Encryption
function [encryptedText, shiftValue] = simpleEncrypt(originalText, shift)
    originalText = lower(originalText);
    originalText = originalText(originalText ~= ' ');
    encryptedText = '';
    alphabet = 'a':'z';
    
    shiftValue = mod(shift, 26); % Ensure the shift value wraps around the alphabet
    
    for i = 1:length(originalText)
        if ismember(originalText(i), alphabet)
            originalIndex = find(alphabet == originalText(i));
            newIndex = mod(originalIndex - 1 + shiftValue, 26) + 1;
            encryptedText = [encryptedText, alphabet(newIndex)];
        else
            encryptedText = [encryptedText, originalText(i)]; % Keep non-alphabetic characters unchanged
        end
    end
end