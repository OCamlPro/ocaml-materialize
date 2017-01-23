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

let border_to_string = function
  | Borderless -> ""
  | Bordered -> "bordered"
  | Striped -> "striped"
  | Highlight -> "highlight"
  | Centered -> "centered"
  | Responsive -> "responsive-table"

let create_table ?caption ?columns ?thead ?tfoot ?(border=[Borderless]) ?data () =
  let table =
    table ?caption ?columns ?thead ?tfoot @@ Base.get_data data in
  List.iter (Js_utils.Manip.addClass table) (List.map border_to_string border) ;
  table

let create_thead ?data () = thead @@ Base.get_data data

let create_th ?data () = th @@ Base.get_data data

let create_tbody ?data () = tbody @@ Base.get_data data

let create_tr ?data () = tr @@ Base.get_data data

let create_td ?data () = td @@ Base.get_data data

let add_row div tr =
  Js_utils.Manip.appendChild div tr

let add_column tr td =
  Js_utils.Manip.appendChild tr td
