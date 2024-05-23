% Define the plaintext and key
plaintext = 'potatoes are in the nightshade family as well';
transpositionKey = '425163';

disp('Original Plaintext:');
disp(plaintext);

% Encrypt the plaintext
cipherText = columnarTrainspositionEncrypt(plaintext, transpositionKey);

disp('Encrypted Text:');
disp(cipherText);

% Decrypt the ciphertext
decryptedText = columnarTrainspositionDecrypt(cipherText, transpositionKey);

disp('Decrypted Text:');
disp(decryptedText);

% The Output:
    % Original Plaintext:
    % potatoes are in the nightshade family as well
    % Encrypted Text:
    % ARESASXOSTHEYLOIIAIEXPENGDLLTAHTFAXTENHMWX
    % Decrypted Text:
    % potatoesareinthenightshadefamilyaswellxxxx