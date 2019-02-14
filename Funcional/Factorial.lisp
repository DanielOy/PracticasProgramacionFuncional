;Programa que devuelve el factorial de un numero ingresado
;Es el programa usado de ejemplo pero se aumenta el print que no se tenia
(defun factorial (n)
   (if (= 0 n)
     1                            
     (* n (factorial (- n 1))))) 
(print(factorial 5))