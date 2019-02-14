;Programa que devuelve e imprime si es positivo o negativo el valor ingresado
;Es el codigo de ejemplo pero se modifico para que la funcion regrese el valor en ves de imprimirlo
;Se probo con el compilador online Rextester
;https://rextester.com/l/common_lisp_online_compiler
(defun signos (lista)
  (dolist (e lista)
    (cond
      ((> e 0)
         (return "positivo"))
      ((< e 0)
         (return "negativo"))
      (t
         (return "nulo")))) )
(print(signos '(7)))