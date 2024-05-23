function[plaintext]=otp_I_decrypt(ciphertext,key)
    chars='a':'z';
    ciphertext=lower(ciphertext);
    ciphertext=ciphertext(ciphertext~=' ');
    plaintext=' ';
    for i=1:length(ciphertext)
        cipherind=find(chars==ciphertext(i));
        keyind=find(chars==key(i));
        plainind=cipherind-keyind;
        plainind=mod(plainind-1,26)+1;
        plaintext(i)=chars(plainind);
    end
end