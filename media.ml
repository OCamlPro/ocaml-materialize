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
