%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GIRVAN NEWMAN ALGORITHM
%
% Algorithm: 
% 1.The betweenness of all existing edges in the network is calculated first.
% 2.The edge with the highest betweenness is removed.
% 3.The betweenness of all edges affected by the removal is recalculated.
% 4.Steps 2 and 3 are repeated until no edges remain.
%
% Input: auxAdjMatrix (Upper adjacency matrix) and nClasses (number of
% classes)
% Output: history (array that contains the evolution of the adjacency
% matrix through the algorithm)
%
% Leire Roa and Mikel Sanchez
% April 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [history] = GirvanNewman(auxAdjMatrix, nClasses)
    % Save original Matrix
    history = cell(1, nClasses+1);
    contHist = 1;
    history{contHist} = auxAdjMatrix;

    % Calculate betweenness of the original Matrix
    [btwnessArray arrayPaths] = btw(auxAdjMatrix);

    % While the number of communities is less than the number of classes
    while (contHist<(nClasses+1))
        disp('WHILE');
        disp(contHist);
        contHist = contHist +1;
        fullMatrix = auxAdjMatrix + auxAdjMatrix';
       
        % Check if the component is connected
        G = graph(fullMatrix);
        components = conncomp(G);
        aux = max(components);
        %disp(aux);
        
        if (aux > 1)
            disp('The component is not connected anymore');
            break;
        end;
        
        % Find and remove the edge with highest betweenness
        [posi posj]=calculatePostitions(btwnessArray);

        auxAdjMatrix(posi,posj) = 0;

        clear arrayPaths;

        % Calculate the new betweenness
        [btwnessArray arrayPaths] = btw(auxAdjMatrix);

        % Update of the history variable
        history{contHist} = auxAdjMatrix;
    end;
end