open Tyxml_js.Html5

type button = Large | Normal | Flat
type effect = No_effect | Waves | Teal | Light
type direction = Horizontal | Vertical

let button_to_str = function
  | Large -> "btn-large"
  | Normal -> "btn"
  | Flat -> "btn-flat"

let effect_to_str = function
  | No_effect -> ""
  | Waves -> "waves-effect"
  | Teal -> "waves-effect waves-teal"
  | Light -> "waves-effect waves-light"

let direction_to_str = function
  | Horizontal -> "horizontal"
  | Vertical -> "vertical"

let create_button ?(ty=Normal) ?(effects=[Light]) ~url ~data () =
  let ty = button_to_str ty in
  let cl = String.concat " " (List.map effect_to_str effects) in
  a ~a:[a_href url; a_class [ cl; ty ]] data

let create_action ?data ?color () =
  let action =
    li ~a:[ a_class [ "btn-floating" ] ] (Materialize.get_data data) in
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
