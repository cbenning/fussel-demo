#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_DIR="$SCRIPT_DIR/demo-photos"
OUTPUT_DIR="$SCRIPT_DIR/docs/"


rm -r "$OUTPUT_DIR"

mkdir -p "$OUTPUT_DIR"

docker pull ghcr.io/cbenning/fussel:latest

docker run --rm \
  -v "$INPUT_DIR":/input:ro \
  -v "$OUTPUT_DIR":/output \
  -e PUID=$(id -u) \
  -e PGID=$(id -g) \
  -e INPUT_PATH="/input" \
  -e OUTPUT_PATH="/output" \
  -e SITE_ROOT="/" \
  -e SITE_TITLE="Fussel Demo" \
  -e SITE_ROOT="/fussel-demo/" \
  -e FACE_TAG_ENABLE="True" \
  -e WATERMARK_ENABLE="True" \
  -e PARALLEL_TASKS="4" \
  ghcr.io/cbenning/fussel:latest

