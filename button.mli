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

(*
let create_button ?(ty=Normal) ?(effects=[Light]) ~url ~data () =
  let ty = button_to_str ty in
  let cl = String.concat " " (List.map effect_to_str effects) in
  a ~a:[a_href url; a_class [ cl; ty ]] data

let create_action ?data ?color () =
  let action =
    li ~a:[ a_class [ "btn-floating" ] ] (Base.get_data data) in
  begin match color with
  | None -> ()
  | Some color -> Color.background_color action color
  end ;
  action

let create_float_button
      ?(ty=Normal) ?(direction=Vertical) ?color ~data actions =
  let ty = button_to_str ty in
  let direction = direction_to_str direction in
  let btn =
    a ~a:[ a_class [ "btn-floating" ; ty ] ] data in
  begin match color with
  | None -> ()
  | Some color -> Color.background_color btn color
  end ;
  div ~a:[ a_class [ "fixed-action-btn" ; direction ] ] [ btn; ul actions ]
*)
