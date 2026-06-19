# Changelog

## 0.0.4 - 2026-06-19

### Fixed
- Dockerfile: revert to build-from-source; upstream Nix binary links against Nix store paths and cannot execute on any standard Linux base image (Alpine or Debian)

## 0.0.3 - 2026-06-19

### Changed
- Dockerfile: switch from build-from-source to copying pre-built binary from upstream `kalbasit/signal-api-receiver:v0.4.0` image
- Dockerfile: switch base image from `ghcr.io/home-assistant/base:latest` (Alpine/musl) to `ghcr.io/home-assistant/base-debian:latest` (glibc) for upstream binary compatibility

## 0.0.2 - 2026-06-19

### Fixed
- Updated Go builder to 1.25 to meet upstream go.mod requirements

## 0.0.1 - 2026-06-19

### Added
- Initial Home Assistant add-on packaging of signal-api-receiver v0.4.0

### Fixed
- Dockerfile: build from source using Go to ensure musl compatibility with Alpine base
- Dockerfile: removed deprecated build.yaml in favour of direct FROM statement
- config.yaml: removed deprecated architectures (armhf, armv7, i386)