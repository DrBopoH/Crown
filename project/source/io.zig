const builtin = @import("builtin");
const native_os = builtin.os.tag;

const std = @import("std");



pub var io: std.Io = undefined;

pub const Message = struct {
	buffer: []const u8 = "",
	EOF_char: []const u8 = "\n"
};

pub fn print(message: Message) !void {
	const stdout_file = std.Io.File{
		.handle = switch (native_os) {
			.windows => std.os.windows.GetCurrentThread(),
			.linux => std.posix.STDOUT_FILENO,
			else => @compileError("Unsupported OS!"),
		},
		.flags = .{ 
			.nonblocking = false 
		},
	};

	_ = try std.Io.File.writeStreamingAll(stdout_file, io, message.buffer);
	_ = try std.Io.File.writeStreamingAll(stdout_file, io, message.EOF_char);
}