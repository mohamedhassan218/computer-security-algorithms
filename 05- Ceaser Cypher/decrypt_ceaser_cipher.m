function [decrypted_text] = decrypt_ceaser_cipher(cipher_text, key)
    % chars = "abcdefghijklmnopqrstuvwxyz".
    chars = 'a':'z';

    % Convert to lower.
    cipher_text = lower(cipher_text);

    % Empty string that will be our decrypted_text.
    decrypted_text = '';

    % Decryption happens . . .
    for i = 1:length(cipher_text)
        cipheridx = find(chars == cipher_text(i));
        cipheridx = cipheridx - key;
        cipheridx = mod((cipheridx - 1), 26) + 1;
        decrypted_text(i) = chars(cipheridx);
    end

end
