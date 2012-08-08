module ebnf::lang::PGen

import ebnf::lang::EBNF;
import lang::rascal::grammar::ParserGenerator;
import ParseTree;
import Grammar;
import IO;


public void generateEBNFParser() {
  name = "EBNFParser";
  src = generateObjectParser("ebnf.lang", name , grammar({sort("EBNF")}, (#EBNF).definitions));
  writeFile(|project://syntactic-clojure/src/jvm/ebnf/lang/<name>.java|, src);
}

