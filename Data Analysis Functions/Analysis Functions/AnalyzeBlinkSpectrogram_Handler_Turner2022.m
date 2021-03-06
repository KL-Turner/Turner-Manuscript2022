function [] = AnalyzeBlinkSpectrogram_Handler_Turner2022(rootFolder,delim,runFromStart)
%________________________________________________________________________________________________________________________
% Written by Kevin L. Turner
% The Pennsylvania State University, Dept. of Biomedical Engineering
% https://github.com/KL-Turner
%
% Purpose: Handler function for AnalyzeBlinkSpectrogram_Turner2022.mat
%________________________________________________________________________________________________________________________

% create or load results structure
if runFromStart == true
    Results_BlinkSpectrogram = [];
elseif runFromStart == false
    % load existing results structure, if it exists
    if exist('Results_BlinkSpectrogram.mat','file') == 2
        load('Results_BlinkSpectrogram.mat','-mat')
    else
        Results_BlinkSpectrogram = [];
    end
end
% determine waitbar length
waitBarLength = 0;
folderList = dir('Data');
folderList = folderList(~startsWith({folderList.name},'.'));
animalIDs = {folderList.name};
waitBarLength = waitBarLength + length(animalIDs);
% run analysis for each animal in the group
aa = 1;
multiWaitbar('Analyzing blinking spectrogram',0,'Color','P'); pause(0.25);
for bb = 1:length(animalIDs)
    if isfield(Results_BlinkSpectrogram,(animalIDs{1,bb})) == false
        [Results_BlinkSpectrogram] = AnalyzeBlinkSpectrogram_Turner2022(animalIDs{1,bb},rootFolder,delim,Results_BlinkSpectrogram);
    end
    multiWaitbar('Analyzing blinking spectrogram','Value',aa/waitBarLength);
    aa = aa + 1;
end

end
