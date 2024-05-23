% Define the plaintext
plaintext = 'hello world';

a = 5; % Must be relatively prime to m
b = 8;
m = 26;

ciphertext = affine_encrypt(plaintext, a, b, m);
disp('Encrypted text:');
disp(ciphertext);

decrypted_text = affine_decrypt(ciphertext, a, b, m);
disp('Decrypted text:');
disp(decrypted_text);

% Check if the decrypted text matches the original plaintext
if strcmp(plaintext, decrypted_text)
    disp('The decryption is correct.');
else
    disp('The decryption is incorrect.');
end

% The Output:
    % Encrypted text:
    % rclla oaplx
    % Decrypted text:
    % hello world
    % The decryption is correct.