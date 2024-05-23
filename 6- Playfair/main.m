% Define the plaintext and the key
Plain_txt = 'balloon';
Key = 'monarchy';

% Call the PlayFair_Encrpt function
Cipher_txt = playfair_encrypt(Plain_txt, Key);
decrypted_text = playfair_decrypt(Cipher_txt, Key);

% Display the results
disp(['Plaintext: ', Plain_txt]);
disp(['Key: ', Key]);
disp(['Ciphertext: ', Cipher_txt]);
disp(['Decrypted Text: ', decrypted_text]);

% The Output:
    % Plaintext: balloon
    % Key: monarchy
    % Ciphertext: IBSUPMNA
    % Decrypted Text: balloon