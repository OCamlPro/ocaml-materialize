open Tyxml_js.Html5

(*
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
*)

type direction = Left | Right | Center

val direction_to_string : direction -> string

val create_item : ?id:string -> url:uri -> title:Html_types.a_content_fun elt list -> unit ->[> Html_types.li ] elt

(*
?id:Html_types.text Tyxml_js.Html5.wrap ->
url:Tyxml_js.Html5.Xml.uri Tyxml_js.Html5.wrap ->
title:Html_types.flow5_without_interactive Tyxml_js.Html5.elt Tyxml_js.Html5.list_wrap ->
unit -> [> Html_types.li ] Tyxml_js.Html5.elt
*)

val create_dropdown : id:string -> [< Html_types.ul_content_fun ] elt list -> string * [> Html_types.ul ] elt

val create_navbar :
  title:[< Html_types.h1_content_fun ] elt list ->
  logo_url:uri ->
  logo:Html_types.a_content_fun elt list ->
  ?dropdown:string * [< Html_types.div_content_fun > `A `H1 `Ul ] elt ->
  ?contextual_menu:'a ->
  (* ?contextual_menu:Html_types.ul_content_fun elt list -> *)
  ?menu_direction:direction ->
  menu:Html_types.ul_content_fun elt list ->
  unit ->
  [> Html_types.nav ] elt

(*
title:[< Html_types.h1_content_fun ] Tyxml_js.Html5.elt Tyxml_js.Html5.list_wrap ->
logo_url:Tyxml_js.Html5.Xml.uri Tyxml_js.Html5.wrap ->
logo:Html_types.flow5_without_interactive Tyxml_js.Html5.elt Tyxml_js.Html5.list_wrap ->
?dropdown:string * [< Html_types.div_content_fun > `A `H1 `Ul ] Tyxml_js.Html5.elt ->
?contextual_menu:'a ->
?menu_direction:direction ->
menu:Html_types.ul_content_fun Tyxml_js.Html5.elt Tyxml_js.Html5.list_wrap ->
unit -> [> Html_types.nav ] Tyxml_js.Html5.elt
*)

(*
let create_item ?id ~url ~title () =
  match id with
  | None -> li [ a ~a:[ a_href url ] title ]
  | Some id -> li [a ~a:[ a_id id; a_href url ] title ]

let create_dropdown ~id menu =
  id, ul ~a:[ a_id id; a_class [ "dropdown-content" ]] menu

let create_navbar
      ~title
      ~logo_url
      ~logo
      ?dropdown
      ?contextual_menu
      ?(menu_direction=Right)
      ~menu () =
  let dropdown =
    match dropdown with
    | None -> []
    | Some (id, drops) ->
       let a_big =
         Button.(create_button
                   ~url:"#help-modal"
                   ~ty:Flat
                   ~effects:[ Light ]
                   ~data:[ pcdata "Help" ] ()) in
       Color.(text_color a_big {color=Amber; shade = Darken 2}) ;
       let a_small =
         a ~a:[ a_href "#!"; a_class [ "dropdown-button" ]]
           [ Icons.create_icon "more_vert" ] in
       let dropdown =
         drops :: [
           ul ~a:[a_class ["right hide-on-med-and-down"]] [li [ a_big ]] ;
           ul ~a:[a_class ["right hide-on-large-only"]] [li [ a_small ]] ;
         ] in
       Js_utils.Manip.setAttribute a_small "data-activates" id ;
       dropdown  in
  let menu_direction = direction_to_string menu_direction in
  let data_activates = "side-nav" in
  let logo =
    a ~a:[ a_href logo_url ; a_class [ "brand-logo"; "hide-on-med-and-down" ]] logo in
  let title =
    h1 ~a:[ a_class [ "nav__page-title" ] ] title in
  let menu_icon =
    a ~a:[ a_href "#" ; a_class [ "button-collapse" ] ]
      [ Icons.create_icon "menu" ] in
  Js_utils.Manip.setAttribute menu_icon "data-activates" data_activates ;
  let desktop_menu =
    ul ~a:[ a_class [ menu_direction ; "hide-on-med-and-down" ] ] menu in
  let mobile_logo =
    li
      [ div ~a:[ a_class [ "userView" ] ] [
              img ~src:"../img/logo-white.png" ~alt:"Tezos" () ;
              span ~a:[ a_class [ "white-text name" ] ] [ pcdata "Tezos" ]
            ] ] in
  let mobile_menu =
    ul
      ~a:[ a_id data_activates; a_class [ "side-nav" ] ]
      (mobile_logo :: (List.map (Js_utils.Manip.clone ~deep:true) menu)) in
  nav [
      div ~a:[ a_class [ "nav-wrapper" ] ]
          (dropdown @ [
              logo ;
              title ;
              menu_icon ;      (* mobile view only *)
              desktop_menu ;
              mobile_menu ;
            ]) ]
*)
