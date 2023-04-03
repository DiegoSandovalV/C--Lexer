;;Author: DIego Sandoval

#lang racket

(define (type-of-c-reserved-word word)
  (cond
   [(regexp-match? #px"\\b(public|private|protected)\\b" word) "Access modifier"]
   [(regexp-match? #px"\\b(bool|byte|char|decimal|double|float|int|long|object|sbyte|short|string|uint|ulong|ushort)\\b" word) "Data type"]
   [(regexp-match? #px"\\b(if|else|switch|case|default|for|foreach|while|do|break|continue|goto|return|yield|checked|unchecked)\\b" word) "Control flow statement"]
   [(regexp-match? #px"\\b(class|struct|interface|enum)\\b" word) "Class or struct keyword"]
   [(regexp-match?  #px"\\+|\\-|\\*|/|%|\\&|\\||\\^|~|<<|>>|==|!=|<|>|<=|>=|&&|\\|\\||!|\\+=|\\-=|\\*=|/=|%=|\\&=|\\|=|\\^=|<<=|>>=|\\?|:|\\.|->|=>|\\(\\)|\\[\\]|\\{\\}"
   word) "Operator"]
   [(regexp-match? #px"\\b(try|catch|finally|throw|new)\\b" word) "Exception handling keyword"]
   [(regexp-match? #px"\\[[^\\]]*\\]" word) "Attribute"]
   [(regexp-match? #px"\\b(using|namespace|class|struct|interface|delegate|event|object|typeof|void|checked|unchecked|unsafe|operator|implicit|explicit|this|base|params|in|out|ref|is|as|sizeof|stackalloc|fixed|lock|from|where|select|group|into|orderby|join|let|equals|by)\\b" word) "Miscellaneous keyword"]
  [else 'not-a-c-reserved-word]))

;; ejemplo de uso
(type-of-c-reserved-word "public") ;; retorna "Access modifier"
(type-of-c-reserved-word "double") ;; retorna "Data type"
(type-of-c-reserved-word "if") ;; retorna "Control flow statement"
(type-of-c-reserved-word "interface") ;; retorna "Class or struct keyword"
(type-of-c-reserved-word "+") ;; retorna "Operator"
(type-of-c-reserved-word "try") ;; retorna "Exception handling keyword"
(type-of-c-reserved-word "[Obsolete]") ;; retorna "Attribute"
(type-of-c-reserved-word "using") ;; retorna "Miscellaneous keyword"
(type-of-c-reserved-word "foobar") ;; retorna "Not a C# reserved word"
