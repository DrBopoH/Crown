//PROJECT modules
const edu = @import("source/edu.zig");

//STD Lib
const std = @import("std");
const builtin = @import("builtin");

// --- ОБХОД ОШИБКИ ANDROID BIONIC ---
// Мы создаем пустую переменную, которая заставляет линкер
// сделать выравнивание TLS сегмента ровно 64 байта.
comptime {
    if (builtin.abi == .android) {
        _ = struct {
            export threadlocal var dummy_bionic_tls_align: u8 align(64) = 0;
        };
    }
}

// Сообщение приветствия под каждую платформу
const buildprint = switch (builtin.os.tag) {
	.windows => "Windows",
	.linux => if (builtin.abi == .android) "Android 16 Termux 3.13 Helix" else "Linux",
	else => "Other",
};

const print = std.debug.print;

pub fn main() void {
	print("Created at {s}\n\n", .{buildprint});
	
	edu.main();
}