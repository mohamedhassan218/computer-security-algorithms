function Plain_txt=PlayFair_Decrpt(Cipher_txt,Key)
    clear Plain_txt
    Cipher_txt=upper(Cipher_txt);
    Key=upper(Key);
    for I=1:26
        Chars(1,I)=char(64+I);
    end
    %% Construct the 5x5 Cipher Matrix using the Key
    Ciper_Mat='';
    J=1;
    for I=1:length(Key)
        Ch=Key(I);
        if  Ch=='J'
            Ch='I';
        end
        Ind=find(Ciper_Mat==Ch);
        if isempty(Ind)
            Ciper_Mat(J)= Ch; 
            J=J+1;
        end
    end
    for I=1:length(Chars)
        Ch=Chars(I);
        if  Ch=='J'
            Ch='I';
        end    
        Ind=find(Ciper_Mat==Ch);         
        if isempty(Ind)
            Ciper_Mat(J)= Ch; 
            J=J+1;
        end
    end
    Ciper_Mat=reshape(Ciper_Mat,[5 5])';
    %% The Decryption Part
    for I=1:2:length(Cipher_txt)
        Ch1=Cipher_txt(I); Ch2=Cipher_txt(I+1);
        [r1,c1]=find(Ciper_Mat==Ch1);
        [r2,c2]=find(Ciper_Mat==Ch2);
        if r1==r2 %If the two characters are in the same row
            Rect=Ciper_Mat(r1,:);
            Col1=c1-1;  Col2=c2-1;
            if Col1<1
                Col1=Col1+5;
            end
            New_Ch1=Rect(Col1);     
            if Col2<1
                Col2=Col2+5;
            end   
            New_Ch2=Rect(Col2); 
        elseif c1==c2 %If the two characters are in the same column
            Rect=Ciper_Mat(:,c1);
            Row1=r1-1;  Row2=r2-1;
            if Row1<1 
                Row1=Row1+5;
            end
            New_Ch1=Rect(Row1);
            if Row2<1
                Row2=Row2+5;
            end
            New_Ch2=Rect(Row2);
        else
            New_Ch1=Ciper_Mat(r1,c2);
            New_Ch2=Ciper_Mat(r2,c1)  ;        
        end
        Plain_txt(I)=New_Ch1;
        Plain_txt(I+1)=New_Ch2;     
    end
    %% DROP X from the Cipher text
    Ind=find(Plain_txt=='X');
    if ~isempty(Ind)
        r=~isempty(Ind)
        Num=length(Ind)
        for I=1:Num
            %12 34 56 78
            %ba lx lo on
            if Plain_txt(Ind(I)-1)==Plain_txt(Ind(I)+1)
                % s1=Ind(I)-1
                % s2=Ind(I)+1
                % s=Plain_txt(Ind(I)-1)
                % p=Plain_txt(Ind(I)+1)
                Plain_txt=strcat(Plain_txt(1:Ind(I)-1),Plain_txt(Ind(I)+1:length(Plain_txt)))
            end
        end
    end
    Plain_txt=lower(Plain_txt);
end

