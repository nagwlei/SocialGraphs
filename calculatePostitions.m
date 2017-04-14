%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CALCULATE POSITIONS OF THE EDGES TO REMOVE
%
% Input: btwnessArray (array containing all the betweness of the edges
% Output: posi and posj
%
% Leire Roa and Mikel Sanchez
% April 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [posi posj]=calculatePostitions(btwnessArray)
    myMax = max(btwnessArray);
    maxval = max(max(btwnessArray));
    [posi posj] = find(btwnessArray == maxval);
end