@echo off
setlocal

REM hack: path too long for pixi_config subpackage, https://github.com/prefix-dev/pixi/issues/3691
set CARGO_HOME=C:\.cargo

cd pyrefly
set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat
cargo install --locked --no-track --bins --root %PREFIX% --path .
cargo-bundle-licenses --format yaml --output ./THIRDPARTY.yml
