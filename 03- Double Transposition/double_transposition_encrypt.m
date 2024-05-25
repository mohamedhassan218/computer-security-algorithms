function Cipher_txt = double_transposition_encrypt(Plain_txt, Row_Per, Col_Per)
    % Convert the plain text to lower case.
    Plain_txt = lower(Plain_txt);

    % Remove spaces from the plain text.
    Plain_txt = Plain_txt(Plain_txt ~= ' ');

    % Initialize the cipher text with the plain text.
    Cipher_txt = Plain_txt;

    % Get the number of rows and columns from the permutation arrays.
    row = length(Row_Per);
    col = length(Col_Per);

    % Initialize a counter for the plain text.
    C = 1;

    % Fill the plain text matrix with the plain text characters.
    for I = 1:row

        for J = 1:col
            % If there are still characters in the plain text, use them.
            if C <= length(Plain_txt)
                Plain_Mat(I, J) = Plain_txt(C);
            else
                % If there are no more characters, fill the rest of the matrix with 'x'.
                Plain_Mat(I, J) = 'x';
            end

            % Increment the counter.
            C = C + 1;
        end

    end

    % Permute the rows of the plain text matrix.
    for I = 1:row
        Permuted_Mat1(I, :) = Plain_Mat(Row_Per(I), :);
    end

    % Permute the columns of the permuted matrix.
    for I = 1:col
        Permuted_Mat2(:, I) = Permuted_Mat1(:, Col_Per(I));
    end

    % Transpose the permuted matrix (notice the single quote).
    Permuted_Mat2 = Permuted_Mat2';

    % Convert the permuted matrix back to a cipher text.
    for I = 1:row * col
        Cipher_txt(I) = Permuted_Mat2(I);
    end

    % Convert the cipher text to upper case.
    Cipher_txt = upper(Cipher_txt);
end
