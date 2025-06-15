# Ray-casting-in-AutoLISP

This AutoLISP routine uses the conditions:

1. (Y1 > YP) ≠ (Y2 > YP)
2. (XP - X1) < (Y2 - Y1) * (X2 - X1) / (YP - Y1)

to test a point with a polygon vertices list and
returns a true/nill value for the variable "inside_condition"

To use the routine in AutoCAD first is needed to connect this code with the rest of your AutoLISP routine with the variables "test_point" and "vertices_coordinates" to get a value for "inside_condition"
