function ciphertext = a51_encrypt(plaintext, keystream)
    % Simplified A5/1 encryption function
    % plaintext: input plaintext
    % keystream: pre-generated keystream
    ciphertext = bitxor(plaintext, keystream); % XOR plaintext with keystream
end