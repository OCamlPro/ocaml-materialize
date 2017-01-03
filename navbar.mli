open Tyxml_js.Html5

type direction = Left | Right | Center

val direction_to_string : direction -> string

val create_item : ?id:string -> url:uri -> title:Html_types.a_content_fun elt list -> unit ->[> Html_types.li ] elt

val create_dropdown : id:string -> [< Html_types.ul_content_fun ] elt list -> string * [> Html_types.ul ] elt

val create_navbar :
  title:[< Html_types.h1_content_fun ] elt list ->
  logo_url:uri ->
  logo:Html_types.a_content_fun elt list ->
  ?dropdown:string * [< Html_types.div_content_fun > `A `H1 `Ul ] elt ->
  ?contextual_menu:'a ->
  ?menu_direction:direction ->
  menu:Html_types.ul_content_fun elt list ->
  unit ->
  [> Html_types.nav ] elt
