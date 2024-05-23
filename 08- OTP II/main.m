Plain_txt = 'HELLO';
Key = 'XMCKL';

Cipher_txt = otp_II_encrypt(Plain_txt, Key);
Decrypted_txt = otp_II_decrypt(Cipher_txt, Key);

% Display the results
disp('Plaintext:');
disp(Plain_txt);
disp('Key:');
disp(Key);
disp('Ciphertext:');
disp(Cipher_txt);
disp('Decrypted Text:');
disp(Decrypted_txt);

% The Output:
    % Plaintext:
    % HELLO
    % Key:
    % XMCKL
    % Ciphertext:
    % 
    % Decrypted Text:
    % HELLO