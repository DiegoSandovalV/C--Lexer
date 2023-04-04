#lang racket

(require racket/html)
(require racket/port)

(define (my-page)
  (html
   (head
    (title "Mi página web"))
   (body
    (div ((class "container") (style "background-color: #f0f0f0;"))
         "Contenido de la página"))))

(define (write-page-to-file filename)
  (define output-port (open-output-file filename))
  (write-output-to-file my-page output-port)
  (close-output-port output-port))

(write-page-to-file "mi_pagina.html")
