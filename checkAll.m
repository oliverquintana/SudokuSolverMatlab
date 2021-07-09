function P = checkAll(X)
    %% Función checkAll
    % Realiza un recorrido por todo el tablero de entrada encontrando las 
    % casillas en las que sólo un número se puede colocar y devuelve un
    % tablero adicional únicamente con estas casillas llenas.
    % Entrada:
    % X - Tablero a evaluar
    % Salida:
    % P - Matriz (tablero) con los números asignados en las casillas con 
    % sólo una posibilidad de llenado.
    
    P = zeros(9,9);
    
    % Recorrido por todo el tablero casilla a casilla
    for i=1 : 9 
        for j=1 : 9
            % Si la casilla es vacía, se continúa con la evaluación. De lo
            % contrario se salta.
            if X(i,j) == 0
                
                % Números que satisfacen la casilla en base a los números
                % ya ubicados en el resto de la columna
                col = check(X, j, 0, 1);
                % Números que satisfacen la casilla en base a los números
                % ya ubicados en el resto de la fila
                row = check(X, i, 0, 0);
                % Números que satisfacen la casilla en base a los números
                % ya ubicados en el resto del sector
                squ = check(X, i, j, 3);
                % Se intersectan los tres vectores previos (col, row, squ)
                % para almacenar únicamente los números que satisfacen las
                % tres condiciones.
                p = intersect(col, row);
                p = intersect(p, squ);
                
                % Si el vector resultante p contiene únicamente un valor
                % que satisface la casilla, éste se agrega al tablero.
                if length(p) == 1
                    P(i,j) = p();
                end

            end
        end
    end   
end
