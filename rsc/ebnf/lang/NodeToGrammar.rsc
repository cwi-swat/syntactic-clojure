module ebnf::lang::NodeToGrammar

import ebnf::lang::NodeToAST;
import ebnf::lang::Lift;
import Grammar;
import IO;

public Grammar node2Grammar(str ns, str key, node n) = lift(node2EBNF(n), ns, key);

