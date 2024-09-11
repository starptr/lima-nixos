# NixOS image generator for Lima
Based off of [`patryk4815/ctftools`](https://github.com/patryk4815/ctftools).

This repo allows a workflow which uses [lima](https://github.com/lima-vm/lima),
which makes it very easy to run a light NixOS container on top of macOS,
with heavy integration features.

However, consider using [nix-installer](https://github.com/DeterminateSystems/nix-installer).

## Generating the image

Run the following in an environment that already has nix installed:

```
nix run github:nix-community/nixos-generators -- -f raw-efi -c configuration.nix -I nixpkgs=channel:nixos-22.11
```

Then feed the `aarch64.yml` in this repo and the generated image to lima.

## References
https://github.com/lima-vm/lima/discussions/430
