function [newlonrange,newlatrange] = setgeoaxes(curaxes,lonrange,latrange,axistoadjust)
% [newlonrange,newlatrange] = setgeoaxes(curaxes,lonrange,latrange,axistoadjust)
% Author: C.R. Densmore
%
% Corrects aspect ratio on traditional (non-mapping) axes for geographic
% contraction with latitude, and aspect ratios of figure and axes windows.
%
% Input variables
%   o curaxes: handle to the axes to correct
%   o lonrange: ideal longitude (x-axis) range to include in plot
%   o latrange: ideal latitude (y-axis) range to include in plot (all
%       values should be between -90 and 90 degrees)
%   o axistoadjust: specify which axis is corrected to fix aspect ratio
%       (either 'x' or 'y'). For example, if axistoadjust = 'x', then the
%       longitude range of the axes will be modified to correct for the
%       plot's aspect ratio


%make sure the axes are set to the prescribed ranges before getting plot
%aspect ratio
xlim(curaxes,lonrange)
ylim(curaxes,latrange)

plotratio = get(curaxes,'plotboxaspectratio');
yoverxratio = plotratio(2)/plotratio(1);

%axis intervals, center values
dlonold = diff(lonrange)/2;
dlatold = diff(latrange)/2;
meanlat = mean(latrange);
meanlon = mean(lonrange);

%determining correct lat/lon distortion at latitude
lonoverlatratio = cos(meanlat*pi/180);

%find dlat such that dlon/dlat = lonoverlatratio, corrected for plot aspect ratio
dlatnew = dlonold/lonoverlatratio*yoverxratio;
dlonnew = dlatold*lonoverlatratio/yoverxratio;

newlonrange = [meanlon-dlonnew,meanlon+dlonnew];
newlatrange = [meanlat-dlatnew,meanlat+dlatnew];


switch axistoadjust
    case 'x'
        
        set(curaxes,'xlim',newlonrange)
        set(curaxes,'ylim',latrange)
        
    case 'y'
        
        set(curaxes,'xlim',lonrange)
        set(curaxes,'ylim',newlatrange)
end