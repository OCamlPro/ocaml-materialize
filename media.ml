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

type 'a t =
  | Img of string * string                  (* src * alt *)
  | Video of string * string * 'a elt       (* src * type * data *)
  | Embedded of int * int * string * 'a elt (* width * heigth * src * data*)

let create = function
  | Img (src, alt) ->
     img ~a:[ a_class [ "responsive-img" ] ] ~src ~alt ()
  | Video (src, ty, data) ->
     video
       ~a:[ a_class [ "responsive-video" ]; a_controls () ]
       ~src
       ~srcs:([source ~a:[a_src src; a_mime_type ty] ()]) [data]
  | Embedded (width, heigth, src, data) ->
     div ~a:[ a_class [ "video-container" ] ] [
           iframe ~a:[
                    a_width width ;
                    a_height heigth ;
                    a_src src ]
                  [ data ]
         ]
