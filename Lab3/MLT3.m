function Mod_MLT3 = MLT3(generatedSeq);
    Mod_MLT3 = [];
    toggle = 0; 
    sequence = [1, 0, -1, 0];
    j = 1;
    
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