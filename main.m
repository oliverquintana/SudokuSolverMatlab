%% Limpiar el espacio de trabajo
close all
clear
clc

%% Se carga el tablero del sudoku a resolver en forma matricial

X = [5 3 0 0 7 0 0 0 0;
     6 0 0 1 9 5 0 0 0;
     0 9 8 0 0 0 0 6 0;
     8 0 0 0 6 0 0 0 3;
     4 0 0 8 0 3 0 0 1;
     7 0 0 0 2 0 0 0 6;
     0 6 0 0 0 0 2 8 0;
     0 0 0 4 1 9 0 0 5;
     0 0 0 0 8 0 0 7 9];
 
 % Se crea una copia del tablero sobre de la cual se escribirá la solución
 X_new = X;
 X_sum = zeros(9,9);
 
%% Algoritmo de solución
% El algoritmo itera bajo la condición de que exista al menos una
% casiila vacía en el tablero (representada con "0")

while ismember(0, X_new)
    
    % Cálculo de los posibles números que satisfacen las reglas del Sudoku
    % en cada casilla vacía
    P = checkAll(X_new);
    
    % El tablero es actualizado con los valores encontrados
    X_sum = X_new + P;
    
    % Si ninguna casilla es llenada, se concluyen las iteraciones para
    % evitar que el ciclo se vuelva infinito
    if X_sum == X_new
        break;
    end
    X_new = X_sum;
    
end

% Se muestra en consola el tablero resultante
disp(X_new);
% La solución encontrada es evaluada para confirmar la correcta solución
% del tablero
comp(X_new);
% Despliegue del tablero inicial y su solución
drawSudoku(X,'Tablero Inicial')
drawSudoku(X_new,'Solución')
