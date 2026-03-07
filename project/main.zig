//SOURCE
//const edu = @import("source/edu.zig");
//const Io = @import("source/io.zig");

//STD Lib
const builtin = @import("builtin");
const native_abi = builtin.abi;
//const native_arch = builtin.cpu.arch;
const native_os = builtin.os.tag;

const std = @import("std");

// --- ОБХОД ОШИБКИ ANDROID BIONIC ---
// Мы создаем пустую переменную, которая заставляет линкер
// сделать выравнивание TLS сегмента ровно 64 байта.
comptime {
	if (native_abi == .android) {
		_ = struct {
			export threadlocal var dummy_bionic_tls_align: u8 align(64) = 0;
		};
	}
}

// Сообщение приветствия под каждую платформу
const buildprint = switch (native_os) {
	.windows => "Windows",
	.linux => if (native_abi == .android) "Android 16 Termux 3.13" else "Linux",
	else => "Other",
};

const print = std.debug.print;


//const env: std.process.Environ = .{
	//.block = undefined,
//};
//const allocator = std.heap.page_allocator;
	


pub fn main() !void {
	//var t = std.Io.Threaded.init(allocator, .{ .environ = env });
	//Io.io = std.Io.Threaded.io(&t);

	//try Io.print(.{ .buffer = buildprint });

	print("Created at {s}\n\n", .{buildprint});
	//edu.main();
}