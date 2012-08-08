module ebnf::lang::Implode

import ebnf::lang::AST;
import ParseTree;

public EBNF implodeGrammar(Tree t) = implode(#EBNF, t);
