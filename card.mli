open Tyxml_js.Html5

val create_card :
  [< Html_types.span_content_fun ] elt list ->
  [< Html_types.div_content_fun > `Span ] elt ->
  [> Html_types.div ] elt

val create_collection :
  [< Html_types.div_content_fun ] elt list ->
  [> Html_types.div ] elt

(*
let create_card title content =
  let title = span ~a:[ a_class [ "card-title" ]] title in
  div ~a:[ a_class [ "card" ]] [
        div ~a:[ a_class [ "card-content" ]] [ title; content ]
      ]

let create_collection collections =
  List.iter (fun el -> Js_utils.Manip.addClass el "collection-item" ) collections ;
  div ~a:[ a_class [ "collection" ]] collections
*)
