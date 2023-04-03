;;Author: DIego Sandoval

#lang racket

;;Array iwth reserved words in C#
(define c-reserved-words 
  '("abstract" "as" "base" "bool" "break" "byte" "case" "catch" "char" "checked" "class" "const" "continue" "decimal" "default" "delegate" "do" "double" "else" "enum" "event" "explicit" "extern" "false" "finally" "fixed" "float" "for" "foreach" "goto" "if" "implicit" "in" "int" "interface" "internal" "is" "lock" "long" "namespace" "new" "null" "object" "operator" "out" "override" "params" "private" "protected" "public" "readonly" "ref" "return" "sbyte" "sealed" "short" "sizeof" "stackalloc" "static" "string" "struct" "switch" "this" "throw" "true" "try" "typeof" "uint" "ulong" "unchecked" "unsafe" "ushort" "using" "virtual" "void" "volatile" "while"))


;;Function that returns true if the word is a reserved word in C#

(define is-c-reserved-word? 
  (lambda (word)
    (cond
      [(member word c-reserved-words) #t]
      [else #f])))

;; ejemplo de uso
(is-c-reserved-word? "null") ;; retorna #t
(is-c-reserved-word? "foobar") ;; retorna #f
