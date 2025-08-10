# Simple Makefile to render CV variants and prepare GitHub Pages content

BASE := Houssem_Menhour_CV.yaml
VARIANTS := \
	variants/Houssem_Menhour_CV_GE.yaml \
	variants/Houssem_Menhour_CV_Oura.yaml \
	variants/Houssem_Menhour_CV_ICEYE.yaml \
	variants/Houssem_Menhour_CV_AMD.yaml

INPUTS := $(BASE) $(VARIANTS)
OUT := rendercv_output
PUBLIC := public

.PHONY: all render-all pages clean

all: render-all pages

render-all:
	@echo "Rendering CVs: $(INPUTS)"
	rendercv render $(BASE)
	@for f in $(VARIANTS); do \
		echo "Rendering $$f"; \
		rendercv render "$$f"; \
	done

pages:
	@echo "Preparing content for GitHub Pages in $(PUBLIC)"
	mkdir -p $(PUBLIC)
	# Copy all generated artifacts
	cp -f $(OUT)/*.html $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.pdf  $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.typ  $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.md   $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.png  $(PUBLIC)/ 2>/dev/null || true
	# Create a simple index listing all HTML CVs
	{ \
		echo '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">'; \
		echo '<title>Houssem Menhour — CV Variants</title>'; \
		echo '<style>body{font-family:sans-serif;max-width:860px;margin:40px auto;padding:0 16px} ul{line-height:1.8}</style>'; \
		echo '</head><body><h1>Houssem Menhour — CV Variants</h1><ul>'; \
		for f in $(OUT)/*.html; do \
			bn=$$(basename "$$f"); \
			echo "<li><a href='$$bn'>$$bn</a></li>"; \
		done; \
		echo '</ul></body></html>'; \
	} > $(PUBLIC)/index.html

clean:
	rm -rf $(OUT) $(PUBLIC)
