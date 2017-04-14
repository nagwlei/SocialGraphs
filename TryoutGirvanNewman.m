%% TRYOUT OF THE GIRVAN NEWMAN ALGORITHM
s=[1 1 1 1 2 2 2];
A=[0 1 1 1 0 0 0;...,
   1 0 1 1 0 0 0;...,
   1 1 0 1 0 0 0;...,
   1 1 1 0 1 0 0;...,
   0 0 0 1 0 1 1;...,
   0 0 0 0 1 0 1;...,
   0 0 0 0 1 1 0];
nClasses = max(s);

auxAdjMatrix = sparse(A);

history = GirvanNewman(auxAdjMatrix, nClasses);
