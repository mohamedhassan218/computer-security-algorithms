function Cipher_txt=PlayFair_Encrpt(Plain_txt,Key)
    Cipher_txt='';
    Plain_txt=upper(Plain_txt);
    Plain_txt=Plain_txt(Plain_txt~=' ');
    Key=upper(Key);
    Chars='A':'Z';

    %% Use X to separate the repeated Charcters in the Plain text

    for I=1:2:length(Plain_txt)
        if Plain_txt(I)==Plain_txt(I+1)
            Plain_txt=strcat(Plain_txt(1:I),'X',Plain_txt(I+1:length(Plain_txt)));
        end
    end
    % Plain_txt

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
    % Ciper_Mat

    %complete cipher matrix
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
    % Ciper_Mat
    % reshape from vector to matrix 5x5
    %apply transpose becouse matrix sort from top to button 
    %Ciper_Mat=reshape(Ciper_Mat,[5 5])
    %from left to right and top to button
    Ciper_Mat=reshape(Ciper_Mat,[5 5])';
    %% The Encryption Part
    L=length(Plain_txt);

    %check if the Plain txt mod 2 =0
    % if not
    if mod(L,2)~=0
        Plain_txt=strcat(Plain_txt,'X');
    end

    %if yes
    for I=1:2:length(Plain_txt)
        Ch1=Plain_txt(I); Ch2=Plain_txt(I+1);

        % search index of Ch1 ,Ch2 if find return [row,column]
        [r1,c1]=find(Ciper_Mat==Ch1);
        [r2,c2]=find(Ciper_Mat==Ch2);
        if r1==r2 %If the two characters are in the same row
            Rect=Ciper_Mat(r1,:);
            Col1=c1+1;  
            if Col1>length(Rect) 
                Col1=Col1-5;
            end
        New_Ch1=Rect(Col1);
        
        Col2=c2+1;
        if Col2>length(Rect) 
            Col2=Col2-5;
        end   
        New_Ch2=Rect(Col2);
        elseif c1==c2 %If the two characters are in the same column
            Rect=Ciper_Mat(:,c1);
            Row1=r1+1;
            Row2=r2+1;
            if Row1>length(Rect) 
                Row1=Row1-5;
                % Row2=mod(Row1,5)
            end
            
        New_Ch1=Rect(Row1);
        if Row2>length(Rect) 
            Row2=Row2-5;
        end
        New_Ch2=Rect(Row2);
        else
            New_Ch1=Ciper_Mat(r1,c2);
            New_Ch2=Ciper_Mat(r2,c1) ;     
        end
        Cipher_txt(I)=New_Ch1;
        Cipher_txt(I+1)=New_Ch2;     
    end
end