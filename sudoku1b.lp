% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

{ sudoku(X,Y,V) : V = 1..4 } = 1 :- X = 1..4, Y = 1..4.
% achieved: generate all possible solutions for each row, column, and value

:- sudoku(X,Y,V), sudoku(X',Y',V'), X = 1..4, X' = 1..4, Y = 1..4, Y' = 1..4, V = 1..4, Y != Y', X = X', V = V'.
% achieved: in row X, make sure value V doesn't appear in two different columns (Y and Y')

:- sudoku(X,Y,V), sudoku(X',Y',V'), Y = 1..4, Y' = 1..4, X = 1..4, X' = 1..4, V = 1..4, X != X', Y = Y', V = V'.
% achieved: in column Y, make sure value V doesn't appear in two different rows (X and X')

sudoku(X,Y,V) :- initial(X,Y,V).
% achieved: every initial is copied and made into a sudoku object

{ subgrid(X,Y,G) : G = 1..4 } = 1 :- X = 1..4, Y = 1..4.
% achieved: generate all subgrids combinations possible (basically same as sudoku generator)

:- subgrid(X,Y,G), X <= 2, Y <= 2, G != 1.
% achieved: eliminate all solutions in first quadrant with G = 1.

:- subgrid(X,Y,G), X <= 2, Y > 2, G != 2.
% achieved: eliminate all solutions in second quadrant with G = 2.

:- subgrid(X,Y,G), X > 2, Y <= 2, G != 3.
% achieved: eliminate all solutions in third quadrant with G = 3.

:- subgrid(X,Y,G), X > 2, Y > 2, G != 4.
% achieved: eliminate all solutions in fourth quadrant with G = 4.

% end of solution

#show sudoku/3.
#show subgrid/3.
