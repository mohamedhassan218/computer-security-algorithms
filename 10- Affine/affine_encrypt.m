function encrypted_text = affine_encrypt(plain_text, a, b, m)
    encrypted_text = '';
    for i = 1:length(plain_text)
        if plain_text(i) ~= ' '
            x = mod(plain_text(i) - 'a', m); % Convert letter to number
            y = mod(a * x + b, m); % Encryption formula
            encrypted_text = [encrypted_text, char(y + 'a')]; % Convert number back to letter
        else
            encrypted_text = [encrypted_text, ' ']; % Keep spaces as is
        end
    end
end