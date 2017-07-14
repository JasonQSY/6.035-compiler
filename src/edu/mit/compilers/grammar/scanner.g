header {
package edu.mit.compilers.grammar;
}

options
{
  mangleLiteralPrefix = "TK_";
  language = "Java";
}

{@SuppressWarnings("unchecked")}
class DecafScanner extends Lexer;
options
{
  k = 2;
}

tokens
{
  // Decaf reversed keywords
  "boolean";
  "break";
  "callout";
  "continue";
  "else";
  "false";
  "for";
  "while";
  "if";
  "int";
  "return";
  "true";
  "void";
}

// Selectively turns on debug tracing mode.
// You can insert arbitrary Java code into your parser/lexer this way.
{
  /** Whether to display debug information. */
  private boolean trace = false;

  public void setTrace(boolean shouldTrace) {
    trace = shouldTrace;
  }
  @Override
  public void traceIn(String rname) throws CharStreamException {
    if (trace) {
      super.traceIn(rname);
    }
  }
  @Override
  public void traceOut(String rname) throws CharStreamException {
    if (trace) {
      super.traceOut(rname);
    }
  }
}

// {}
LCURLY options { paraphrase = "{"; } : "{";
RCURLY options { paraphrase = "}"; } : "}";

// []
LSQUAR options { paraphrase = "["; } : "[";
RSQUAR options { paraphrase = "]"; } : "]";

// ()
LPAREN options { paraphrase = "("; } : "(";
RPAREN options { paraphrase = ")"; } : ")";

SEMICOLON options { paraphrase = ";"; } : ";";

ID options { paraphrase = "an identifier"; } :
  ('a'..'z' | 'A'..'Z')+;

INTLITERAL options { paraphrase = "an integer"; } : DIGIT (DIGIT)*;

// char is any printable ASCII characters excluding ", ', \", \'
CHARLITERAL : '\'' (ESC|~('\''|'\"'|'\\'|'\n'|'\t')) '\'';

// Note that here, the {} syntax allows you to literally command the lexer
// to skip mark this token as skipped, or to advance to the next line
// by directly adding Java commands.
WS_ : (' ' | '\n' {newline();}) {_ttype = Token.SKIP; };
SL_COMMENT : "//" (~'\n')* '\n' {_ttype = Token.SKIP; newline (); };

CHAR : '\'' (ESC|~'\'') '\'';
STRING : '"' (ESC|~'"')* '"';

protected
ESC :  '\\' ('n'|'"');

protected
DIGIT : ('0'..'9');
