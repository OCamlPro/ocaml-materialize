type t = Shadow of int

let shadow_to_string = function Shadow i -> Printf.sprintf "z-depth-%d" i

let shadow div shadow =
  let shadow = shadow_to_string shadow in
  Js_utils.Manip.addClass div shadow
