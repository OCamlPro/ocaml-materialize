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

type button = Large | Normal | Flat
type effect = No_effect | Waves | Teal | Light
type direction = Horizontal | Vertical

val button_to_str : button -> string
val effect_to_str : effect -> string
val direction_to_str : direction -> string

val create_button :
  ?ty:button ->
  ?effects:effect list ->
  ?id: string ->
  ?_class:string list ->
  ?onclick:Xml.mouse_event_handler ->
  url:uri ->
  data:'a elt list ->
  unit ->
  [> 'a Html_types.a ] elt

val create_action :
  ?data:[< Html_types.li_content_fun ] elt ->
  ?color:Color.t ->
  unit ->
  [> Html_types.li ] elt

val create_float_button :
  ?ty:button ->
  ?direction:direction ->
  ?color:Color.t ->
  data:Html_types.a_content_fun elt list ->
  [< Html_types.ul_content_fun ] elt list ->
  [> Html_types.div ] elt
