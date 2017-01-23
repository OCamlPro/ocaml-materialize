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

let create_card title content actions =
  let title = span ~a:[ a_class [ "card-title" ]] title in
  div ~a:[ a_class [ "card" ]] [
    div ~a:[ a_class [ "card-content" ]] [ title; content ] ;
    div ~a:[ a_class [ "card-action" ]] actions
  ]

let create_collection collections =
  List.iter (fun el -> Js_utils.Manip.addClass el "collection-item" ) collections ;
  div ~a:[ a_class [ "collection" ]] collections
