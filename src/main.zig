const std = @import("std");
const C = @cImport({
    @cInclude("point.c");
});
pub fn main() !void {
    const p = C.Point{ .x = 1, .y = 2 };
    const p_array = [_]C.Point{ p, p, p };

    const points = C.Points{
        .points = @ptrCast([*c]C.Point, &p_array),
        .length = p_array.len,
    };
    std.debug.print("{any}", .{points.points[2].x});
}
