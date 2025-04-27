# Create an unikernel with Unikraft and Zig

## Prerequisites
- Install Zig toolchain: https://ziglang.org/learn/getting-started/

## Usage

```
git clone --recurse-submodules https://github.com/tw4452852/unikraft-zig
cd unikraft-zig
make
```

The generated image will be `./workdir/build/app-zig_<platform>-<arch>`,
and you could run it with the qemu now (follow the instructions on https://unikraft.org/guides/internals#running).

Have fun!

## Supported architectures
- `aarch64`
- `x86_64`
