function Cipher_txt = double_transposition_encrypt(Plain_txt,Row_Per,Col_Per)
    Plain_txt = lower(Plain_txt);
    Plain_txt = Plain_txt( Plain_txt ~= ' ' );
    Cipher_txt = Plain_txt;

    row = length(Row_Per);
    col = length(Col_Per);
    C = 1;
    for I = 1:row
        for J = 1:col
            if C <= length(Plain_txt)
                Plain_Mat(I,J) = Plain_txt(C);
            else
                Plain_Mat(I,J) = 'x';
            end
            C = C + 1;
        end
    end
    for I = 1:row
        Permuted_Mat1(I,:)= Plain_Mat(Row_Per(I),:);    
    end
    for I = 1:col
        Permuted_Mat2(:,I) = Permuted_Mat1(:,Col_Per(I));    
    end

    Permuted_Mat2 = Permuted_Mat2';
    for I = 1:row*col
        Cipher_txt(I) = Permuted_Mat2(I);
    end

    Cipher_txt = upper(Cipher_txt);
end
% Cipher_txt=Dsub_Encrpt('helloworld',[3 5 1 4 2],[2 1])
% Cipher_txt=WODLEHROLL