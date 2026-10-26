# docker-tailscale
Tailscale with Ubuntu, SSH tools and legacy iptables for GitLab CI deployment jobs.

The versioned CI image uses Tailscale **1.104.2** on Ubuntu 24.04 and includes
the fixes described in [Tailscale's security bulletins](https://tailscale.com/security-bulletins).
`Dockerfile.ci` pins the Ubuntu image digest and installs the exact Tailscale
version from its signed apt repository.

```sh
docker build -f Dockerfile.ci -t princeamd/tailscale:1.104.2 .
docker run --rm princeamd/tailscale:1.104.2 tailscale version
```

CI jobs start `tailscaled` themselves and supply their existing authentication
through CI secrets. No credentials or Tailscale state are embedded in the image.
