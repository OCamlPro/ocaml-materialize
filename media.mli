open Tyxml_js.Html5

type 'a t =
  | Img of string * string                  (* src * alt *)
  | Video of string * string * 'a elt       (* src * type * data *)
  | Embedded of int * int * string * 'a elt (* width * heigth * src * data*)

val create : ([< `PCDATA ] as 'a) t ->  [> `Div | `Img | `Video of 'a ] elt
