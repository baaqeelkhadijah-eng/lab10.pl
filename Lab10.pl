% ARTI 401 - Session 10: Prolog Operators Part II

% Task 1: Calculate the area and perimeter of each shape.
% Example: square(5, Area, Perimeter).              % 25, 20
square(Side, Area, Perimeter) :-
    Area is Side * Side,
    Perimeter is 4 * Side.

% Example: rectangle(4, 6, Area, Perimeter).        % 24, 20
rectangle(Width, Height, Area, Perimeter) :-
    Area is Width * Height,
    Perimeter is 2 * (Width + Height).

% Height is perpendicular to Base. Base, SideB and SideC are the three sides.
% Example: triangle(4, 3, 3, 5, Area, Perimeter).   % 6, 12
triangle(Base, Height, SideB, SideC, Area, Perimeter) :-
    Area is Base * Height / 2,
    Perimeter is Base + SideB + SideC.

% Task 2: Sample login dataset.
:- use_module(library(readutil)).
user_account("student", "lab10").
user_account("sara", "sara123").

% Run login. and enter each value on its own line without quotes or a period.
login :-
    login_attempt(3).

login_attempt(AttemptsLeft) :-
    write('Username: '), flush_output,
    read_line_to_string(user_input, Username),
    write('Password: '), flush_output,
    read_line_to_string(user_input, Password),
    (   user_account(Username, Password)
    ->  writeln('Login Successful')
    ;   writeln('Login Unsuccessful'),
        (   AttemptsLeft > 1
        ->  Remaining is AttemptsLeft - 1,
            login_attempt(Remaining)
        ;   writeln('Sorry, you exceeded the maximum number of attempts, try again later.')
        )
    ).
