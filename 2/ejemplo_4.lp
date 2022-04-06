% Ejemplo toggles y bombillas
{upa0; upb0; upc0; light0}.
{upa1; upb1; upc1; light1}.
%{toga1; togb1; togc1}.  % Si no se pone, se consideran falso por defecto
% También sirve limitar la cardinalidad a 1

% upa0 ^ toga1 -> ¬ upa1
:- upa0, toga1, upa1.
% upa0 ^ toga1 -> upa1
:- not upa0, toga1, not upa1.

:- upb0, togb1, upb1.
:- not upb0, togb1, not upc1.

:- upc0, togc1, upc1.
:- not upc0, togb1, not upc1.

% light0 ^ tog1 -> ~light1
:- light0, toga1, light1.
:- not light0, toga1, not light1.
:- light0, togb1, light1.
:- not light0, togb1, not light1.
:- light0, togc1, light1.
:- not light0, togc1, not light1.

% FRAME AXIOMS
% upb0 ^ toga1 ->upb1
:- upb0, toga1, not upb1.
:- not upb0, toga1, upb1.
:- upb0, toga1, not upc1.
:- not upb0, toga1, upc1.

upa0.
upb0.
upc0.
light0.
toga1.