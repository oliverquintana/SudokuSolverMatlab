function p = check(X, i, j, sel)
    %% Función check
    % Determina los posibles números que satisfacen la casilla a evaluar.
    % Se realizan 3 revisiones por casilla en base a las reglas básicas 
    % del Sudoku.
    % Entrada:
    % X - Matriz correspondiente al tablero.
    % i - Fila en la que se encuentra la casilla a evaluar.
    % j - Columna en la que se encuentra la casilla a evaluar.
    % sel - Selección de la regla deseada:
    %       0 - Revisión por fila
    %       1 - Revisión por columna
    %       2 - Revisión por sector de 3x3
    % Salida:
    % p - Vector con los posibles números a asignar a la casilla i,j.
    %%
    
    p = [];
    
    if sel == 0 % Fila
        
        y = X(i,:); % Números del tablero de la fila i        
        
        for i=1 : 9
            if not(ismember(i,y))
                p = [p, i];
            end
        end
       
    elseif sel == 1 % Columna
        
        y = X(:,i); % Números del tablero de la columna i
        
        for i=1 : 9
            if not(ismember(i,y))
                p = [p, i];
            end
        end
       
    else % Sector
        
        Y = square(X,i,j); % Matriz correspondiente al sector de la casilla i,j
        
        for i=1 : 9
            if not(ismember(i,Y))
                p = [p,i];
            end
        end
    end
end
