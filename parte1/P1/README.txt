Para generar el estado del unblock para telingo:

    ./encode.py < levelX.txt > levelX.lp

    o bien,

    python3 ./encode.py < levelX.txt > levelX.lp


Para generar la secuencia de movimientos que lleva a la solución de un unblock:

    telingo --verbose=0 --warn none unblock.lp levelX.lp > solX.txt


Si no se define el pipeline de salida de la solución el resultado se muestra por pantalla.

NOTA: Para los scripts de python es necesario python 3.X