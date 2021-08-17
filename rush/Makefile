##############################################################
####################### OCAML MAKEFILE #######################
##############################################################

NAME = ttt

SOURCES = Field.ml main.ml

CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep
CAMLFIND = ocamlfind
BUILD_DIR = build

WITHGRAPHICS = -package graphics
LIBS = #$(WITHGRAPHICS)

all: depend $(NAME)

$(NAME) : opt byt
	ln -fs $(NAME).opt $(NAME)

opt: $(NAME).opt
byt: $(NAME).byt

OBJS = $(SOURCES:.ml=.cmo)
OPTOBJS = $(SOURCES:.ml=.cmx)

$(NAME).byt:	$(OBJS)
	$(CAMLFIND) $(CAMLC) -o $(NAME).byt -linkpkg  $(LIBS) $(OBJS)

$(NAME).opt:	$(OPTOBJS)
	$(CAMLFIND) $(CAMLOPT) -o $(NAME).opt -linkpkg $(LIBS) $(OPTOBJS)

.SUFFIXES:
.SUFFIXES: .ml .mli .cmo .cmi .cmx

.ml.cmo:
	$(CAMLFIND) $(CAMLC) -c $< $(LIBS)

.mli.cmi:
	$(CAMLFIND) $(CAMLC) -c $< $(LIBS)

.ml.cmx:
	$(CAMLFIND) $(CAMLOPT) -c $<  $(LIBS)

clean:
	find . -name "*.cm[iox]" -type f -delete
	find . -name "*.o" -type f -delete
	rm -f .depend

fclean: clean
	rm -rf $(NAME)
	rm -rf $(NAME).opt
	rm -rf $(NAME).byt

depend:
	$(CAMLDEP) $(SOURCES) > .depend

re: fclean all

-include .depend
