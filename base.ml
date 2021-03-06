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

(** Some globals  *)
let doc : Dom_html.document Js.t = Dom_html.document
let window : Dom_html.window Js.t = Dom_html.window
let twindow : [`Head] elt = Window.head window

(** URLs *)
let jquery =
  "https://code.jquery.com/jquery-2.1.1.min.js"
let css =
  "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/css/materialize.min.css"
let js =
  "https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.8/js/materialize.min.js"

(** Helpers  *)
let _s = Js.string

let link_css ~href =
  link ~href ~rel:[`Stylesheet] ()

let link_script ~src ~data =
  script ~a:[a_src src; a_mime_type "text/javascript"] data

let link_meta ~name ~contents =
  let contents =
    let formatted_contents =
      List.map (fun (k,v) -> Printf.sprintf "%s=%s" k v) contents in
    String.concat "," formatted_contents in
  meta ~a:[a_name name; a_content contents] ()

let add_class elt cl = Manip.addClass elt cl

let load_materialize ?(css=css) ?(js=js) ?(jquery=jquery) () =
  let empty = pcdata "" in
  let css = link_css ~href:css in
  let jquery = link_script ~src:jquery ~data:empty in
  let js = link_script ~src:js ~data:empty in
  let meta =
    link_meta
      ~name:"viewport"
      ~contents:[ ("width", "device-width"); ("initial-scale", "1.0") ] in

  Manip.appendChild twindow jquery ;
  Manip.appendChild twindow js ;
  Manip.appendChild twindow css ;
  Manip.appendChild twindow meta


(** Utils *)
let get_data = function None -> [] | Some data -> [ data ]
