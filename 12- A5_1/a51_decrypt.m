function decrypted_text = a51_decrypt(ciphertext, keystream)
    % Simplified A5/1 decryption function
    % ciphertext: input ciphertext
    % keystream: pre-generated keystream (must be the same as encryption)
    decrypted_text = bitxor(ciphertext, keystream); % XOR ciphertext with keystream
end