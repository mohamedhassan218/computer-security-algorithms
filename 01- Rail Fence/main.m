% Define your plaintext and number of rails
plainText = 'defend the east wall';
rails = 3;

% Encrypt the plaintext
cipherText = railFenceEncrypt(plainText, rails);
disp(['Encrypted Text: ', cipherText]);

% Decrypt the ciphertext
decryptedText = railFenceDecrypt(cipherText, rails);
disp(['Decrypted Text: ', decryptedText]);

% The Output:
    % Encrypted Text: dnetleedheswlftaa
    % Decrypted Text: defendtheeastwall