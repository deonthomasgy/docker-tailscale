# docker-tailscale
Tailscale with Ubuntu, SSH tools and legacy iptables for GitLab CI deployment jobs.

The versioned CI image uses Tailscale **1.104.2** on Ubuntu 24.04 and includes
the fixes described in [Tailscale's security bulletins](https://tailscale.com/security-bulletins).
`Dockerfile.ci` pins the Ubuntu and Go builder digests. It builds the exact
Tailscale module version with Go 1.27.3 and `golang.org/x/net` 0.60.0 to fix
CVE-2026-78669, which remains in the official 1.104.2 binaries.

```sh
docker build -f Dockerfile.ci -t princeamd/tailscale:1.104.2 .
docker run --rm princeamd/tailscale:1.104.2 tailscale version
```

CI jobs start `tailscaled` themselves and supply their existing authentication
through CI secrets. No credentials or Tailscale state are embedded in the image.
