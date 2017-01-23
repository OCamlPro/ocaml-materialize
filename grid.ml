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
open Js_utils

(** Grid  *)
type size = Small of int | Medium of int | Large of int
type offset = Offset of size
type order = Push of size | Pull of size

let size_to_string = function
  | Small i -> Printf.sprintf "s%d" i
  | Medium i -> Printf.sprintf "m%d" i
  | Large i -> Printf.sprintf "l%d" i

let sizes_to_string list =
  String.concat " " (List.map size_to_string list)

let offset_to_string = function
    Offset sz -> Printf.sprintf "offset-%s" (size_to_string sz)

let order_to_string = function
  | Push sz -> Printf.sprintf "push-%s" (size_to_string sz)
  | Pull sz -> Printf.sprintf "pull-%s" (size_to_string sz)

let offsets_to_string list =
  String.concat " " (List.map offset_to_string list)

let orders_to_string list =
  String.concat " " (List.map order_to_string list)

let gen_id =
  let cpt = ref 0 in
  fun prefix ->
  incr cpt;
  Printf.sprintf "%s_%i" prefix !cpt

let create_container ?(id=gen_id "grid") ?(data=[]) () =
  div ~a:[a_id id; a_class ["container"]] data

let create_row ?(id=gen_id "row") ?(data=[]) () =
  div ~a:[a_id id; a_class ["row"]] data

let create_column
      ?(id=gen_id "col") ?offsets ?orders ~sizes ?(data=[]) () =
  let sizes = sizes_to_string sizes in
  let offsets = match offsets with
    | None -> ""
    | Some offsets -> offsets_to_string offsets in
  let orders = match orders with
    | None -> ""
    | Some orders -> orders_to_string orders in
  let class_col = Printf.sprintf "col %s %s %s" sizes offsets orders in
  div ~a:[a_id id; a_class [class_col]] data

let add_column row column =
  Manip.appendChild row column
