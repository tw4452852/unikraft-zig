const std = @import("std");

test "hello" {
    const stdout = std.io.getStdOut();
    try stdout.writeAll("sample test! ");
}
