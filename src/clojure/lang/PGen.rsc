module clojure::lang::PGen

import clojure::lang::Clojure;
import lang::rascal::grammar::ParserGenerator;
import ParseTree;
import Grammar;
import IO;

public void generateClojureParser() {
  name = "ClojureParser";
  src = generateObjectParser("clojure.lang", name , grammar({sort("File")}, (#File).definitions));
  writeFile(|project://syntactic-clojure/src/jvm/clojure/lang/<name>.java|, src);
}

