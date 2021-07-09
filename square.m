function Y = square(X,i,j)
    %% Función square
    % Devuelve la matriz de 3x3 correspondiente al sector del tablero en el
    % que se encuentra la casilla i,j.
    % Entrada:
    % X - Tablero
    % i - Fila en la que se encuentra la casilla
    % j - Columna en la que se encuentra la casilla
    % Salida:
    % Y - Matriz correspondiente al sector de la casilla i,j
    %%
    
    % Límites para la matriz del sector en la que se encuentra la casilla
    % i,j.
    if i <= 3
        row_lim1 = 1;
        row_lim2 = 3;
    elseif i <= 6
        row_lim1 = 4;
        row_lim2 = 6;
    else
        row_lim1 = 7;
        row_lim2 = 9;
    end
        
    if j <= 3
        col_lim1 = 1;
        col_lim2 = 3;
    elseif j <= 6
        col_lim1 = 4;
        col_lim2 = 6;
    else
        col_lim1 = 7;
        col_lim2 = 9;
    end
    
    % Sector resultante dados los límites calculados previamente
    Y = X(row_lim1:row_lim2, col_lim1 : col_lim2);
    Y = [Y(1,:), Y(2,:), Y(3,:)];
    
end
