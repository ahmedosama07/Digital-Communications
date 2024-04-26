clc;

seqLength=input('Enter Length of sequence ');


generatedSeq=randi([0,1],1,seqLength);
disp(generatedSeq);
t = 0:seqLength;
figure;
stairs(t, [generatedSeq generatedSeq(end)]  ,'LineWidth', 2);
title('Generated sequence');
grid on;

[Mod_Unipolar_NRZ, Mod_Unipolar_RZ] = Unipolar(generatedSeq);
[Mod_Polar_NRZ,Mod_Polar_RZ] = Polar(generatedSeq);
[Mod_Bipolar_NRZ,Mod_Bipolar_RZ] = AMI(generatedSeq);
Mod_Manchester_UTD = Manchester(generatedSeq);
Mod_MLT3 = MLT3(generatedSeq);
Plotting(Mod_Unipolar_NRZ, Mod_Polar_NRZ, Mod_Bipolar_NRZ, Mod_MLT3, Mod_Unipolar_RZ, Mod_Polar_RZ, Mod_Bipolar_RZ, Mod_Manchester_UTD);

[PSD_MAG_Unipolar_NRZ,freq_Unipolar_NRZ] = PSD(Mod_Unipolar_NRZ);
[PSD_MAG_Unipolar_RZ,freq_Unipolar_RZ] = PSD(Mod_Unipolar_RZ);
[PSD_MAG_Polar_NRZ,freq_Polar_NRZ] = PSD(Mod_Polar_NRZ);
[PSD_MAG_Polar_RZ,freq_Polar_RZ] = PSD(Mod_Polar_RZ);
[PSD_MAG_Bipolar_NRZ,freq_Bipolar_NRZ]= PSD(Mod_Bipolar_NRZ);
[PSD_MAG_Bipolar_RZ,freq_Bipolar_RZ]= PSD(Mod_Bipolar_RZ);
[PSD_MAG_Manchester,freq_Manchester ]= PSD(Mod_Manchester_UTD);
[PSD_MAG_MLT3,freq_MLT3] = PSD(Mod_MLT3);
all_PSD={PSD_MAG_Unipolar_NRZ,PSD_MAG_Polar_NRZ,PSD_MAG_Bipolar_NRZ,PSD_MAG_MLT3,PSD_MAG_Unipolar_RZ,PSD_MAG_Polar_RZ,PSD_MAG_Bipolar_RZ,PSD_MAG_Manchester};
all_freq={freq_Unipolar_NRZ,freq_Polar_NRZ,freq_Bipolar_NRZ,freq_MLT3,freq_Unipolar_RZ,freq_Polar_RZ,freq_Bipolar_RZ,freq_Manchester};
PlotPSD(all_PSD,all_freq);

