(**************************************************************************)
(*                                                                        *)
(*                      TypeRex                                           *)
(*                                                                        *)
(*   Copyright OCamlPro 2011-2017. All rights reserved.                   *)
(*   This file is distributed under the terms of the LGPL v2.1 with       *)
(*   the special exception on linking described in the file LICENSE.      *)
(*      (GNU Lesser General Public Licence version 2.1)                   *)
(*                                                                        *)
(*     Contact: <typerex@ocamlpro.com> (http://www.ocamlpro.com/)         *)
(*                                                                        *)
(*  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,       *)
(*  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES       *)
(*  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND              *)
(*  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS   *)
(*  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN    *)
(*  ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN     *)
(*  CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE      *)
(*  SOFTWARE.                                                             *)
(**************************************************************************)

open Tyxml_js.Html5

type direction = Left | Right | Center

let direction_to_string = function
  | Left -> "left"
  | Right -> "right"
  | Center -> "center"

type nav_config = {
  menu_width : int ;
  edge : direction ;
  close_on_click : bool ;
  draggable : bool ;
}

class type configuration = object
  method menuWidth : int Js.prop
  method edge : Js.js_string Js.t Js.prop
  method closeOnClick : bool Js.t Js.prop
  method draggable : bool Js.t Js.prop
end

class type sideNav = object
  inherit [Dom.element] Dom.nodeList
  method sideNav : configuration Js.t -> unit Js.t Js.meth
end

let default_config () =
  let open Js in
  let jquery = Unsafe.variable "$" in
  let collapse =
    Unsafe.fun_call jquery [| Unsafe.inject @@ Js.string ".button-collapse"|] in
  collapse##sideNav (Unsafe.obj [||])

let configure configuration =
  let open Js in
  let jquery = Unsafe.variable "$" in
  let collapse =
    Unsafe.fun_call jquery [| Unsafe.inject @@ Js.string ".button-collapse"|] in
  let config : configuration Js.t = Unsafe.obj [||] in
  config##menuWidth <- configuration.menu_width ;
  config##edge <- Js.string (direction_to_string configuration.edge) ;
  config##closeOnClick <- Js.bool configuration.close_on_click ;
  config##draggable <- Js.bool configuration.draggable ;
  collapse##sideNav (config)

let create_item ?id ?_class ~url ~title () =
  match id, _class with
  | None, None -> li [ a ~a:[ a_href url ] title ]
  | None, Some _class -> li [ a ~a:[ a_class _class; a_href url ] title ]
  | Some id, None -> li [a ~a:[ a_id id; a_href url ] title ]
  | Some id, Some _class ->
    li [a ~a:[ a_id id; a_class _class; a_href url ] title ]

let create_dropdown ~id menu =
  id, ul ~a:[ a_id id; a_class [ "dropdown-content" ]] menu

let create_navbar
    ~title
    ~logo_url
    ~logo
    ?id
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
  let id =
    match id with
    | None -> "default-navbar"
    | Some id -> id in
  nav ~a:[ a_id id ] [
    div ~a:[ a_class [ "nav-wrapper" ] ]
      (dropdown @ [
          logo ;
          title ;
          menu_icon ;      (* mobile view only *)
          desktop_menu ;
          mobile_menu ;
        ]) ]
