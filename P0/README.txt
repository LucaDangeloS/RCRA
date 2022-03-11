Para generar el tablero de hitori para clingo con encode.py, para un tablero de hitori X:

    ./encode.py < hitori_X.txt > hitoriX.lp

    o bien,

    python3 ./encode.py < hitori_X.txt > hitoriX.lp


Para generar la solución de un hitori usando la KB, para un tablero de hitori X:

    clingo 0 hitoriKB.lp hitoriX.lp

Para generar el tablero de salida con la solución para un hitori X:

    clingo 0 hitoriKB.lp hitoriX.lp | ./decode.py > solutionX.txt

    o bien,

    clingo 0 hitoriKB.lp hitoriX.lp | python3 ./decode.py > solutionX.txt

Si no se define el pipeline de salida de la solución el resultado se muestra por pantalla.

En caso de que no haya resultado no se muestra nada.

NOTA: Para los scripts de python es necesario python 3.X y las librerías "re" y "math", que suelen
    venir instaladas por defecto.