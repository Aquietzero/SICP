; The problem lies in the division operation, which switches the positions of the
; origin lower bound and upper bound. And even though the above result shows that
; `par2` maybe correct, but the correctness only stands since it has 2 divisions,
; each of which filps the denominator and numerator once and then gives the correct
; result. It does not have meaning behind that.
