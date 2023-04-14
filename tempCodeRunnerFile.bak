(define list-of-chars->list-of-strings
  (lambda (loc aux result)
    (cond
      [(empty? loc) result]
      [(char-whitespace? (car loc))
       (list-of-chars->list-of-strings (cdr loc)
                                       '()
                                       (cons
                                        (list->string
                                         (cons (car loc) '()))
                                        (cons
                                         (list->string aux)
                                         result)))]
      [(char-punctuation? (car loc))
       (list-of-chars->list-of-strings (cdr loc)
                                       '()
                                       (cons
                                        (list->string
                                         (cons (car loc) '()))
                                        (cons
                                         (list->string aux)
                                         result)))]
      [else
       (list-of-chars->list-of-strings (cdr loc)
                                       (append aux (cons (car loc) '()))
                                       result)])))