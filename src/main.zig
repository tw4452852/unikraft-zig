const std = @import("std");
const builtin = @import("builtin");

export fn main() callconv(.c) c_int {
    const stderr = std.io.getStdErr();

    stderr.writeAll("Hi Zig\n") catch return -1;

    var passed: u64 = 0;
    var skipped: u64 = 0;
    var failed: u64 = 0;

    for (builtin.test_functions) |test_fn| {
        stderr.writeAll(test_fn.name) catch return -1;
        stderr.writeAll("... ") catch {};
        if (test_fn.func()) |_| {
            passed += 1;
            stderr.writeAll("PASS\n") catch return -1;
        } else |err| {
            if (err != error.SkipZigTest) {
                failed += 1;
                stderr.writeAll("FAIL\n") catch return -1;
            } else {
                skipped += 1;
                stderr.writeAll("SKIP\n") catch return -1;
            }
        }
    }
    stderr.writer().print("{} passed, {} skipped, {} failed\n", .{ passed, skipped, failed }) catch {};
    return 0;
}

pub fn fuzz(
    context: anytype,
    comptime _: fn (context: @TypeOf(context), []const u8) anyerror!void,
    _: std.testing.FuzzInputOptions,
) anyerror!void {
    @panic("unsupported");
}
