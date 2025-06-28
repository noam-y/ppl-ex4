:- module('ex4',
        [author/2,
         genre/2,
         book/4
        ]).

/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).
:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).



author(a, asimov).
author(h, herbert).
author(m, morris).
author(t, tolkien).

genre(s, science).
genre(l, literature).
genre(sf, science_fiction).
genre(f, fantasy).

book(inside_the_atom, a, s, s(s(s(s(s(zero)))))).
book(asimov_guide_to_shakespeare, a, l, s(s(s(s(zero))))).
book(i_robot, a, sf, s(s(s(zero)))).
book(dune, h, sf, s(s(s(s(s(zero)))))).
book(the_well_at_the_worlds_end, m, f, s(s(s(s(zero))))).
book(the_hobbit, t, f, s(s(s(zero)))).
book(the_lord_of_the_rings, t, f, s(s(s(s(s(s(zero))))))).

% You can add more facts.


% Signature: checkleq(X, Y)/2
% Purpose: true if X >= Y
checkleq(_,zero).
checkleq(s(X), s(Y)) :- checkleq(X, Y).

% Signature: max_list(Lst, Max)/2
% Purpose: true if Max is the maximum church number in Lst, false if Lst is emoty.
max_list([], Max).
max_list([H|T], Max) :-
        max_list(T, Max),
        checkleq(Max, H).



% Signature: author_of_genre(GenreName, AuthorName)/2
% Purpose: true if an author by the name AuthorName has written a book belonging to the genre named GenreName.

author_of_genre(GenreName, AuthorName) :-
        author(Aut,AuthorName),
        genre(GN, GenreName),
        book(_M, Aut, GN, _R).


% Signature: longest_book(AuthorName, BookName)/2
% Purpose: true if the longest book that an author by the name AuthorName has written is titled BookName.
% TODO SHAAT KABALA
%longest_book(AuthorName, BookName) :-
%        author(Aut,AuthorName),
%        book(BookName, Aut, _X3, N),
%        findall(S, book(_X1,Aut, _X2,S),L),
%        max_list(L, N).
longest_book(AuthorName, BookName) :-
        author(Aut, AuthorName),
        findall(Len, book(_Name, Aut, _X2, Len), L),
        book(BookName, Aut, _GN, Booklen),
        max_list(L, Booklen).