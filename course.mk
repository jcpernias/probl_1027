subject_code := 1027
probl_units := \
	01 \

probl_figs :=



LANGUAGES := es

SOLUTIONS := no

ifeq ($(SOLUTIONS),no)
  doc_types := prhdout-
else
  doc_types := prhdout- prsol-
endif


probl_suffixes := $(addprefix _$(subject_code)-, $(LANGUAGES))

probl_prefixes := $(foreach type,$(doc_types),$(addprefix $(type),$(probl_units)))
probl_base := $(foreach suffix,$(probl_suffixes),\
  $(addsuffix $(suffix),$(probl_prefixes)))
probl_pdf := $(addprefix $(outdir)/, $(addsuffix .pdf, $(probl_base)))


docs_pdf := $(probl_pdf)

## Automatic dependencies
## ================================================================================
probl_deps := $(addprefix $(depsdir)/, $(addsuffix .pdf.d, $(probl_base)))

probl_tex_deps := $(addprefix $(depsdir)/probl-, \
	$(addsuffix _$(subject_code)-es.tex.d, $(probl_units)))

probl_figs_deps := $(addprefix $(depsdir)/probl-,\
	$(addsuffix _$(subject_code)-figs.d, $(probl_figs)))

all_deps := $(probl_deps) $(probl_tex_deps) $(probl_figs_deps)
