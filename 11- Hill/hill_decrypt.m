function Plain_txt = hill_decrypt(Cipher_txt, key, size)
    % Convert to lowercase and remove spaces.
    Cipher_txt = lower(Cipher_txt);
    Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
    key = lower(key);
    key = key(key ~= ' ');

    % Define a character array containing lowercase English alphabets.
    Chars = 'a':'z';

    % Create a matrix to store the key matrix.
    key_mat = zeros(size, size);
    Plain_txt = '';
    key_cnt = 1;
    char_cnt = 1;

    % Loop over rows of the key matrix.
    for I = 1:size
        % Loop over columns of the key matrix.
        for J = 1:size
            % If all characters in the key have been used:
            if (key_cnt > length(key))
                % Fill the remaining key matrix with consecutive numbers starting from 0.
                key_mat(I, J) = char_cnt - 1;

                % Increment the character counter.
                char_cnt = char_cnt + 1;
            else
                % Otherwise, find the position of the current key character in the alphabet and store it in the key matrix.
                key_mat(I, J) = find(Chars == key(key_cnt)) - 1;

                % Move to the next character in the key.
                key_cnt = key_cnt + 1;
            end

        end

    end

    % Calculate the adjoint of the key matrix multiplied by its inverse.
    adjoint_key = det(key_mat) * inv(key_mat);

    % Take the modulus of the result with 26.
    adjoint_key = mod(adjoint_key, 26);

    % Calculate the determinant of the key matrix.
    det_key = det(key_mat);

    % Take the modulus of the determinant with 26.
    det_key = mod(det_key, 26);

    for det_inv = 1:100
        % Iterate from 1 to 100 to find the multiplicative inverse of the determinant.
        if mod(det_key * det_inv, 26) == 1
            % If the product of the determinant and the current value equals 1 (mod 26):
            break;
            % Exit the loop.
        end

    end

    % Take the modulus of the determinant inverse with 26.
    det_inv = mod(det_inv, 26);

    % Calculate the inverse key matrix.
    inverse_key_mat = adjoint_key * det_inv;

    % Take the modulus of the inverse key matrix with 26.
    inverse_key_mat = mod(inverse_key_mat, 26);

    % Check if the length of the ciphertext is divisible by the size of the key.
    if mod(length(Cipher_txt), size) == 0

        for I = 1:size:length(Cipher_txt)
            % Loop over the ciphertext with a step size equal to the key size.
            Cipher_Char = Cipher_txt(I:I + size - 1);
            % Extract a block of characters from the ciphertext.
            Cipher_Ind = zeros(1, size);
            % Initialize an array to store the indices of the characters.

            for J = 1:size
                % Loop over the characters in the block.
                Cipher_Ind(J) = find(Chars == Cipher_Char(J)) - 1;
                % Find the indices of the characters in the alphabet and store them.
            end

            % Decrypt the block of ciphertext using the inverse key matrix.
            Plain_Ind = inverse_key_mat * Cipher_Ind';

            % Take the modulus of the decrypted indices with 26.
            Plain_Ind = mod(int32(Plain_Ind), 26);

            % Map the decrypted indices to characters and store them in the plaintext.
            Plain_txt(I:I + size - 1) = Chars(Plain_Ind + 1);
        end

    else
        % If the length of the ciphertext is not divisible by the size of the key, display an error message.
        disp('cipher text size must be divisible by size');
    end

end
