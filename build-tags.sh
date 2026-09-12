#!/bin/sh
# Single source of truth for the Go build tags.
#
# Sourcing this sets BUILD_TAGS to the full Linux release set -- the same tags
# release.yml uses for a naive-capable platform. Build and test with these so a
# local build, CI and a release binary all compile the same code: several
# protocols are behind tags, and a plain `go build` silently swaps in the stubs
# from core/register_*_stub.go.
#
# Platform deltas, which is why each pipeline still owns its own line:
#   release.yml  drops with_naive_outbound,with_musl on platforms without a
#                cronet toolchain (armv6, armv5, s390x).
#   windows.yml  swaps with_musl for with_purego.
#   Dockerfile   swaps with_musl for with_purego and drops the linkname tags.
BUILD_TAGS="with_quic,with_grpc,with_utls,with_acme,with_gvisor,with_naive_outbound,with_musl,badlinkname,tfogo_checklinkname0,with_tailscale,with_cloudflared,with_openconnect,with_openvpn"
