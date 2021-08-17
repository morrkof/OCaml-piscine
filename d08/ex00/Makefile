NAME = atom

SOURCES = atom.ml main.ml

CAMLC = ocamlc
CAMLOPT = ocamlopt
CAMLDEP = ocamldep
CAMLFIND = ocamlfind

# WITHGRAPHICS = -package graphics

# LIBS = $(WITHGRAPHICS)

all: depend $(NAME)

$(NAME): opt byt
	ln -fs $(NAME).opt $(NAME)

opt: $(NAME).opt
byt: $(NAME).byt

OBJS = $(SOURCES:.ml=.cmo)
OPTOBJS = $(SOURCES:.ml=.cmx)

$(NAME).byt: $(OBJS)
	$(CAMLFIND) $(CAMLC) -o $(NAME).byt -linkpkg $(LIBS) $(OBJS)

$(NAME).opt: $(OPTOBJS)
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
	rm -f *.cm[iox] *~ .*~
	rm -f *.o
	rm -f .depend

fclean: clean
	rm -f $(NAME)
	rm -f $(NAME).opt
	rm -f $(NAME).byt

depend:
	$(CAMLDEP) $(SOURCES) > .depend

re: fclean all

-include .depend
