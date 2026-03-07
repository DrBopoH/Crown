const std = @import("std");
const builtin = @import("builtin");

pub fn build(b: *std.Build) void {
	const target = b.standardTargetOptions(
		.{
			.default_target = switch (builtin.abi) {
				.android => .{
					.cpu_arch = .aarch64,
					.os_tag = .linux,
					.abi = .android,
				},
				else => .{} 
			}
		}
	);
	
	const optimize = b.standardOptimizeOption(
		.{
			.preferred_optimize_mode = .ReleaseFast,
		}
	);

	const exe = b.addExecutable(.{
		.name = "Crown",
		.root_module = b.createModule(.{
			.root_source_file = b.path("main.zig"),
			.target = target,
			.optimize = optimize,
		}),
	});

	exe.pie = true;    
	b.installArtifact(exe);

	const run_cmd = b.addRunArtifact(exe);
	run_cmd.step.dependOn(b.getInstallStep());

	if (b.args) |args| {
		run_cmd.addArgs(args);
	}

	const run_step = b.step("run", "Run the app");
	run_step.dependOn(&run_cmd.step);
}
