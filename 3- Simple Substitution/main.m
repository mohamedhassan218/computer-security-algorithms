disp('Encrypting text . . .');
originalText = 'fourscoreandsevenyearsago';
shiftValue = 3; % Specify the shift value here

% Test Encryption
[encryptedText, shiftUsed] = simpleEncrypt(originalText, shiftValue);
disp('Original Text:');
disp(originalText);
disp('Encrypted Text:');
disp(encryptedText);

% Test Decryption
disp('Decrypting text . . .');
decryptedText = simpleDecrypt(encryptedText, shiftUsed);
disp('Decrypted Text:');
disp(decryptedText);

% The Output:
    % Encrypting text . . .
    % Original Text:
    % fourscoreandsevenyearsago
    % Encrypted Text:
    % irxuvfruhdqgvhyhqbhduvdjr
    % Decrypting text . . .
    % Decrypted Text:
    % fourscoreandsevenyearsago