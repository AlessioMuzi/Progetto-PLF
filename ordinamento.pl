/* Programma Prolog che implementa gli algoritmi di ordinamento Insert Sort, Select Sort e Bubble Sort. */

main :- write('Inserire la lista di numeri interi da ordinare racchiusa tra parentesi quadre:'), nl,
        read(Input), interi(Input, Lista), copy_term(Lista, Lista1), copy_term(Lista, Lista2), copy_term(Lista, Lista3), nl, 
	write('Lista ordinata con Insert Sort:'), nl,
	statistics(cpu_time, [T1, _]),
	insertSort(Lista1, A), write(A), nl,
	statistics(cpu_time, [T2, _]), Tempo1 is T2 - T1,
	write('Tempo di esecuzione di Insert Sort:'), nl, write('circa '), write(Tempo1), write(' ms'), nl, nl,
	write('Lista ordinata con Select Sort:'), nl, 
	statistics(cpu_time, [T3, _]),
	selectSort(Lista2, B), write(B), nl,
	statistics(cpu_time, [T4, _]), Tempo2 is T4 - T3,
	write('Tempo di esecuzione di Select Sort:'), nl, write('circa '), write(Tempo2), write(' ms'), nl, nl,
	write('Lista ordinata con Bubble Sort:'), nl,
	statistics(cpu_time, [T5, _]),
	bubbleSort(Lista3, C), write(C), nl,
        statistics(cpu_time, [T6, _]), Tempo3 is T6 - T5,
        write('Tempo di esecuzione di Bubble Sort:'), nl, write('circa '), write(Tempo3), write(' ms'), nl.	


interi([], []).
interi([A|Coda], [A|Coda1]) :- integer(A), interi(Coda, Coda1). 

/* Il predicato insertSort racchiude l'implementazione dell'algoritmo:
   - il primo argomento è la lista input;
   - il secondo argomento è la lista ordinata.

   Il predicato ordinaI esegue l'ordinamento:
   - il primo argomento è la lista input;
   - il secondo argomento è la sequenza ancora da ordinare;
   - il terzo argomento è la sequenza ordinata.

   Il predicato inserimento esegue l'inserimento dei numeri:
   - il primo argomento è l'elemento preso in considerazione;
   - il secondo argomento è la lista nella quale deve essere inserito;
   - il terzo argomento è la lista ottenuta con l'inserimento dell'elemento. */

insertSort(Lista, Ordinata) :- ordinaI(Lista, [], Ordinata).

ordinaI([], Resto, Resto).
ordinaI([T|Coda], Resto, Ordinata) :- inserimento(T, Resto, Resto1), ordinaI(Coda, Resto1, Ordinata).

inserimento(X, [], [X]).      
inserimento(X, [Y|Coda], [Y|Coda1]) :- X > Y, inserimento(X, Coda, Coda1).
inserimento(X, [Y|Coda], [X,Y|Coda]) :- X =< Y.

/* Il predicato selectSort implementa l'algoritmo:
   - il primo argomento è la lista da ordinare;
   - il secondo argomento è la lista ordinata.

   Il predicato min calcola l'elemento minimo della lista:
   - il primo argomento è la lista presa in considerazione;
   - il secondo argomento è l'elemento minimo;
   - il terzo argomento è la lista senza l'elemento minimo. */

selectSort([], []).
selectSort(Lista, [Min|Coda]) :- min(Lista, Min, Coda1), selectSort(Coda1, Coda).

min([H], H, []).
min([H|Coda], Min, [H|Coda1]) :- min(Coda, Min, Coda1), H >= Min.
min([H|Coda], H, [Min|Coda1]) :- min(Coda, Min, Coda1), H < Min.  

/*  Il predicato bubbleSort racchiude l'implementazione dell'algoritmo:
   - il primo argomento è la lista da ordinare;
   - il secondo argomento è la lista ordinata.

   Il predicato ordinaB esegue l'ordinamento:
   - il primo argomento è la lista da ordinare;
   - il secondo argomento è la sequenza ancora da ordinare;
   - il secondo argomento è la sequenza ordinata.

   Il predicato bubble esegue il confronto e lo scambio dei numeri:
   - il primo argomento è l'elemento preso in considerazione;
   - il secondo argomento è la lista nella quale deve essere inserito;
   - il terzo argomento è la lista ottenuta con l'inserimento dell'elemento;
   - il quarto argomento è il numero massimo. */

bubbleSort(Lista, Ordinata) :- ordinaB(Lista, [], Ordinata).

ordinaB([], Resto, Resto).
ordinaB([T|Coda], Resto, Ordinata) :- bubble(T, Coda, Coda1, Max), ordinaB(Coda1, [Max|Resto], Ordinata).
    
bubble(X, [], [], X).
bubble(X, [Y|Coda], [Y|Coda1], Max) :- X > Y, bubble(X, Coda, Coda1, Max).
bubble(X, [Y|Coda], [X|Coda1], Max) :- X =< Y, bubble(Y, Coda, Coda1, Max).
