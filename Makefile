
IMPLS := \
  js_utils.ml \
  base.ml \
  color.ml \
  button.ml \
  icons.ml \
  shadow.ml \
  card.ml \
  media.ml \
  table.ml \
  grid.ml \
  navbar.ml \
  materialize.ml

INTFS := \
  js_utils.mli \
  base.mli \
  color.mli \
  button.mli \
  icons.mli \
  shadow.mli \
  card.mli \
  media.mli \
  table.mli \
  grid.mli \
  navbar.mli \
  materialize.mli

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
        $(INTFS) $(IMPLS) -a -o $(LIB).cma

install: $(LIB).cma
	ocamlfind install $(LIB) META $(LIB).cma $(LIB).cmi

uninstall:
	ocamlfind remove $(LIB)

clean :
	rm -rf *.byte *.cmo *.cmi *.cma *.js
