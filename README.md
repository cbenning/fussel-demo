# fussel-demo

Demo gallery for [Fussel](https://github.com/cbenning/fussel), published at https://benninger.ca/fussel-demo.

## How it is deployed

`.github/workflows/deploy.yml` builds the site with the latest Fussel release (the `ghcr.io/cbenning/fussel` image) and deploys it to GitHub Pages.

- **Daily:** checks for a new Fussel release and rebuilds only if it differs from `FUSSEL_VERSION`.
- **On push:** rebuilds when `demo-photos/` or the workflow changes.
- **Manually:** run the workflow from the Actions tab, optionally with a specific Fussel version.

The Pages source must be set to **GitHub Actions** (Settings, Pages).

To preview locally, run the Fussel image on `demo-photos/`:

```sh
docker run --rm -v "$PWD/demo-photos":/input:ro -v "$PWD/site":/output \
  -e PUID="$(id -u)" -e PGID="$(id -g)" -e INPUT_PATH=/input -e OUTPUT_PATH=/output \
  -e SITE_ROOT=/ -e SITE_TITLE="Fussel Demo" -e FACE_TAG_ENABLE=True -e WATERMARK_ENABLE=True \
  ghcr.io/cbenning/fussel:latest
python3 -m http.server --directory site
```
