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

let button_to_str = function
  | Large -> "btn-large"
  | Normal -> "btn"
  | Flat -> "btn-flat"

let effect_to_str = function
  | No_effect -> ""
  | Waves -> "waves-effect"
  | Teal -> "waves-effect waves-teal"
  | Light -> "waves-effect waves-light"

let direction_to_str = function
  | Horizontal -> "horizontal"
  | Vertical -> "vertical"

let create_button
    ?(ty=Normal) ?(effects=[Light]) ?id ?(_class=[]) ?onclick ~url ~data () =
  let ty = button_to_str ty in
  let cl = String.concat " " (List.map effect_to_str effects) in
  let attrs =
    match id with
    | None -> [a_href url; a_class ([ cl; ty ] @ _class) ]
    | Some id -> [a_id id; a_href url; a_class ([ cl; ty ] @ _class) ] in
  let attrs =
    match onclick with
    | None -> attrs
    | Some action -> a_onclick action :: attrs in
    a ~a:attrs data

let create_action ?data ?color () =
  let action =
    li ~a:[ a_class [ "btn-floating" ] ] (Base.get_data data) in
  begin match color with
  | None -> ()
  | Some color -> Color.background_color action color
  end ;
  action

let create_float_button
      ?(ty=Normal) ?(direction=Vertical) ?color ~data actions =
  let ty = button_to_str ty in
  let direction = direction_to_str direction in
  let btn =
    a ~a:[ a_class [ "btn-floating" ; ty ] ] data in
  begin match color with
  | None -> ()
  | Some color -> Color.background_color btn color
  end ;
  div ~a:[ a_class [ "fixed-action-btn" ; direction ] ] [ btn; ul actions ]
