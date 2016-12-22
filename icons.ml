open Tyxml_js.Html5

type size =
  | Tiny
  | Small
  | Medium
  | Large
  | Default

type position = Left | Right | None

let size_to_str = function
  | Tiny -> "tiny"
  | Small -> "small"
  | Medium -> "medium"
  | Default -> ""
  | Large -> "large"

let position_to_str = function Left -> "left" | Right -> "right" | None -> ""

let create_icon ?(size=Default) ?(position=None) name =
  let size = size_to_str size in
  let position = position_to_str position in
  i ~a:[ a_class [ size ; "material-icons" ; position ] ] [ pcdata name ]
