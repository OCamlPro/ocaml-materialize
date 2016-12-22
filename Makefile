
IMPLS := \
  js_utils.ml \
  materialize.ml \
  color.ml \
  button.ml \
  icons.ml \
  shadow.ml \
  card.ml \
  media.ml \
  table.ml \
  grid.ml \
  navbar.ml

INTFS := \
  js_utils.mli \
  materialize.mli \
  color.mli \
  shadow.mli \
  media.mli \
  table.mli \
  grid.mli

LIB = materialize

PACKAGES= \
  -syntax camlp4o \
  -package js_of_ocaml \
  -package js_of_ocaml.weak \
  -package js_of_ocaml.syntax \
  -package js_of_ocaml.tyxml \
  -package tyxml

all: $(LIB).cma

$(LIB).cma: $(INTFS) $(IMPLS)
	ocamlfind ocamlc $(PACKAGES) \
        -linkpkg $(INTFS) $(IMPLS) -a -o $(LIB).cma

clean :
	rm -rf *.byte *.cmo *.cmi *.cma *.js
