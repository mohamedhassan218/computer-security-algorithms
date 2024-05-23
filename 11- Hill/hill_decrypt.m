function Plain_txt=hill_decrypt(Cipher_txt,key,size)
    Cipher_txt=lower(Cipher_txt);
    Cipher_txt=Cipher_txt(Cipher_txt~=' ');
    key=lower(key);
    key=key(key~=' ');
    Chars='a':'z';
    key_mat=zeros(size,size);
    Plain_txt='';
    key_cnt=1;
    char_cnt=1;
    %get the key matrix
    for I=1:size
        for J=1:size
            if(key_cnt>length(key))
                key_mat(I,J)=char_cnt-1;
                char_cnt=char_cnt+1;
            else
                key_mat(I,J)=find(Chars==key(key_cnt))-1;
                key_cnt=key_cnt+1;
            end
        end
    end
    %get the adjoint matrix and determent matrix
    % the low to get and Adj() = determent of matrix * inverse of matrix mod 26
    adjoint_key=det(key_mat)*inv(key_mat);
    adjoint_key=mod(adjoint_key,26);
    % get determent using ready function det()
    det_key= det(key_mat);
    %optional line (get the same result)
    det_key=mod(det_key,26);
    %loop to find the inverse of the determent : a*a^-1 mod 26=1
    for det_inv=1:100
        if mod(det_key * det_inv,26)==1
            break;
        end
    end
    det_inv=mod(det_inv,26);
    %get the final inverse key matrix 
    inverse_key_mat=adjoint_key*det_inv;
    inverse_key_mat=mod(inverse_key_mat,26);
    %multiple the key matrix with the cipher to get the plain txt
    if mod(length(Cipher_txt),size)==0
        for I=1:size:length(Cipher_txt)
            Cipher_Char= Cipher_txt(I:I+size-1);
            Cipher_Ind=zeros(1,size);
            for J=1:size
                Cipher_Ind(J)=find(Chars==Cipher_Char(J))-1;
            end
            Plain_Ind= inverse_key_mat*Cipher_Ind';
            Plain_Ind= mod(int32(Plain_Ind),26);
            Plain_txt(I:I+size-1)=Chars(Plain_Ind+1);
        end
    else 
        disp('cipher text size must be divisable by size');
    end
end