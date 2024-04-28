% Define your plaintext and number of rails
plainText = 'Hello, World!';
rails = 3;

% Encrypt the plaintext
cipherText = railFenceEncrypt(plainText, rails);
disp(['Encrypted Text: ', cipherText]);

% Decrypt the ciphertext
decryptedText = railFenceDecrypt(cipherText, rails);
disp(['Decrypted Text: ', decryptedText]);

% The Output:
    % Encrypted Text: Horel,ol!lWd
    % Decrypted Text: Hello,World!