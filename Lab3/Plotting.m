function Plotting(Mod_Unipolar_NRZ, Mod_Polar_NRZ, Mod_Bipolar_NRZ, Mod_MLT3, Mod_Unipolar_RZ, Mod_Polar_RZ, Mod_Bipolar_RZ, Mod_Manchester_UTD);

    figure;
    titles = {'UnipolarNRZ', 'PolarNRZ', 'BipolarNRZ', 'MLT3', 'UnipolarRZ', 'PolarRZ', 'BipolarRZ', 'Manchester'};
    arrays = {Mod_Unipolar_NRZ, Mod_Polar_NRZ, Mod_Bipolar_NRZ, Mod_MLT3, Mod_Unipolar_RZ, Mod_Polar_RZ, Mod_Bipolar_RZ, Mod_Manchester_UTD};
 
    for i = 1:8
        bitspersecond=1;
       if i>4
           bitspersecond=2;
       end
        subplot(2, 4, i);
        
        current_array = arrays{i};
        t=0:1/bitspersecond:length(Mod_Unipolar_NRZ);
        stairs(t,[current_array current_array(end)],'LineWidth',2);
        title(titles{i});
    end
    
    % Add a supertitle to the figure
    sgtitle('LineCodes');
end

