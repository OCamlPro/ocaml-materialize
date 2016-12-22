open Tyxml_js.Html5

type size = Small of int | Medium of int | Large of int
type offset = Offset of size
type order = Push of size | Pull of size

val create_container :
  ?id:string ->
  ?data:[< Html_types.div_content_fun ] elt list ->
  unit ->
  [> Html_types.div ] elt

val create_row :
  ?id:string ->
  ?data:[< Html_types.div_content_fun ] elt list ->
  unit ->
  [> Html_types.div ] elt

val create_column :
  ?id:string ->
  ?offsets:offset list ->
  ?orders:order list ->
  sizes:size list ->
  ?data:[< Html_types.div_content_fun ] elt list ->
  unit ->
  [> Html_types.div ] elt

val add_column : 'a elt -> 'a elt -> unit
