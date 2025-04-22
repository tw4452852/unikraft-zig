# Create an unikernel with Unikraft and Zig

## Prerequisites
- Install Zig toolchain: https://ziglang.org/learn/getting-started/

## Usage

```
git clone https://github.com/tw4452852/unikraft-zig
cd unikraft-zig
git clone https://github.com/unikraft/unikraft ./workdir/unikraft
make
```

The generated image will be `./workdir/build/app-zig_<platform>-<arch>`.

## Supported architectures
- `aarch64`
- `x86_64`
