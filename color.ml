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

type color =
  | Red
  | Pink
  | Purple
  | DeepPurple
  | Indigo
  | Blue
  | LightBlue
  | Cyan
  | Teal
  | Green
  | LightGreen
  | Lime
  | Yellow
  | Amber
  | Orange
  | DeepOrange
  | Brown
  | Grey
  | BlueGrey
  | Black
  | White
  | Transparent

type shade =
  | Lighten of int
  | Darken of int
  | Accent of int
  | None

type t = { color : color ; shade : shade }

let color_to_string = function
  | Red -> "red"
  | Pink -> "pink"
  | Purple -> "purple"
  | DeepPurple -> "deep-purple"
  | Indigo -> "indigo"
  | Blue -> "blue"
  | LightBlue -> "light-blue"
  | Cyan -> "cyan"
  | Teal -> "teal"
  | Green -> "green"
  | LightGreen -> "light-green"
  | Lime -> "lime"
  | Yellow -> "yellow"
  | Amber -> "amber"
  | Orange -> "orange"
  | DeepOrange -> "deep-orange"
  | Brown -> "brown"
  | Grey -> "grey"
  | BlueGrey -> "blue-grey"
  | Black -> "black"
  | White -> "white"
  | Transparent -> "transparent"

let shade_to_string = function
  | Lighten i -> Printf.sprintf "lighten-%d" i
  | Darken i -> Printf.sprintf "darken-%d" i
  | Accent i -> Printf.sprintf "accent-%d" i
  | None ->  ""

let background_color div color =
  let col = color_to_string color.color in
  Js_utils.Manip.addClass div col ;
  match color.shade with
  | None -> ()
  | shade ->
      Js_utils.Manip.addClass div (shade_to_string shade)

let text_color div color =
  let col = color_to_string color.color ^ "-text"in
  Js_utils.Manip.addClass div col ;
  match color.shade with
  | None -> ()
  | shade ->
      let shade = "text-" ^ shade_to_string shade in
      Js_utils.Manip.addClass div shade
