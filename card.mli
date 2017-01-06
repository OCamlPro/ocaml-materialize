open Tyxml_js.Html5

val create_card :
  [< Html_types.span_content_fun ] elt list ->
  [< Html_types.div_content_fun > `Span ] elt ->
  [< Html_types.div_content_fun ] elt list ->
  [> Html_types.div ] elt

val create_collection :
  [< Html_types.div_content_fun ] elt list ->
  [> Html_types.div ] elt
