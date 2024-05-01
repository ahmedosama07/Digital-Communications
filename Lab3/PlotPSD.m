function PlotPSD(all_PSD,all_freq);
 %Function that Plot all PSD in one window
    figure;
    titles = {'UnipolarNRZ', 'PolarNRZ', 'BipolarNRZ', 'MLT3', 'UnipolarRZ', 'PolarRZ', 'BipolarRZ', 'Manchester'}; 
    for i = 1:8
        
        subplot(2, 4, i);
        
        current_array = all_PSD{i};
        
        current_frequency=all_freq{i};
        plot(current_frequency,current_array); 
        
        title(titles{i});
    end
    
    % Add a supertitle to the figure
    sgtitle('PowerSpectralDenisty');
end

