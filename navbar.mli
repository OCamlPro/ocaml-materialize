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

val direction_to_string : direction -> string

type nav_config = {
  menu_width : int ;
  edge : direction ;
  close_on_click : bool ;
  draggable : bool ;
}

val default_config : unit -> unit
val configure : nav_config -> unit

val create_item :
  ?id:string ->
  ?_class:string list ->
  ?onclick:Xml.mouse_event_handler ->
  url:uri ->
  title:Html_types.a_content_fun elt list ->
  unit ->
  [> Html_types.li ] elt

val create_dropdown : id:string -> [< Html_types.ul_content_fun ] elt list -> string * [> Html_types.ul ] elt

val create_navbar :
  title:[< Html_types.h1_content_fun ] elt list ->
  logo_url:uri ->
  logo:Html_types.a_content_fun elt list ->
  logo_txt:[< Html_types.span_content_fun ] elt list ->
  ?id:string ->
  ?dropdown:string * [< Html_types.div_content_fun > `A `H1 `Ul ] elt ->
  ?contextual_menu:'a ->
  ?menu_direction:direction ->
  menu:(unit -> Html_types.ul_content_fun elt list) ->
  unit ->
  [> Html_types.nav ] elt
