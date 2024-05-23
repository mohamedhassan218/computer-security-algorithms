plaintext = 'attackatdawn';

% Define the permutation vectors for rows and columns
row_permutation = [3, 2, 1];
colOne_permutation = [4, 2, 1, 3];

% Encrypt the plaintext
ciphertext = double_transposition_encrypt(plaintext, row_permutation, colOne_permutation);
disp('Encrypted text:');
disp(ciphertext);

% Decrypt the ciphertext
decrypted_text = double_transposition_decrypt(ciphertext, row_permutation, colOne_permutation);
disp('Decrypted text:');
disp(decrypted_text);

% The Output:
    % Encrypted text:
    % NADWTKCAATAT
    % Decrypted text:
    % attackatdawn