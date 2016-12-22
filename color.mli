open Tyxml_js.Html5

type color =
  | Red
  | Pink
  | Purple
  | DeepPurple
  | Indigo
  | Blue
  | LightBlue
  | Cyan
  | Teal
  | Green
  | LightGreen
  | Lime
  | Yellow
  | Amber
  | Orange
  | DeepOrange
  | Brown
  | Grey
  | BlueGrey
  | Black
  | White
  | Transparent

type shade =
  | Lighten of int
  | Darken of int
  | Accent of int
  | None

type t = { color : color ; shade : shade }

val background_color : 'a elt -> t -> unit
val text_color : 'a elt -> t -> unit
