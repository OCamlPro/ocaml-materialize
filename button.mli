open Tyxml_js.Html5

type button = Large | Normal | Flat
type effect = No_effect | Waves | Teal | Light
type direction = Horizontal | Vertical

val button_to_str : button -> string
val effect_to_str : effect -> string
val direction_to_str : direction -> string

val create_button :
  ?ty:button ->
  ?effects:effect list ->
  url:uri ->
  data:'a elt list ->
  unit ->
  [> 'a Html_types.a ] elt

val create_action :
  ?data:[< Html_types.li_content_fun ] elt ->
  ?color:Color.t ->
  unit ->
  [> Html_types.li ] elt

val create_float_button :
  ?ty:button ->
  ?direction:direction ->
  ?color:Color.t ->
  data:Html_types.a_content_fun elt list ->
  [< Html_types.ul_content_fun ] elt list ->
  [> Html_types.div ] elt
