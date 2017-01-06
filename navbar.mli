open Tyxml_js.Html5

type direction = Left | Right | Center

val direction_to_string : direction -> string

type nav_config = {
  menu_width : int ;
  edge : direction ;
  close_on_click : bool ;
  draggable : bool ;
}

val default_config : unit -> unit
val configure : nav_config -> unit

val create_item :
  ?id:string ->
  ?_class:string list ->
  url:uri ->
  title:Html_types.a_content_fun elt list ->
  unit ->
  [> Html_types.li ] elt

val create_dropdown : id:string -> [< Html_types.ul_content_fun ] elt list -> string * [> Html_types.ul ] elt

val create_navbar :
  title:[< Html_types.h1_content_fun ] elt list ->
  logo_url:uri ->
  logo:Html_types.a_content_fun elt list ->
  ?id:string ->
  ?dropdown:string * [< Html_types.div_content_fun > `A `H1 `Ul ] elt ->
  ?contextual_menu:'a ->
  ?menu_direction:direction ->
  menu:Html_types.ul_content_fun elt list ->
  unit ->
  [> Html_types.nav ] elt
