function Cipher_txt = PlayFair_Encrpt(Plain_txt, Key)
    % Initialize the cipher text.
    Cipher_txt = '';

    % Convert the plain text to UPPERCASE.
    Plain_txt = upper(Plain_txt);

    % Remove spaces.
    Plain_txt = Plain_txt(Plain_txt ~= ' ');

    % Convert the key to UPPERCASE.
    Key = upper(Key);

    % Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
    Chars = 'A':'Z';

    % If there are consecutive identical characters in the plain text,
    %   insert 'X' between them.
    for I = 1:2:length(Plain_txt)

        if Plain_txt(I) == Plain_txt(I + 1)
            Plain_txt = strcat(Plain_txt(1:I), 'X', Plain_txt(I + 1:length(Plain_txt)));
        end

    end

    % Initialize the cipher matrix
    Ciper_Mat = '';
    J = 1;

    % Add the characters from the key to the cipher matrix
    for I = 1:length(Key)
        Ch = Key(I);

        if Ch == 'J'
            Ch = 'I';
        end

        Ind = find(Ciper_Mat == Ch);

        if isempty(Ind)
            Ciper_Mat(J) = Ch;
            J = J + 1;
        end

    end

    % Add the remaining characters to the cipher matrix
    for I = 1:length(Chars)
        Ch = Chars(I);

        if Ch == 'J'
            Ch = 'I';
        end

        Ind = find(Ciper_Mat == Ch);

        if isempty(Ind)
            Ciper_Mat(J) = Ch;
            J = J + 1;
        end

    end

    % Reshape the cipher matrix into a 5x5 matrix.
    Ciper_Mat = reshape(Ciper_Mat, [5 5])';

    % If the length of the plain text is odd, append 'X' to make it even.
    L = length(Plain_txt);

    if mod(L, 2) ~= 0
        Plain_txt = strcat(Plain_txt, 'X');
    end

    % ENCRYPTION BEGINS . . .
    % The for loop structure in MATLAB:
    % for start:step:stop
    for I = 1:2:length(Plain_txt)
        % Get the two characters.
        Ch1 = Plain_txt(I);
        Ch2 = Plain_txt(I + 1);

        % Get row and column for each one of the two characters.
        [r1, c1] = find(Ciper_Mat == Ch1);
        [r2, c2] = find(Ciper_Mat == Ch2);

        % First case: THE SAME ROW => SHIFT THEM HORIZONTALLY.
        if r1 == r2
            Rect = Ciper_Mat(r1, :);
            Col1 = c1 + 1;

            if Col1 > length(Rect)
                Col1 = Col1 - 5;
            end

            New_Ch1 = Rect(Col1);
            Col2 = c2 + 1;

            if Col2 > length(Rect)
                Col2 = Col2 - 5;
            end

            New_Ch2 = Rect(Col2);

        % Second case: THE SAME COLUMN => SHIFT THEM VERTICALLY.
        elseif c1 == c2
            Rect = Ciper_Mat(:, c1);
            Row1 = r1 + 1;
            Row2 = r2 + 1;

            if Row1 > length(Rect)
                Row1 = Row1 - 5;
            end

            New_Ch1 = Rect(Row1);

            if Row2 > length(Rect)
                Row2 = Row2 - 5;
            end

            New_Ch2 = Rect(Row2);
        % Third case: THE CHARACTERS FORM RECTANGLE => SWAP THEIR POSITION
        else
            New_Ch1 = Ciper_Mat(r1, c2);
            New_Ch2 = Ciper_Mat(r2, c1);
        end

        % Append the new characters to the cipher text.
        Cipher_txt(I) = New_Ch1;
        Cipher_txt(I + 1) = New_Ch2;
    end

end
