;|      ---Point in polygon (ray casting) routine using lineal interpolation---
      Last edited: 15/06/2025
      Work by: juangrdmz @ https://github.com/Juangrdmz/Ray-casting-in-AutoLISP
      source: Inside code @ https://www.youtube.com/watch?v=RSXM9bgqxJM |;

;|    this function expects a point coordinates in test_point and 
      the list of polygon coordinates in vertices_coordinates           |;
(defun c:RAY_CAST (test_point vertices_coordinates / XP YP inside_condition 
                         vertice_2 current_index X1 Y1 X2 Y2)
  (setq XP (car test_point) 
        YP (cadr test_point))
  (setq inside_condition nil)
  (setq vertice_2 (1- (length vertices_coordinates)))
  (setq vertice_1 0)
  ;|  Define the coordinates of the test_point 1 
      and 2, this will be done for every face    |;
  (while (< vertice_1 (length vertices_coordinates))
    (setq X1 (car (nth vertice_1 vertices_coordinates)))
    (setq Y1 (cadr (nth vertice_1 vertices_coordinates)))
    (setq X2 (car (nth vertice_2 vertices_coordinates)))
    (setq Y2 (cadr (nth vertice_2 vertices_coordinates)))
    (if (and 
          ;condition (Y1 > YP) ≠ (Y2 > YP)
          (or (and (> Y1 YP) (<= Y2 YP)) 
              (and (<= Y1 YP) (> Y2 YP)))
          ;condition (XP - X1) < (Y2 - Y1) * (X2 - X1) / (YP - Y1)
          (< XP (+ X1 (* (/ (- YP Y1) (- Y2 Y1)) (- X2 X1)))))
      (setq inside_condition (not inside_condition)))
    (setq vertice_2 vertice_1)
    (setq vertice_1 (1+ vertice_1))
  )
inside_condition)
