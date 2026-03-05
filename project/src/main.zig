//PROJECT modules
const edu = @import("edu.zig");

// --- ОБХОД ОШИБКИ ANDROID BIONIC ---
// Мы создаем пустую переменную, которая заставляет линкер
// сделать выравнивание TLS сегмента ровно 64 байта.
export threadlocal var dummy_bionic_tls_align: u8 align(64) = 0;

//STD Lib
const std = @import("std");

const print = std.debug.print;

pub fn main() void {
	print("Created at Android 16 Termux 3.13 Helix\n", .{});
	edu.main();
}
