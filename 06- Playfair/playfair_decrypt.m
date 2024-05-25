function Plain_txt = PlayFair_Decrpt(Cipher_txt, Key)
    clear Plain_txt
    Cipher_txt = upper(Cipher_txt); % Convert the cipher text to uppercase
    Key = upper(Key); % Convert the key to uppercase

    % Create a matrix of characters from A to Z
    for I = 1:26
        Chars(1, I) = char(64 + I);
    end

    % Create the Playfair cipher matrix from the key
    Ciper_Mat = '';
    J = 1;

    for I = 1:length(Key)
        Ch = Key(I);

        if Ch == 'J'
            Ch = 'I'; % Replace 'J' with 'I' as 'I' and 'J' are considered the same in Playfair cipher
        end

        Ind = find(Ciper_Mat == Ch);

        if isempty(Ind)
            Ciper_Mat(J) = Ch;
            J = J + 1;
        end

    end

    % Add remaining characters to the Playfair cipher matrix
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

    Ciper_Mat = reshape(Ciper_Mat, [5 5])'; % Reshape the cipher matrix to 5x5

    % Decrypt the cipher text
    for I = 1:2:length(Cipher_txt)
        Ch1 = Cipher_txt(I); Ch2 = Cipher_txt(I + 1);
        [r1, c1] = find(Ciper_Mat == Ch1);
        [r2, c2] = find(Ciper_Mat == Ch2);

        if r1 == r2
            Rect = Ciper_Mat(r1, :);
            Col1 = c1 - 1; Col2 = c2 - 1;

            if Col1 < 1
                Col1 = Col1 + 5;
            end

            New_Ch1 = Rect(Col1);

            if Col2 < 1
                Col2 = Col2 + 5;
            end

            New_Ch2 = Rect(Col2);
        elseif c1 == c2
            Rect = Ciper_Mat(:, c1);
            Row1 = r1 - 1; Row2 = r2 - 1;

            if Row1 < 1
                Row1 = Row1 + 5;
            end

            New_Ch1 = Rect(Row1);

            if Row2 < 1
                Row2 = Row2 + 5;
            end

            New_Ch2 = Rect(Row2);
        else
            New_Ch1 = Ciper_Mat(r1, c2);
            New_Ch2 = Ciper_Mat(r2, c1);
        end

        Plain_txt(I) = New_Ch1;
        Plain_txt(I + 1) = New_Ch2;
    end

    % Remove 'X' characters if they are surrounded by the same character
    Ind = find(Plain_txt == 'X');

    if ~isempty(Ind)
        r = ~isempty(Ind)
        Num = length(Ind)

        for I = 1:Num

            if Plain_txt(Ind(I) - 1) == Plain_txt(Ind(I) + 1)
                Plain_txt = strcat(Plain_txt(1:Ind(I) - 1), Plain_txt(Ind(I) + 1:length(Plain_txt)))
            end

        end

    end

    Plain_txt = lower(Plain_txt); % Convert the plain text to lowercase
end
