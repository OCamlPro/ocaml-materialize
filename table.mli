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

type border =
    Borderless | Bordered | Striped | Highlight | Centered | Responsive

val create_table :
  ?caption:[< Html_types.caption ] elt ->
  ?columns:[< Html_types.colgroup ] elt list ->
  ?thead:[< Html_types.thead ] elt ->
  ?tfoot:[< Html_types.tfoot ] elt ->
  ?border:border list ->
  ?data:[< Html_types.table_content_fun ] elt ->
  unit ->
  [> Html_types.table ] elt

val create_thead :
  ?data:[< Html_types.thead_content_fun ] elt ->
  unit ->
  [> Html_types.thead ] elt

val create_th :
  ?data:[< Html_types.th_content_fun ] elt ->
  unit ->
  [> Html_types.th ] elt

val create_tbody :
  ?data:[< Html_types.tbody_content_fun ] elt ->
  unit ->
  [> Html_types.tbody ] elt

val create_tr :
  ?data:[< Html_types.tr_content_fun ] elt ->
  unit ->
  [> Html_types.tr ] elt

val create_td :
  ?data:[< Html_types.td_content_fun ] elt ->
  unit ->
  [> Html_types.td ] elt

val add_row : 'a elt -> [> Html_types.tr ] elt -> unit

val add_column : [> Html_types.tr ] elt -> [> Html_types.td ] elt -> unit
