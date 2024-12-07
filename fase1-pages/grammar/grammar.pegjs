inicio
  = regla+

regla
  = (identificador _ "=" _ expresion finc _)

expresion
  = eleccion

finc
  = ";"
  / "\n"

eleccion
  = secuencia (_ "/" _ secuencia)*

secuencia
  = (primary _)*

primary
  = cadena
  / identificador cerradura
  / "(" _ expresion _ ")" cerradura
  / "[" ([a-zA-Z0-9\_\\\-]+) "]" cerradura

cerradura
  = "+"
  / "?"
  / "*"
  / ""

cadena
  = "\""([^"]*) "\""
  /  "\'"([^']*) "\'"

identificador
  = [a-zA-Z_] [a-zA-Z0-9_]*

_ "espacioEnBlanco"
  = [ \t\n\r]*