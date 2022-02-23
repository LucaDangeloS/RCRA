%DamaTigreHugo

{d1 ; d2 ; p1}.


% m <-> d1 ^ d2
% m -> d1 ^ ¬d2
% p1 -> d1

:- p1, not d1.

% p1 -> ¬d2

:- p1, d2.

%d1 ^ ¬ d2 -> p1

:- d1, not d2, not p1.


% ¬p1 <-> d1 xor d2
% ¬p1 -> d1 xor d2
% ¬p1 -> (d1 v d2) ^ (¬d1 v ¬d2)
% ¬p1 -> d1 v d2

:- not p1, not d2, not d2.

:- not p1, d1, d2.

%d1 xor d2 -> ¬p1
%(d1 v d2) ^ (¬d1 v ¬d2) -> ¬p1
% d1 ^d2 -> ¬p1

:- d1, not d2, p1.
:- not d1, d2, p1.
