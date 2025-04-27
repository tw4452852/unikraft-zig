# Create an unikernel with Unikraft and Zig

## Prerequisites
- Install Zig toolchain: https://ziglang.org/learn/getting-started/

## Usage

```
git clone --recurse-submodules https://github.com/tw4452852/unikraft-zig
cd unikraft-zig
make olddefconfig
make
```

The generated image will be `./workdir/build/app-zig_qemu-x86_64`,
and you could run it with the qemu now (follow the instructions on https://unikraft.org/guides/internals#running).

```
qemu-system-x86_64 -nographic -kernel ./workdir/build/app-zig_qemu-x86_64 -cpu qemu64,pdpe1gb
```

You should see this:

```
Booting from ROM..Powered by
o.   .o       _ _               __ _
Oo   Oo  ___ (_) | __ __  __ _ ' _) :_
oO   oO ' _ `| | |/ /  _)' _` | |_|  _)
oOo oOO| | | | |   (| | | (_) |  _) :_
 OoOoO ._, ._:_:_,\_._,  .__,_:_, \___)
          Helene 0.18.0~eabefb07-custom
Hi Zig
test.test.hello... sample test! PASS
1 passed, 0 skipped, 0 failed
```

You could also specify test root file and test filter by `make menuconfig`
in `Application Options -> Zig app`.

Have fun!

## Supported architectures
- `x86_64`
