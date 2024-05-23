function Plain_txt = vigener_decrypt(Cipher_txt,Key)
    Chars = 'a' : 'z';
    Cipher_txt = lower(Cipher_txt);
    Cipher_txt = Cipher_txt(Cipher_txt ~= ' ');
    Key = lower(Key);
    Key = Key(Key ~= ' ');
    Plain_txt = '';
    Char_Mat = char(zeros(26,26));
    for I = 1 : 26
        Char_Mat(I,:) = [Chars(I:end) Chars(1:I-1)];
    end
    C = length(Key);
    for I = 1 : length(Cipher_txt)
        Key_Ind = find( Chars == Key( mod( I-1 , C ) + 1 ) );
        Plain_Ind = find( Char_Mat(Key_Ind , :) == Cipher_txt(I));
        Plain_txt(I) = Chars(Plain_Ind);
    %C = C + 1;
    end
end