function [] = AnalyzeCrossCorrelation_Handler_Turner2022(rootFolder,delim,runFromStart)
%________________________________________________________________________________________________________________________
% Written by Kevin L. Turner
% The Pennsylvania State University, Dept. of Biomedical Engineering
% https://github.com/KL-Turner
%
% Purpose: Handle function for AnalyzeCrossCorrelation_Turner2022.mat
%________________________________________________________________________________________________________________________

% create or load results structure
if runFromStart == true
    Results_CrossCorrelation = [];
elseif runFromStart == false
    % load existing results structure, if it exists
    if exist('Results_CrossCorrelation.mat','file') == 2
        load('Results_CrossCorrelation.mat','-mat')
    else
        Results_CrossCorrelation = [];
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
multiWaitbar('Analyzing cross correlation during each behavior',0,'Color','P'); pause(0.25);
for bb = 1:length(animalIDs)
    if isfield(Results_CrossCorrelation,(animalIDs{1,bb})) == false
        [Results_CrossCorrelation] = AnalyzeCrossCorrelation_Turner2022(animalIDs{1,bb},rootFolder,delim,Results_CrossCorrelation);
    end
    multiWaitbar('Analyzing cross correlation during each behavior','Value',aa/waitBarLength);
    aa = aa + 1;
end

end
