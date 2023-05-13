# NixOS image generator for Lima
Based off of [`patryk4815/ctftools`](https://github.com/patryk4815/ctftools).

Currently, there's no "good" way to run nix on macOS. The nix package manager
for darwin is frankly broken and traditional virtual machines are not ideal
to use for everyday tasks. This repo allows a workflow which uses
[lima](https://github.com/lima-vm/lima), which makes it very easy to run a light
NixOS container on top of macOS, with heavy integration features.

## Generating the image

Run the following in an environment that already has nix installed:

```
nix run github:nix-community/nixos-generators -- -f raw-efi -c configuration.nix
```

Then feed the `aarch64.yml` in this repo and the generated image to lima.
