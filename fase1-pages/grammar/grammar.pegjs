grammar
  = rule+ nl

rule
  = nl identifier nl string? nl "=" _ choice nl (_";"_)?
  /_ nl comntoln _ nl
  / nl cmntmln nl
  
choice
  = concatenation (nl "/" nl concatenation)*

concatenation
  = pluck (_ pluck)*

pluck
  = "@"? _ label

label
  = (identifier _ ":")? _ expression

expression
  = "$"? _ parsingExpression _ quantifier?

quantifier
  = [?+*]
  / "|" _ (number / identifier) _ "|"
  / "|" _ (number / identifier)? _ ".." _ (number / identifier)? _ "|"
  / "|" _ (number / identifier)? _ "," _ choice _ "|"
  / "|" _ (number / identifier)? _ ".." _ (number / identifier)? _ "," _ choice _ "|"

parsingExpression
  = identifier
  / string "i"?
  / range "i"?
  / group
  / punto
  / endOfInput

group
  = "(" _ choice _ ")"

punto
  = .

endOfInput "fin de entrada de texto"
  = "!" "."

string
	= ["] [^"]* ["]
    / ['] [^']* [']
    
range = "[" input_range+ "]"

input_range = [^[\]-] "-" [^[\]-]
			/ [^[\]]+

identifier "identificador"
  = [_a-z]i[_a-z0-9]i*

_ "espacios en blanco"
  = [ \t]*

nl "nueva linea"
  = [ \t\n\r]*

number
  = [0-9]+
  
comntoln
	= "//"(!"\n" .)*
cmntmln   
	= "/*"(!"*/" .)*"*/"