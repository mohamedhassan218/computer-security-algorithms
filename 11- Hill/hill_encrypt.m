%{
    This function takes three args: the text to be
        encrypted, the key and the size of the key matrix.
%}
function Cipher_txt = hill_encrypt(Plain_txt, key, size)
    % Convert to lowercase and remove spaces.
    Plain_txt = lower(Plain_txt);
    Plain_txt = Plain_txt(Plain_txt ~= ' ');
    key = lower(key);
    key = key(key ~= ' ');

    % String contains alphabets from a to z.
    Chars = 'a':'z';

    % Empty string that will contain our encrypted text.
    Cipher_txt = '';

    % Initialize a zero matrix of dimensions size x size to hold the key matrix.
    key_mat = zeros(size, size);

    % Variable to keep track of the position in the key.
    key_cnt = 1;

    % Variabl to provide filler characters if the key is too short.
    % If the length of the encryption key (key) is shorter than
    %    what is required to fill the entire key matrix,we need to fill the
    %    remaining spaces in the matrix with additional characters.
    char_cnt = 1;

    % This block enables us to fill the key matrix.
    for i = 1:size
        for j = 1:size
            if key_cnt > length(key)
                key_mat(i, j) = char_cnt - 1;
                char_cnt = char_cnt + 1;
            else
                key_mat(i, j) = find(Chars == key(key_cnt)) - 1;
                key_cnt = key_cnt + 1;
            end
        end
    end

    %{
        Calculate the remainder when the length of Plain_txt is divided by size.
        If 'div' is not zero, the plaintext is padded with 'x' characters
            to make its length a multiple of size.
    %}
    div = mod(length(Plain_txt), size);
    if div ~= 0
        for I = div:size - 1
            Plain_txt = strcat(Plain_txt, 'x');
        end
    end

    %{
        Time to encrypt . . .
        The outer loop iterates over Plain_txt in chunks of size.
        'Plain_Chars' extracts a chunk of 'Plain_txt' of length size.
        'Plain_Ind' is initialized to store the indices of the characters in 'Plain_Chars'.
        The inner loop finds the index of each character in "Plain_Chars' within Chars and 
            stores it in 'Plain_Ind'.
        'Cipher_Ind' is calculated by multiplying the key matrix with 'Plain_Ind'
            (transposed to a column vector), then taking modulo 26 of the result.
    %}
    for I = 1:size:length(Plain_txt)
        Plain_Chars = Plain_txt(I:I + size - 1);
        Plain_Ind = zeros(1, size);
        for j = 1:size
            Plain_Ind(j) = find(Chars == Plain_Chars(j)) - 1;
        end
        Cipher_Ind = key_mat * Plain_Ind';
        Cipher_Ind = mod(Cipher_Ind, 26);
        Cipher_txt(I:I + size - 1) = Chars(Cipher_Ind + 1);
    end

    % Convert our cipher text to UPPERCASE.
    Cipher_txt = upper(Cipher_txt);
end
