FANGLE=fangle
AWK=awk
RUN_FANGLE=$(AWK) -f $(FANGLE)
#LITERATE_SOURCE=
LYX_SOURCE=$(LITERATE_SOURCE) # but only the .lyx files
TEX_SOURCE=$(LYX_SOURCE:.lyx=.tex)
EXTRA_DIST+=$(TEX_SOURCE)
TEXMACS_SOURCE=$(LITERATE_SOURCE) # but only the .tm files
TXT_SOURCE=$(LITERATE_SOURCE:.tm=.txt)
EXTRA_DIST+=$(TXT_SOURCE)
FANGLE_SOURCE=$(TXT_SOURCE)
FANGLE_SOURCE_STAMP=$(FANGLE_SOURCE).stamp
FANGLE_PREFIX:=\.\/
FANGLE_SOURCES:=$(shell \
  $(RUN_FANGLE) -r $(FANGLE_SOURCE) |\
  sed -e 's/^[<][<]//;s/[>][>]$$//;/^$(FANGLE_PREFIX)/!d' \
      -e 's/^$(FANGLE_PREFIX)/\.\//' )
if_extension=$(if $(findstring $(suffix $(1)),$(2)),$(3),$(4))
C_EXTENSIONS=.c .h
TABS=8
nf_line=-L -T$(TABS)
fangle=$(RUN_FANGLE) $(call if_extension,$(2),$(C_EXTENSIONS),$(nf_line)) -R"$(2)" $(1)
indent_options=-npro -kr -i8 -ts8 -sob -l80 -ss -ncs
indent=$(call if_extension,$(1),$(C_EXTENSIONS), | indent $(indent_options))
fangle_extract=@mkdir -p $(dir $(1)) && \
  $(call fangle,$(2),$(1)) > "$(1).tmp" && \
  cat "$(1).tmp" $(indent) | cpif "$(1)" \
  && rm -f -- "$(1).tmp" || \
  (echo error fangling $(1) from $(2) ; exit 1)
define FANGLE_template
  $(1): $(2)
	$$(call fangle_extract,$(1),$(2))
  FANGLE_TARGETS+=$(1)
endef
FANGLE_PDF+=$(TEX_SOURCE:.tex=.pdf)
FANGLE_PDF+=$(LITERATE_SOURCE:.tm=.pdf)
FANGLE_DOCS=$(FANGLE_PDF)
.PHONEY : clean_pdf
.SUFFIXES: .tex .lyx
.lyx.tex:
	lyx -e latex $<
clean_tex:
	rm -f -- $(TEX_SOURCE)
clean: clean_tex
.SUFFIXES: .txt .tm
.tm.txt:
	texmacs -s -c $< $@ -q
.PHONEY: clean_txt
clean_txt:
	rm -f -- $(TXT_SOURCE)
clean: clean_txt
$(FANGLE_SOURCE_STAMP): $(FANGLE_SOURCE) \
	                $(FANGLE_SOURCES) ; \
	echo -n > $(FANGLE_SOURCE_STAMP)
clean_stamp:
	rm -f $(FANGLE_SOURCE_STAMP)
clean: clean_stamp
.PHONY: echo_fangle_sources
echo_fangle_sources: ; @echo $(FANGLE_SOURCES)
.PHONY: fangle_sources
fangle_sources: $(FANGLE_SOURCE_STAMP)
.PHONY: clean_fangle_sources
clean_fangle_sources: ; \
        rm -f -- $(FANGLE_SOURCE_STAMP) $(FANGLE_SOURCES)
$(foreach source,$(FANGLE_SOURCES),\
  $(eval $(call FANGLE_template,$(source),$(FANGLE_SOURCE))) \
)
_distclean: clean_fangle_sources
.SUFFIXES: .tex .pdf
.tex.pdf:
	pdflatex $< && pdflatex $<

clean_pdf_tex:
	rm -f -- $(FANGLE_PDF) $(TEX_SOURCE:.tex=.toc) \
	  $(TEX_SOURCE:.tex=.log) $(TEX_SOURCE:.tex=.aux)
clean_pdf: clean_pdf_tex
.SUFFIXES: .tm .pdf
.tm.pdf:
	texmacs -s -c $< $@ -q

clean_pdf_texmacs:
	rm -f -- $(FANGLE_PDF)
clean_pdf: clean_pdf_texmacs
.PHONY: fangle_docs
fangle_docs: $(FANGLE_DOCS)
docs: fangle_docs
.PHONEY: clean_fangle_docs
clean_fangle_docs: clean_tex clean_pdf
clean: clean_fangle_docs

distclean_fangle_docs: clean_tex clean_fangle_docs
distclean: clean distclean_fangle_docs
