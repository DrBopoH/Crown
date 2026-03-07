const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) void {
	const target = b.standardTargetOptions(.{});
	const optimize = b.standardOptimizeOption(.{});

	const exe = b.addExecutable(.{
		.name = "Crown",
		.root_module = b.createModule(.{
			.root_source_file = b.path("main.zig"),
			.target = target,
			.optimize = optimize,
			.strip = true,
		}),
	});

	exe.pie = true;    
	exe.lto = .full;

	b.installArtifact(exe);

	const run_cmd = b.addRunArtifact(exe);
	run_cmd.step.dependOn(b.getInstallStep());

	if (b.args) |args| {
		run_cmd.addArgs(args);
	}

	const run_step = b.step("run", "Run the app");
	run_step.dependOn(&run_cmd.step);
}
