function Cipher_txt=hill_encrypt(Plain_txt,key,size)
    Plain_txt=lower(Plain_txt);
    Plain_txt=Plain_txt(Plain_txt~=' ');
    key=lower(key);
    key=key(key~=' ');
    Chars='a':'z';
    Cipher_txt='';
    key_mat=zeros(size,size);
    key_cnt=1;
    char_cnt=1;
    %loop to fill key matrix
    for i=1:size
        for j=1:size
            %check if we reached the end of the key but havent finished filling
            %the matrix , we then would fill it A(0),B(1),C(2)....
            % subtract 1 to handle matlab start count from 1 and algorithm from
            % start from 0
            if key_cnt>length(key)
                key_mat(i,j)=char_cnt-1;
                char_cnt=char_cnt+1;
            else
                key_mat(i,j)=find(Chars==key(key_cnt))-1;
                key_cnt=key_cnt+1;
            end
        end
    end
    %check if the size of plain text is divisble by the size of matrix , if not
    %then add X to the end until it is
    div=mod(length(Plain_txt),size);
    if div~=0
        %add x, ex: if p=10 and size=3 we need to add 2 x to the end
        for I=div : size-1
            Plain_txt=strcat(Plain_txt,'x');
        end
    end
    for I=1:size:length(Plain_txt)
        % divide plain text corresponding to given size
        Plain_Chars=Plain_txt(I:I+size-1);
        %create empty vector for plain indeces '1xsize'
        Plain_Ind=zeros(1,size);
        %find corresponding index for each letter in plain text
        for j=1:size
            Plain_Ind(j)=find(Chars==Plain_Chars(j))-1;
        end
        %multiply key matrix with plain vector then take mod26
        % note: that apply transpose to valid multiplication between matrix and
        % vector 'sizexsize*sizex1' 
        Cipher_Ind=key_mat*Plain_Ind';
        Cipher_Ind=mod(Cipher_Ind,26)
        %find corresponding latter for each index in cipher vectors
        % add 1 to handel zero case
        Cipher_txt(I:I+size-1)=Chars(Cipher_Ind+1);
    end
    Cipher_txt=upper(Cipher_txt);
end