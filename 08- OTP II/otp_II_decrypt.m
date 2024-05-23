function [Plain_txt] = otp_II_decrypt(Cipher_txt,Key)
    Plain_txt = ''; 
    if ( length(Key) == length(Cipher_txt) )
        for I = 1 : length(Cipher_txt)
            Cipher_Dec = double( Cipher_txt(I) )     % double to find the ASCII code of the latter      
            Key_Dec = double( Key(I) )
            % use bitxor to convert decemal num to binary then apply XOR operation 
            Plain_Dec = bitxor( Cipher_Dec , Key_Dec ) 
            Plain_txt(I) = char( Plain_Dec );
        end    
    else
    disp('Cipher_txt and Key must be of the same length')  
    end 
end