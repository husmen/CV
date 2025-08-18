# Simple Makefile to render the CV and prepare GitHub Pages content

CV := Houssem_Menhour_CV.yaml
OUT := rendercv_output
PUBLIC := public

.PHONY: all render render-public pages clean

all: render pages

# Render the main CV. If a .env file exists, substitute EMAIL and PHONE
# from it into a temporary copy of the input YAML before calling rendercv.
render:
	@echo "Rendering CV: $(CV)"
	@if [ -f .env ] ; then \
		echo "Found .env file — substituting EMAIL/PHONE into a temporary input and rendering"; \
		mkdir -p $(OUT); \
		# read variables without sourcing the file (avoid executing malformed lines) \
		EMAIL="$$(sed -n 's/^EMAIL=//p' .env)"; \
		PHONE="$$(sed -n 's/^PHONE=//p' .env)"; \
		sed -E -e "s|^([[:space:]]*email:).*|\\1 $${EMAIL}|" -e "s|^([[:space:]]*phone:).*|\\1 $${PHONE}|" "$(CV)" > "$(OUT)/_render_input.yaml"; \
		rendercv render "$(OUT)/_render_input.yaml"; \
		rm -f "$(OUT)/_render_input.yaml"; \
	else \
		rendercv render $(CV); \
	fi

render-public:
	@echo "Rendering public CV: $(CV)"
	@rendercv render "$(CV)"

pages:
	@echo "Preparing content for GitHub Pages in $(PUBLIC)"
	mkdir -p $(PUBLIC)
	# Copy all generated artifacts
	cp -f $(OUT)/*.html $(PUBLIC)/index.html 2>/dev/null || true
	cp -f $(OUT)/*.pdf  $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.typ  $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.md   $(PUBLIC)/ 2>/dev/null || true
	cp -f $(OUT)/*.png  $(PUBLIC)/ 2>/dev/null || true

clean:
	rm -rf $(OUT) $(PUBLIC)
