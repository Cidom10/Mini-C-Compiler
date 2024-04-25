(*
Calvin Idom, Trisha Carter
cli025@email.latech.edu, tlc051@email.latech.edu
Started 04/15/2024, Due April 16???
CSC 330-001
Spring 2024
Project 1: SML Mini C-Parser
*)

(* 
ML Libraries we are allowed to use:
Functions pre-loaded into the SMLNJ environment on startup (mostly covered by the list below).
TextIO
Int
Char
String
Option
List
*)

datatype token = INT | MAI | RET | OP | CP | OB | CB | SC | IN of int;

(* Main parse function, string -> token list *)
fun parse (inFile) = 
    let
        val instream = TextIO.openIn inFile
        val file = TextIO.inputAll instream
        val _ = TextIO.closeIn instream
        val tokens = String.tokens (fn c => c = #" " orelse c = #"\n") file
        val tokenList = List.map (fn x => 
            case x of
                "int" => INT
                | "main" => MAI
                | "return" => RET
                | "(" => OP
                | ")" => CP
                | "{" => OB
                | "}" => CB
                | ";" => SC
                | _ => (case Int.fromString x of
                    NONE => ""   (* Handle the error case or define ERROR *)
                    SOME i => IN i)   (* Use the integer with the IN constructor *)
        ) tokens
    in
        tokenList
    end;

(* Test cases *)
parse("test1.txt")