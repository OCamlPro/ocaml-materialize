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
