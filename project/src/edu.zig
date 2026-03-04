const std = @import("std");

const print = std.debug.print;

var a  = .{"l","a","b","y","b","y"};
const year: i16= 18;
var kilo: f32 = 44.5;
var see: f32 = -3.25;

pub fn main() void {
	print("Hello, I`m begginer!\n", .{});

	print("My year ago {}\n", .{year});
	print("My kilo{}, my see {}, my year ago{}\n", .{kilo, see, year});
	print("My frause: {}\n", .{a});
}