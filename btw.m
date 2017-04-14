%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CALCULATE BETWEENNESS
%
% Input: adjMatrix (Upper adjacency matrix)
% Output: SPARSE (array containing all the results of the betweenness) and
% arraypaths (array containing all the paths to from a node to the rest of
% nodes)
%
% Leire Roa and Mikel Sanchez
% April 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [SPARSE arraypaths] = btw(adjMatrix)
    % AUXILIAR PARA GUARDAS LOS RESULTADOS de la betweeness
    SPARSE = sparse(length(adjMatrix),length(adjMatrix));

    for i=1:length(adjMatrix)
        disp('i: ');
        disp(i);      
        [~, path, ~] = graphshortestpath(adjMatrix, i);
        for j=(i+1):length(adjMatrix)
            %if(i~=j)
                shortpaths = path{j};
                for k=1:(length(shortpaths)-1)
                    minVal = min(shortpaths(k), shortpaths(k+1));
                    maxVal = max(shortpaths(k), shortpaths(k+1));
                    SPARSE(minVal, maxVal) = SPARSE(minVal, maxVal) + 1;
                end;
            %end;
        end;
        arraypaths{i} = path;
    end;
    
    % Añadir si pasa por el camino o no a otra matriz, para luego no tener
    % que recalcularlo.
end

