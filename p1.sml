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

fun parse fileName = 
    let
        val curWord = []
        val file = TextIO.openIn fileName
        val content = TextIO.inputAll file
        val _ = TextIO.closeIn file

        fun parseFile filename = 
            let
                val inFile = TextIO.openIn filename
                fun readAllLines (stream, acc) =
                    case TextIO.inputLine stream of
                        NONE => acc
                    | SOME line => readAllLines (stream, line :: acc)
                val lines = readAllLines (inFile, [])
                val _ = TextIO.closeIn inFile
                val allText = String.concat (List.rev lines)
            in
                String.translate (fn c => if Char.isSpace c then "" else str c) allText
            end;

        fun explodeList l = explode l;
        
    in
        explode (parseFile fileName)
    end;

parse "test1.txt";