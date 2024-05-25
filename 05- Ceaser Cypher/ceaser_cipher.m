function [cipher_text] = ceaser_cipher(plain_text, key)
    % chars = "abcdefghijklmnopqrstuvwxyz".
    chars = 'a':'z';

    % Convert to lowercase.
    plain_text = lower(plain_text);

    % Remove spaces.
    plain_text = plain_text(plain_text ~= ' ');

    % Empty string to hold our encrypted_text.
    cipher_text = '';

    % Encryption begins . . .
    for i = 1:length(plain_text)
        cipheridx = find(chars == plain_text(i));
        cipheridx = cipheridx + key;
        cipheridx = mod((cipheridx - 1), 26) + 1;
        cipher_text(i) = chars(cipheridx);
    end

    cipher_text = upper(cipher_text);
end
