;;Author: DIego Sandoval

#lang racket

(define csharp-access-modifiers
  '("public" "private" "protected" "internal"))

(define csharp-data-types
  '("bool" "byte" "char" "decimal" "double" "float" "int" "long" "object" "sbyte" "short" "string" "uint" "ulong" "ushort" "void"))

(define csharp-control-flow-statements
  '("if" "else" "switch" "case" "default" "while" "do" "for" "foreach" "in" "break" "continue" "return" "goto"))

(define csharp-classes-and-structs
  '("class" "struct" "interface" "new")) 

(define csharp-operators
  '("+" "-" "*" "/" "%" "++" "--" "==" "!=" ">" "<" ">=" "<=" "&&" "||" "!" "&" "|" "^" "<<" ">>" "~" "=>" "?."))

(define csharp-exception-handling
  '("try" "catch" "finally" "throw"))

(define csharp-attributes
  '("attribute" "Obsolete" "Serializable"))

(define csharp-miscellaneous
  '("using" "namespace" "delegate" "event" "as" "is" "sizeof" "typeof" "unchecked"))


(define type-of-c-reserved-word
  (lambda (word)
    (cond
      [(member word csharp-access-modifiers) 'access-modifier]
      [(member word csharp-data-types) 'data-type]
      [(member word csharp-control-flow-statements) 'control-flow-statement]
      [(member word csharp-classes-and-structs) 'class-or-struct-keyword]
      [(member word csharp-operators) 'operator]
      [(member word csharp-exception-handling) 'exception-handling-keyword]
      [(member word csharp-attributes) 'attribute]
      [(member word csharp-miscellaneous) 'miscellaneous-keyword]
      [else #f])))



;; ejemplo de uso
(type-of-c-reserved-word "public") ;; retorna access-modifier
(type-of-c-reserved-word "double") ;; retorna data-type
(type-of-c-reserved-word "if") ;; retorna control-flow-statement
(type-of-c-reserved-word "interface") ;; retorna  class-or-struct-keyword
(type-of-c-reserved-word "+") ;; retorna operator
(type-of-c-reserved-word "try") ;; retorna exception-handling-keyword
(type-of-c-reserved-word "Obsolete") ;; retorna attribute
(type-of-c-reserved-word "using") ;; retorna miscellaneous-keyword
(type-of-c-reserved-word "False Test") ;; retorna #f
