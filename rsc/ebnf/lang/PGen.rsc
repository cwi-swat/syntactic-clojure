module ebnf::lang::PGen

import ebnf::lang::EBNF;
import lang::rascal::grammar::ParserGenerator;
import ParseTree;
import Grammar;
import IO;


public void generateEBNFParser() {
  name = "EBNFParser";
  src = generateObjectParser("lang.synclj.meta", name , grammar({sort("EBNF")}, (#EBNF).definitions));
  writeFile(|project://clojure/jvm/ebnf/lang/<name>.java|, src);
}

