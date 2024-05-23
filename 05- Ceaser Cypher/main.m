plain_text = 'spongebobsquarepants';
key = 3;
cipher_text = ceaser_cipher(plain_text, key);
fprintf('Plaintext: %s\n', plain_text);
fprintf('Ciphertext: %s\n', cipher_text);
decrypted_text = decrypt_ceaser_cipher(cipher_text, key);
fprintf('Decrypted text: %s\n', decrypted_text);

% The Output:
    % Plaintext: spongebobsquarepants
    % Ciphertext: VSRQJHEREVTXDUHSDQWV
    % Decrypted text: spongebobsquarepants