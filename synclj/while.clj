; asaksjdhas


(defmacro grammar 
  {:grammar :meta-grammar}
  [ast]
    (do 
      (print (str "AST = " ast))
      (list 'quote ast)))

(def while-grammar (grammar
   Prog = prog {Stat} 
   Stat = assign symbol "=" form
        | skip "skip"
        | if "if" form "then" {Stat} "else" {Stat} "fi"
        | while "while" form "do" {stat} "od" 
        | return "return" form))
        
(defmacro til
  {:grammar while-grammar}
  [ast]
  (do
   (print (str "WHILE: " ast))
   (list 'quote ast)))
  

(def mult (til))

