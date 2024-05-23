% Test data
plain_text = 'Hello, world!';
secret_key = 'SecretKey123'; 

% Encrypt the plaintext
cipher_text = rc4_encrypt(plain_text, secret_key);

% Decrypt the ciphertext
decrypted_text = rc4_decrypt(cipher_text, secret_key);

% Check if the decrypted plaintext matches the original plaintext
if isequal(plain_text, char(decrypted_text))
    disp('Decryption successful. Plaintext and decrypted text match.');
else
    disp('Decryption failed. Plaintext and decrypted text do not match.');
end

% Print all info
fprintf('Plaintext: %s\n', plain_text);
fprintf('Ciphertext: ');
for i = 1:length(cipher_text)
    fprintf('%02X ', cipher_text(i));
end
fprintf('\n');
fprintf('Decrypted text: %s\n', char(decrypted_text));

% The Output:
    % Decryption successful. Plaintext and decrypted text match.
    % Plaintext: Hello, world!
    % Ciphertext: E9 DD 92 6E 6B 2A 28 7D 63 7C 7C 76 35 
    % Decrypted text: Hello, world!