plaintext = 'HeilHitler';
key = 'trsrtIerse';
plaintext = lower(plaintext);
key = lower(key);

ciphertext = otp_I_encrypt(plaintext, key);
decrypted_text = otp_I_decrypt(ciphertext, key);

fprintf('Plaintext:  %s\n', plaintext);
fprintf('Key:        %s\n', key);
fprintf('Ciphertext: %s\n', ciphertext);
fprintf('Decrypted Text: %s\n', decrypted_text);

% The Output:
    % Plaintext:  heilhitler
    % Key:        trsrtierse
    % Ciphertext: bwbdbrydxw
    % Decrypted Text: heilhitler