inicio
  = regla+

regla
  = (identificador _ "=" _ expresion  finc _)


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
  / "[" inicio:init "-" fin:fin"]" cerradura  {
      // Validar que el inicio sea menor o igual que el fin
      if (inicio.charCodeAt(0) > fin.charCodeAt(0)) {
        throw new SyntaxError(`El rango [${inicio}-${fin}] no es válido: debe ir de menor a mayor.`);
      }
      return `[${inicio}-${fin}]`;
    }

  / "["   ([a-zA-Z0-9\_\\\-]+) "]" cerradura


init = caracter

fin = caracter
caracter = [a-zA-Z0-9]

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