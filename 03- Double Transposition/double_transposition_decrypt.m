function Plain_txt = double_transposition_decrypt(Cipher_txt, Row_Per, Col_Per)
    % Convert to lowercase.
    Cipher_txt = lower(Cipher_txt);

    % Remove white spaces.
    Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');

    % Initilize the plain_text (our result) with the value of the cipher_text.
    Plain_txt = Cipher_txt;

    % Grap the row and column values using the length of the row_per and col_per.
    row = length(Row_Per);
    col = length(Col_Per);

    % Counter to help us.
    C = 1;

    % Fill our matrix with the cipher_text.
    for I = 1:row

        for J = 1:col

            if C <= length(Cipher_txt)
                Cipher_Mat(I, J) = Cipher_txt(C);
            else
                Cipher_Mat(I, J) = 'x';
            end

            C = C + 1;
        end

    end

    % Let's decrypt . . .
    for I = 1:col
        Permuted_Mat1(:, Col_Per(I)) = Cipher_Mat(:, I);
    end

    for I = 1:row
        Permuted_Mat2(Row_Per(I), :) = Permuted_Mat1(I, :);
    end

    % And don't forget to transpose your permuted matrix.
    Permuted_Mat2 = Permuted_Mat2';

    % Now we've to convert the matrix to a string again.
    for I = 1:row * col
        Permuted_Mat2(I)
        Plain_txt(I) = Permuted_Mat2(I);
    end

end
