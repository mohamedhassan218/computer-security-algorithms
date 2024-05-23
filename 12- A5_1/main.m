% Define the plaintext (as binary data)
plaintext = [0, 1, 1, 0, 1, 0, 1, 1]; % Example plaintext in binary

% Define the key (for simplicity, we use a fixed key)
key = [1, 0, 1, 1, 0, 1, 0, 1]; % Example key in binary

% Encrypt the plaintext
ciphertext = a51_encrypt(plaintext, key);
disp('Encrypted text:');
disp(ciphertext);

% Decrypt the ciphertext
decrypted_text = a51_decrypt(ciphertext, key);
disp('Decrypted text:');
disp(decrypted_text);

% Check if the decrypted text matches the original plaintext
if isequal(plaintext, decrypted_text)
    disp('The decryption is correct.');
else
    disp('The decryption is incorrect.');
end


% The Output:
    % Encrypted text:
    %      1     1     0     1     1     1     1     0
    % 
    % Decrypted text:
    %      0     1     1     0     1     0     1     1
    % 
    % The decryption is correct.