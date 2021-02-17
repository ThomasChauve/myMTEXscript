function ori=ODF2CraFT(odf,nb_ori,name)
% Function to export an MTEX ODF to CraFT
% ODF2CraFT(CS,nb_ori,name)
% CS is the Cristal symmetry
% nb_ori is the number of orientation you want in the output file
% name is the file name

ori = odf.discreteSample(nb_ori);

phase_out = fopen(name,'w');
fprintf(phase_out,'#------------------------------------------------------------\n');
fprintf(phase_out,'# This file give for each phase \n# *the matetial \n# *its orientation (3 euler angles)\n');
fprintf(phase_out,'#------------------------------------------------------------\n');
fprintf(phase_out,'# phase    material       phi1    Phi   phi2\n');
fprintf(phase_out,'#------------------------------------------------------------\n');
for i =1:nb_ori
    fprintf(phase_out,string(i) + '          0              ' + string(ori(i).phi1) + ' ' + string(ori(i).Phi) + ' ' + string(ori(i).phi2) + '\n');  
end

fclose(phase_out);

end

