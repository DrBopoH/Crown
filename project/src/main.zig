//PROJECT modules
const edu = @import("edu.zig");

//STD Lib
const std = @import("std");

const print = std.debug.print;

pub fn main() void {
	print("Created at Android 16 Termux 3.13 Helix\n", .{});
	edu.main();
}
