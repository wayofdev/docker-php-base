#!/bin/bash

set -euo pipefail

get_digest() {
  local variant="$1"
  local arch="$2"
  find "/tmp/digests/digests-${variant}-${arch}" -type f -exec basename {} \;
}

create_manifest_list() {
  local namespace="$1"
  local variant="$2"
  local digest_amd64="$3"
  local digest_arm64="$4"

  docker buildx imagetools create \
    "$(jq -cr ".target.\"docker-metadata-action\".tags | map(select(startswith(\"${namespace}\")) | \"-t \" + .) | join(\" \")" "/tmp/bake-meta-${variant}-amd64.json")" \
    "${namespace}@sha256:${digest_amd64}" \
    "${namespace}@sha256:${digest_arm64}"
}

# Get list of unique variants
mapfile -t variants < <(find . -maxdepth 1 -name "bake-meta-*.json" -exec basename {} \; | sed -E 's/bake-meta-//; s/-amd64.json|-arm64.json//g' | sort -u)

for variant in "${variants[@]}"; do
  echo "Processing variant: $variant"

  # Fetch digests for amd64 and arm64 architectures
  digest_amd64=$(get_digest "$variant" "amd64")
  digest_arm64=$(get_digest "$variant" "arm64")
  echo "Digest AMD64: $digest_amd64"
  echo "Digest ARM64: $digest_arm64"

  create_manifest_list "${DOCKER_NAMESPACE}" "$variant" "$digest_amd64" "$digest_arm64"
  create_manifest_list "${GHCR_NAMESPACE}" "$variant" "$digest_amd64" "$digest_arm64"
done
