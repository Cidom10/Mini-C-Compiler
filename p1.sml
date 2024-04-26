(*
Calvin Idom, Trisha Carter
cli025@email.latech.edu, tlc051@email.latech.edu
Started 04/15/2024, Due April 16???
CSC 330-001
Spring 2024
Project 1: SML Mini C-Parser
*)

(* 
This current implementation only works on completely spaced-out file.
Ex: "int main ( ) { return 42; }"
We need it to work on stuff like "int main(){return 42;}" too.
*)

datatype token = INT | MAI | RET | OP | CP | OB | CB | SC | IN of int;

(* Helper function to check and convert string to INT token if applicable *)
fun is_int str = 
    case Int.fromString str of
        NONE => NONE
        | SOME num => SOME (IN num);

(* Function to classify words into tokens *)
fun classify word = 
    case word of
       "int"     => SOME INT
     | "main"    => SOME MAI
     | "return"  => SOME RET
     | "("       => SOME OP
     | ")"       => SOME CP
     | "{"       => SOME OB
     | "}"       => SOME CB
     | ";"       => SOME SC
     | _         => is_int word;

(* Function to split the input string into words *)
fun split_words str = List.filter (fn x => x <> "") (String.tokens (fn x => x = #" ") str);

(* Recursive function to parse words into a token list *)
fun parse_tokens [] = []
  | parse_tokens (w::ws) = 
      case classify w of
          SOME token => token :: parse_tokens ws
        | NONE => [];

(* Main function to read file and parse it *)
fun parse filename =
    let
        val file = TextIO.openIn filename
        val content = TextIO.inputAll file
        val _ = TextIO.closeIn file
    in
        (parse_tokens (split_words content))
    end;

(* Usage Example: *)
val result = parse "test1.txt";
val result = parse "blank.txt";