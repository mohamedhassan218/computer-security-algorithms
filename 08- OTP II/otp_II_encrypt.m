function [Cipher_txt] = otp_II_encrypt(Plain_txt,Key)
    Cipher_txt = ''; 
    if ( length(Key) == length(Plain_txt) )
        for I = 1 : length(Plain_txt)
            % double to find the ASCII code of the latter      
            Plain_Dec = double( Plain_txt(I) )     
            Key_Dec = double( Key(I) )
            % use bitxor to convert decemal num to binary then apply XOR operation 
            Cipher_Dec = bitxor( Plain_Dec , Key_Dec ) 
            Cipher_txt(I) = char( Cipher_Dec );
        end    
    else
    disp('Plain_txt and Key must be of the same length')  
    end 
end