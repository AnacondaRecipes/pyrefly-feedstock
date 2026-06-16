@echo off
setlocal

REM hack: path too long for pixi_config subpackage, https://github.com/prefix-dev/pixi/issues/3691
set CARGO_HOME=C:\.cargo

REM static_interner uses unstable features; allow on stable rustc (cf. swc-feedstock)
set RUSTC_BOOTSTRAP=1

cd pyrefly
set CARGO_PROFILE_RELEASE_STRIP=symbols
set CARGO_PROFILE_RELEASE_LTO=fat
cargo install --locked --no-track --bins --root %PREFIX% --path .
if errorlevel 1 exit /b 1
cargo-bundle-licenses --format yaml --output ./THIRDPARTY.yml
if errorlevel 1 exit /b 1
