open Tyxml_js.Html5

val add_class : 'a elt -> string -> unit

val load_materialize :
  ?css:string ->
  ?js:string ->
  ?jquery:string ->
  unit ->
  unit

val get_data : 'a elt option -> 'a elt list

