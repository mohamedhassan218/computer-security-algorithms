function [ciphertext]=otp_I_encrypt(plaintext,key)
    chars='a':'z';
    ciphertext=' ';
    % length of key and plain must be the same
    if(length(plaintext)==length(key))
        for i=1:length(plaintext)
            plainind=find(chars==plaintext(i));
            keyind=find(chars==key(i));
            cipherind=plainind+keyind;
            cipherind=mod(cipherind-1,26)+1;
            ciphertext(i)=chars(cipherind);
        end
    else
        disp('wrong');
    end
end