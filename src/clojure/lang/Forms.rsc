module clojure::lang::Forms

extend clojure::lang::Layout;
extend clojure::lang::Tokens;

syntax Form
  = @category="String" string: String
  | @category="RegExp" regexp: RegExp
  | @category="Char" char: Char
  | @category="Number" number: Number
  | @category="Symbol" symbol: Symbol
  | arg: Arg
  | meta: ("#^"|"^") Form meta Form arg
  | \list: "(" Form* ")" 
  | vector: "[" Form* "]"
  | \map: "{" Form* "}"
  | \set: "#{" Form* "}"
  | fn: "#(" Form* ")"
  | var: "#\'" Form 
  | deref: "@" Form
  | unquote: "~" !>> [@] Form arg
  | unquotes: "~@" Form arg
  | quote: "\'" Form arg
  | qquote: "`" Form arg
  | discard: "#_" Form
  //| "#=" Eval
  //| "#!" Comment
  //| "#\<" Unreadable
  ;
  
lexical Arg
  = [%] !>> [&1-9]
  | [%] [1-9][0-9]* !>> [0-9]
  | [%][&]
  ;
