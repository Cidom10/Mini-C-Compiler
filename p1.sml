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

(* Helper function to return contents from the file *)
fun readFile(filename) = 
    let
        val instream = TextIO.openIn filename
        val content = TextIO.inputAll instream
    in
        TextIO.closeIn instream;
        content
    end;



(* Test parse function *)
val tokens = parse "test1.txt";

(* Current non-working implementation
        List.map (fn x => 
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
                    NONE => raise Fail ("Unrecognized token: " ^ x)
                    | SOME i => IN i)
        ) tokens
*)