#!/usr/bin/env bash
set -ex

# static_interner uses unstable features; allow on stable rustc (cf. swc-feedstock)
export RUSTC_BOOTSTRAP=1

cd pyrefly
export CARGO_PROFILE_RELEASE_STRIP=symbols
export CARGO_PROFILE_RELEASE_LTO=fat
cargo install --locked --no-track --bins --root "${PREFIX}" --path .
cargo-bundle-licenses --format yaml --output ./THIRDPARTY.yml
