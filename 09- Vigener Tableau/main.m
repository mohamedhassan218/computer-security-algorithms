plaintext = 'wearediscoveredsaveyourself';
key = 'deceptivedeceptivedeceptive';

% Encrypt the plaintext using the Vigenère encryption function
cipher_text = vigener_encrypt(plaintext, key);
decrypted_text = vigener_decrypt(cipher_text, key);

% Display the results
disp('Plaintext:');
disp(plaintext);
disp('Key:');
disp(key);
disp('Ciphertext:');
disp(cipher_text);
disp('Decrypted Text:');
disp(decrypted_text);

% The Output:
    % Plaintext:
    % wearediscoveredsaveyourself
    % Key:
    % deceptivedeceptivedeceptive
    % Ciphertext:
    % zicvtwqngrzgvtwavzhcqyglmgj
    % Decrypted Text:
    % wearediscoveredsaveyourself