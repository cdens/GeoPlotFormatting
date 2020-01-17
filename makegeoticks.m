function makegeoticks(curaxis)
% makegeoticks(curaxis)
% Author: C.R. Densmore
%
% Adjusts tick marks to include degE, degW, degN, and degS labels
%
% WARNING: DO NOT ADJUST THE PLOT AFTER APPLYING THIS FUNCTION!
% This function should be called immediately before saving a plot. Any
% adjustments to the plot (either zooming, panning, or changing the aspect
% ratio) will result in incorrect longitude/latitude labels being displayed
% on the plot. In order to reset the plot to remove this effect using an
% axis handle curaxes, type:
% set(curaxes,'xticklabel',strsplit(num2str(get(curaxes,'xtick'))))
% set(curaxes,'yticklabel',strsplit(num2str(get(curaxes,'ytick'))))
%
% Input variables
%   o curaxes: handle to the axes to correct


oldxticks = get(curaxis,'xtick');
oldyticks = get(curaxis,'ytick');

for i = 1:length(oldxticks)
    if oldxticks(i) >= 0
        newxticks{i} = [num2str(abs(oldxticks(i))),'^oE']; %#ok<*AGROW>
    elseif oldxticks(i) < 0
        newxticks{i} = [num2str(abs(oldxticks(i))),'^oW'];
    else
        warning('Tick value NaN: Retaining original')
        newxticks{i} = 'ERROR';
    end
end

for i = 1:length(oldyticks)
    if oldyticks(i) >= 0
        newyticks{i} = [num2str(abs(oldyticks(i))),'^oN'];
    elseif oldyticks(i) < 0
        newyticks{i} = [num2str(abs(oldyticks(i))),'^oS'];
    else
        warning('Tick value NaN: Retaining original')
        newyticks{i} = 'ERROR';
    end
end

set(curaxis,'xticklabels',newxticks);
set(curaxis,'yticklabels',newyticks);

