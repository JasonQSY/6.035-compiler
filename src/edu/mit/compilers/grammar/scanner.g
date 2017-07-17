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

// We need define some notations
// otherwise they will be errors (unexpected char)

LCURLY : "{";
RCURLY : "}";
LSQUAR : "[";
RSQUAR : "]";
LPAREN : "(";
RPAREN : ")";
SEMICOLON : ";";
MINUS : "-";
PLUS : "+";
ASSIGN : "=";
TIMES : "*";
GREATER : ">";
LESS : "<";
GE : ">=";
LE : "<=";
EQ : "==";
NEQ : "!=";
AND : "&&";
OR : "||";
COMMA : ",";

// integers

protected DIGIT : ('0'..'9');
protected LOWERCASE : ('a'..'z');
protected UPPERCASE : ('A'..'Z');
protected HEXDIGIT : DIGIT | ('a'..'f') | ('A'..'F');

protected DEC : (DIGIT)+;
protected HEX : "0x" (HEXDIGIT)+;

INTLITERAL : DEC | HEX;

// char

protected ESC : '\\' ('n'|'t'|'\"'|'\''|'\\');
protected CHAR : (' '|'!'|('#'..'&')|('('..'[')|(']'..'~')|ESC);
CHARLITERAL : "'" CHAR "'";

// string

STRINGLITERAL : '\"' (CHAR)* '\"';

// identifiers

protected ALPHA : LOWERCASE | UPPERCASE | '_';
ID options { paraphrase = "an identifier"; } : ALPHA (ALPHA|DIGIT)*;

// while space
WS_ : (' ' | '\t' | '\n' {newline();}) {_ttype = Token.SKIP; };

// single line comment
SL_COMMENT : "//" (~'\n')* '\n' {_ttype = Token.SKIP; newline (); };

QUESTION : "?";
SLASH : "/";
PERCENT : "%";
PLUSASSIGN : "+=";
MINUSASSIGN : "-=";
AT : "@";
EXCLAM : "!";
COLON : ":";
