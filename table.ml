open Tyxml_js.Html5

type border =
  Borderless | Bordered | Striped | Highlight | Centered | Responsive

let border_to_string = function
  | Borderless -> ""
  | Bordered -> "bordered"
  | Striped -> "striped"
  | Highlight -> "highlight"
  | Centered -> "centered"
  | Responsive -> "responsive-table"

let create_table ?caption ?columns ?thead ?tfoot ?(border=[Borderless]) ?data () =
  let table =
    table ?caption ?columns ?thead ?tfoot @@ Materialize.get_data data in
  List.iter (Js_utils.Manip.addClass table) (List.map border_to_string border) ;
  table

let create_thead ?data () = thead @@ Materialize.get_data data

let create_th ?data () = th @@ Materialize.get_data data

let create_tbody ?data () = tbody @@ Materialize.get_data data

let create_tr ?data () = tr @@ Materialize.get_data data

let create_td ?data () = td @@ Materialize.get_data data

let add_row div tr =
  Js_utils.Manip.appendChild div tr

let add_column tr td =
  Js_utils.Manip.appendChild tr td
