;;Author:
;;Diego Sandoval
;;Yuna Chung
;;Olimpia Garcia

#lang racket
(require 2htdp/batch-io)

;;Input and Output filenames
(define input-file "test.cs")
(define output-file "outputFinal.html")

;;Html header
(define html-header "<!DOCTYPE html> <html lang='en'> <head> <meta charset='UTF-8'> <meta http-equiv='X-UA-Compatible' content='IE=edge'> <meta name='viewport' content='width=device-width, initial-scale=1.0'> <title>C# File with syntax Higlight</title> </head> <body>")

;;Html footer
(define html-footer "</body> </html>")

;;Hmtl styles
(define html-styles "<style> span{font-family: sans-serif} .accessModifier{color: brown;} .dataType{color: blue} .controlFlow{color: darkorange;} .class{color: rgb(205, 176, 11);} .comment{color: gray; opacity: 0.5; } .operator{color: red;} .expectionHandling{color: rgb(86, 131, 18);} .attribute{color: indigo;} .miscellaneous{color: rgb(208, 11, 208);}.boolean{color: greenyellow;} </style>")


;;Funtions that opens an input file, reads it character by character,
;; returning it in a list of characters.
(define file->list-of-chars
  (lambda (filename)
    (flatten
     (map string->list
          (read-1strings filename)))))
          



;;function converts a list of characters to a list of strings.
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



;;function that opens an input file, reads it character by character,
;; returning it in a list of string.
(define file->list-of-strings
  (lambda (filename)
    (reverse
     (list-of-chars->list-of-strings
      (file->list-of-chars input-file) '() '()))))


;;Function that checks if a word is a c# reserved word, returning a span tag with the class of the reserved word
(define (type-of-c-reserved-word word)
  (cond
    ;;access modifiers
   [(regexp-match? #px"\\b(public|private|protected)\\b" word) (string-append"<span class='accessModifier'>" word "</span>")]

    ;;data types
   [(regexp-match? #px"\\b(bool|byte|char|decimal|double|float|int|long|object|sbyte|short|string|uint|ulong|ushort)\\b" word) (string-append"<span class='dataType'>" word "</span>")]

   ;;Control Flow statement
   [(regexp-match? #px"\\b(if|else|switch|case|default|for|foreach|while|do|break|continue|goto|return|yield|checked|unchecked)\\b" word) (string-append"<span class='controlFlow'>" word "</span>")]

    ;;Class or struct keyword
   [(regexp-match? #px"\\b(class|struct|interface|enum)\\b" word) (string-append"<span class='class'>" word "</span>")]

    ;;line break
  [(regexp-match? #px"\n.*" word) (string-append"<br>")]

   ;;line comment
   [(regexp-match? #px"//.*" word) (string-append"<span class='comment'>" word "</span>")]


    ;;Operator
   [(regexp-match?  #px"\\+|\\-|\\*|/|%|\\&|\\||\\^|~|<<|>>|==|!=|<|>|<=|>=|&&|\\|\\||!|\\+=|\\-=|\\*=|/=|%=|\\&=|\\|=|\\^=|<<=|>>=|\\?|:|\\.|->|=>|\\(\\)|\\[\\]|\\{\\}"
   word) (string-append"<span class='operator'>" word "</span>")]

    ;;Exception handling keyword
   [(regexp-match? #px"\\b(try|catch|finally|throw|new)\\b" word) (string-append"<span class='expectionHandling'>" word "</span>")]

    ;;Attribute
   [(regexp-match? #px"\\[[^\\]]*\\]" word) (string-append"<span class='attribute'>" word "</span>")]

    ;;Miscellaneous keyword
   [(regexp-match? #px"\\b(using|namespace|class|struct|interface|delegate|event|object|typeof|void|checked|unchecked|unsafe|operator|implicit|explicit|this|base|params|in|out|ref|is|as|sizeof|stackalloc|fixed|lock|from|where|select|group|into|orderby|join|let|equals|by)\\b" word) (string-append"<span class='miscellaneous'>" word "</span>")]

   ;Boolean literals
   [(regexp-match? #px"\\b(true|false)\\b" word) (string-append"<span class='boolean'>" word "</span>")]

    ;;spaces
    [(regexp-match? #px"\\s+" word) (string-append"<span>\u00A0</span>")]

    ;;Not a C# reserved word
   [else (string-append "<span>" word "</span>")]))


;;Function that check a list of strings, returning a string with the html code

(define html-file
    (lambda(stringLst htmlStr)
        (cond
        [(empty? stringLst) (string-append htmlStr "</body> </html>")]

        [else
        (html-file (rest stringLst) (string-append htmlStr (type-of-c-reserved-word (first stringLst))))])))

;;Function that appends the header, footer and styles to the html string

(define finalHtml
    (lambda (input-file)
        (string-append html-header (html-file (file->list-of-strings input-file) "") html-footer html-styles)))

;;Function that writes the html into a file
(define write-html
    (lambda (input-file output-file)
        (write-file output-file (finalHtml input-file))))

(write-html input-file output-file)

