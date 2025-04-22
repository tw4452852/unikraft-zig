const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_mod = b.createModule(.{
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    const lib = b.addObject(.{
        .name = "app_zig",
        .root_module = lib_mod,
    });

    b.getInstallStep().dependOn(&b.addInstallLibFile(lib.getEmittedBin(), "app_zig.o").step);
}
