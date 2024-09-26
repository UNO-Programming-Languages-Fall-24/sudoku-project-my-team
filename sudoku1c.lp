% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

{ sudoku(X,Y,V) : V = 1..4 } = 1 :- X = 1..4, Y = 1..4.
% achieved: generate all possible solutions for each row, column, and value

:- sudoku(X,Y,V), sudoku(X,Y',V'), Y = 1..4, Y' = 1..4, V = 1..4, Y != Y', V = V'.
% achieved: in row X, make sure value V doesn't appear in two different columns (Y and Y')

:- sudoku(X,Y,V), sudoku(X',Y,V'), X = 1..4, X' = 1..4, V = 1..4, X != X', V = V'.
% achieved: in column Y, make sure value V doesn't appear in two different rows (X and X')

sudoku(X,Y,V) :- initial(X,Y,V).
% achieved: every initial is copied and made into a sudoku object

:- sudoku(X,Y,V), sudoku(X',Y',V'), 1+(((X-1)/2)*2+(Y-1)/2) = 1+(((X'-1)/2)*2+(Y'-1)/2), X != X', Y' != Y, V = V'.
% achieved: given two different positions, they must be in the same subgrid, and their values can't be the same
% using the formula to convert grid positions to corresponding subgrid, we check if they're equal 

% end of solution

#show sudoku/3.