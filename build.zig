const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const test_file = b.option([]const u8, "test", "path to a test file");
    const test_filter = b.option([]const []const u8, "test_filter", "test filters");

    const root_mod = if (test_file) |test_path|
        b.createModule(.{
            .root_source_file = .{ .cwd_relative = test_path },
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .stack_check = false,
        })
    else
        b.createModule(.{
            .root_source_file = b.path("src/test.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .stack_check = false,
        });

    const libmain = b.addTest(.{
        .name = "app_zig",
        .root_module = root_mod,
        .emit_object = true,
        .test_runner = .{ .path = b.path("src/main.zig"), .mode = .simple },
        .filters = if (test_filter) |filters| filters else &.{},
    });
    libmain.linkage = .dynamic;

    b.getInstallStep().dependOn(&b.addInstallLibFile(libmain.getEmittedBin(), "app_zig.o").step);

    const libzig = b.addStaticLibrary(.{
        .name = "zig",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/root.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
            .stack_check = false,
        }),
    });
    libzig.bundle_compiler_rt = true;
    b.installArtifact(libzig);
}
