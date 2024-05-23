plaintext = 'short example';
keyword = 'hill';
Cipher_txt=hill_encrypt(plaintext, keyword,2)
decrypted_text=hill_decrypt(Cipher_txt, keyword,2)
disp('Ciphertext:');
disp(Cipher_txt);
disp('Decrypted Text:');
disp(decrypted_text);

% The Output:
    % Ciphertext:
    % APADJTFTWLFJ
    % Decrypted Text:
    % shortexample