const _ = @import("compile_rt");

export fn malloc_usable_size(_: [*c]u8) callconv(.c) c_int {
    @panic("unsupported");
}
