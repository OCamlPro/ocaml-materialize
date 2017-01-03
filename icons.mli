open Tyxml_js.Html5

type size =
  | Tiny
  | Small
  | Medium
  | Large
  | Default

type position = Left | Right | None

val size_to_str : size -> string
val position_to_str : position -> string

val create_icon :
  ?size:size ->
  ?position:position ->
  string ->
  [> Html_types.i ] elt
