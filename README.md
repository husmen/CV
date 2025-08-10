# CV

Personal CV built with RenderCV.

## Local build

Prerequisites:

- Python 3.10+
- Typst (optional locally; the workflow installs it for PDF generation)

Install and render:

```bash
pipx install rendercv[full]
rendercv render Houssem_Menhour_CV.yaml
```

Outputs are generated in `rendercv_output/`:

- `Houssem_Menhour_CV.html` (preview in a browser)
- `Houssem_Menhour_CV.pdf`
- `Houssem_Menhour_CV.typ` and `.md`

## CI/CD

This repo includes a GitHub Actions workflow that:

- Builds the CV on pushes to `main` and on tags matching `v*`.
- Publishes the site to GitHub Pages (HTML as `index.html`, plus PDF and assets).
- Attaches PDF/HTML/Typst/MD artifacts to GitHub Releases for tag builds.

To publish a new release:

1. Update `Houssem_Menhour_CV.yaml`.
2. Push a tag like `v1.2.0` to trigger a release with assets.

