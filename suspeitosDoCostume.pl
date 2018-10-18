%-----------------------------------
% existe(S1, Suspeitos)
%-----------------------------------
% S1 � um elemento da lista
% Suspeitos.
existe(S1, [S1 | _]).
existe(S1, [_ | R]) :-
	existe(S1, R).

%-----------------------------------
% lado(S1, S2, Suspeitos)
%-----------------------------------
% S1 e S2 encontram-se um ao lado
% do outro na lista Suspeitos.
lado(S1, S2, [S1, S2 | _]).
lado(S1, S2, [S2, S1 | _]).
lado(S1, S2, [_ | R]) :-
	lado(S1, S2, R).

%-----------------------------------
% entre(S1, S2, S3, Suspeitos)
%-----------------------------------
% S2 encontra-se entre S1 e S3 na
% lista Suspeitos.
entre(S1, S2, S3, [S1, S2, S3 | _]).
entre(S1, S2, S3, [S3, S2, S1 | _]).
entre(S1, S2, S3, [_ | R]) :-
	entre(S1, S2, S3, R).

%-----------------------------------
% esquerda(S1, S2, Suspeitos)
%-----------------------------------
% S1 encontra-se na sublista �
% esquerda de S2, na lista
% Suspeitos.
esquerda(S1, S2, [S1|R]) :-
	existe(S2, R).
esquerda(S1, S2, [_|R]) :-
	esquerda(S1, S2, R).

%-----------------------------------
% direita(S1, S2, Suspeitos)
%-----------------------------------
% S1 encontra-se na sublista �
% direita de S2, na lista
% Suspeitos.
direita(S1, S2, [S2|R]) :-
	existe(S1, R).
direita(S1, S2, [_|R]) :-
	direita(S1, S2, R).

%-----------------------------------
% naoEntre(S1, S2, S3, Suspeitos)
%-----------------------------------
% S2 n�o se encontra entre S1 e S3
% na lista Suspeitos, mas pertence
% � lista.
naoEntre(S1, S2, S3, L) :-
	existe(S2, L),
	junta(_, [S1, S, S3 |_], L),
	S2 \== S.
naoEntre(S1, S2, S3, L) :-
	existe(S2, L),
	junta(_, [S3, S, S1 |_], L),
	S2 \== S.

%-----------------------------------
% ou(S1, S2, S3, Suspeitos)
%-----------------------------------
% S1, S2 e S3 s�o membros de
% Suspeitos tal que S1 � o mesmo que
% S2 ou (exclusivo) � o mesmo que S3.
ou(S1, S2, S1, Lista) :-
	S1 \== S2,
	existe(S2, Lista),
	existe(S1, Lista).
ou(S1, S1, S3, Lista) :-
	S1 \== S3,
	existe(S3, Lista),
	existe(S1, Lista).

%-----------------------------------
% junta(L1, L2, L)
%-----------------------------------
% L � a lista resultante da
% jun��o de L1 com L2.
junta([], L, L).
junta([P | R], L1, [P | L2]) :-
	junta(R, L1, L2).
