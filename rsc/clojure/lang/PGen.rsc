module clojure::lang::util::PGen

import clojure::lang::Clojure;
import lang::rascal::grammar::ParserGenerator;
import ParseTree;
import Grammar;
import IO;

public void generateClojureParser() {
  name = "ClojureParser";
  src = generateObjectParser("lang.clojure.syntax", name , grammar({sort("File")}, (#File).definitions));
  writeFile(|project://clojure/src/lang/clojure/<name>.java|, src);
}

