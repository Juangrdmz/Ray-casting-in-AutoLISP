# Ray-casting-in-AutoLISP

This LISP routine uses the conditions

(Y1 > YP) ≠ (Y2 > YP) and (XP - X1) < (Y2 - Y1) * (X2 - X1) / (YP - Y1)

to test a point with a polygon vertices list and
returns a true/nill value for the variable "inside_condition"
