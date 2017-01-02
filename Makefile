
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
  navbar.ml

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
  navbar.mli

OBJ_INTFS := ${INTFS:.mli=.cmi}
OBJ_IMPLS := ${IMPLS:.ml=.cmo}

LIB = materialize

PACKAGES= \
  -syntax camlp4o \
  -package js_of_ocaml \
  -package js_of_ocaml.weak \
  -package js_of_ocaml.syntax \
  -package js_of_ocaml.tyxml \
  -package tyxml

all: $(LIB).cma

%.cmi: %.mli
	ocamlfind ocamlc $(PACKAGES) -c $<

%.cmo: %.ml
	ocamlfind ocamlc $(PACKAGES) -c $<

$(LIB).cmo: $(OBJ_INTFS) $(OBJ_IMPLS)
	ocamlfind ocamlc $(PACKAGES) $(OBJ_IMPLS) -pack -o $@

$(LIB).cma: $(LIB).cmo
	ocamlfind ocamlc $(PACKAGES) $< -a -o $@

install: $(LIB).cma
	ocamlfind install $(LIB) META $(LIB).cma $(LIB).cmi

uninstall:
	ocamlfind remove $(LIB)

clean :
	rm -rf *.byte *.cmo *.cmi *.cma *.js
