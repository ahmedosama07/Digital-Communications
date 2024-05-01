function Mod_MLT3 = MLT3(generatedSeq);
    Mod_MLT3 = [];
    toggle = 0; 
   %Initiallize repeated sequence for MLT-3
    sequence = [1, 0, -1, 0];
    j = 1;
 %Apply for loop has condition to check on the current bit
 %if it is 1 so move from one state to the next one
 %if it is 0 then no change 
 %apply other condition to check if sequence finished or not to repeat it
    for i = 1:length(generatedSeq)
        if generatedSeq(i) == 1
            toggle = sequence(j);
            j = j + 1;
            if j > length(sequence)
                j = 1;
            end
        end
        
        % Append the current level to the modulated sequence
        Mod_MLT3 = [Mod_MLT3, toggle];
    end
end