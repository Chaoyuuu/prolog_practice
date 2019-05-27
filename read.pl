position(spielberg, director).
position(a, manager).
position(lee, supervisor).
find_position :-
    write(" whose position do you wish to know" ),
    read(Input), position(Input, Output),
    write(" The position of "), write(Input),
    write("is "), write(Output).
