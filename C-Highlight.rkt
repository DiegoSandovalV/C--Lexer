;;Author: DIego Sandoval

#lang racket

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

   ;;Comment
   [(regexp-match? #px"//.*|/\\*.*?\\*/" word) (string-append"<span class='comment'>" word "</span>")]

    ;;Operator
   [(regexp-match?  #px"\\+|\\-|\\*|/|%|\\&|\\||\\^|~|<<|>>|==|!=|<|>|<=|>=|&&|\\|\\||!|\\+=|\\-=|\\*=|/=|%=|\\&=|\\|=|\\^=|<<=|>>=|\\?|:|\\.|->|=>|\\(\\)|\\[\\]|\\{\\}"
   word) (string-append"<span class='operator'>" word "</span>")]

    ;;Exception handling keyword
   [(regexp-match? #px"\\b(try|catch|finally|throw|new)\\b" word) (string-append"<span class='expectionHandling'>" word "</span>")]

    ;;Attribute
   [(regexp-match? #px"\\[[^\\]]*\\]" word) (string-append"<span class='attribute'>" word "</span>")]

    ;;Miscellaneous keyword
   [(regexp-match? #px"\\b(using|namespace|class|struct|interface|delegate|event|object|typeof|void|checked|unchecked|unsafe|operator|implicit|explicit|this|base|params|in|out|ref|is|as|sizeof|stackalloc|fixed|lock|from|where|select|group|into|orderby|join|let|equals|by)\\b" word) (string-append"<span class='miscellaneous'>" word "</span>")]

    ;;Not a C# reserved word
  [else ""]))

;; ejemplo de uso
(type-of-c-reserved-word "public") ;; retorna "Access modifier"
(type-of-c-reserved-word "double") ;; retorna "Data type"
(type-of-c-reserved-word "if") ;; retorna "Control flow statement"
(type-of-c-reserved-word "interface") ;; retorna "Class or struct keyword"
(type-of-c-reserved-word "// Esto es un comentario") ;; retorna "Comment"
(type-of-c-reserved-word "+") ;; retorna "Operator"
(type-of-c-reserved-word "try") ;; retorna "Exception handling keyword"
(type-of-c-reserved-word "[Obsolete]") ;; retorna "Attribute"
(type-of-c-reserved-word "using") ;; retorna "Miscellaneous keyword"
(type-of-c-reserved-word "foobar") ;; retorna "Not a C# reserved word"

