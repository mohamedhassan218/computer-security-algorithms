function decrypted_text = affine_decrypt(encrypted_text, a, b, m)
    % Affine cipher decryption function
    % encrypted_text: input ciphertext
    % a, b: keys for the cipher
    % m: size of the alphabet (e.g., 26 for English alphabet)
    decrypted_text = '';
    % Calculate the multiplicative inverse of a
    for i = 0:m-1
        if mod(a * i, m) == 1
            a_inv = i;
            break;
        end
    end
    for i = 1:length(encrypted_text)
        if encrypted_text(i) ~= ' '
            x = mod(encrypted_text(i) - 'a', m); % Convert letter to number
            y = mod(a_inv * (x - b), m); % Decryption formula
            decrypted_text = [decrypted_text, char(y + 'a')]; % Convert number back to letter
        else
            decrypted_text = [decrypted_text, ' ']; % Keep spaces as is
        end
    end
end