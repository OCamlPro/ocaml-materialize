open Tyxml_js.Html5

let create_card title content actions =
  let title = span ~a:[ a_class [ "card-title" ]] title in
  div ~a:[ a_class [ "card" ]] [
    div ~a:[ a_class [ "card-content" ]] [ title; content ] ;
    div ~a:[ a_class [ "card-action" ]] actions
  ]

let create_collection collections =
  List.iter (fun el -> Js_utils.Manip.addClass el "collection-item" ) collections ;
  div ~a:[ a_class [ "collection" ]] collections
