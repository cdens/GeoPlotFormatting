README File for GeoPlotFormatting:

This project includes two MATLAB functions to handle geographic plots in MATLAB on traditional (non-mapping) axes.

makegeoticks.m adds degrees E/W/N/S symbols to the longitude/latitude labels on an existing plot.
WARNING: Do not pan/zoom on your figure after applying this function. For further information, see the help text within the function.

setgeoaxes.m adjusts the x/y limits of the plot to ensure a correct aspect ratio that corrects for both the actual plot aspect ratio and cosine contraction of the longitude w.r.t. latitude.