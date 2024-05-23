function cipher_text = rc4_encrypt(plain_text, secret_key)
    S = uint8(0:255);
    secret_key = uint8(secret_key);
    key_length = length(secret_key);
    j = 0;
    for i = 1:256
        j = mod(j + S(i) + secret_key(mod(i - 1, key_length) + 1), 256);
        % Swap S[i] and S[j]
        temp = S(i);
        S(i) = S(j);
        S(j) = temp;
    end
    cipher_text = uint8(zeros(size(plain_text)));
    i = 0; j = 0;
    for k = 1:length(plain_text)
        i = mod(i + 1, 256);
        j = mod(j + S(i), 256);
        temp = S(i);
        S(i) = S(j);
        S(j) = temp;
        k_byte = bitxor(double(plain_text(k)), S(mod(S(i) + S(j), 256) + 1));
        cipher_text(k) = k_byte;
    end
end