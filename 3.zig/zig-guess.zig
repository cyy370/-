const std = @import("std");
pub fn main() void {
    const stdin = std.io.getStdIn();
    const stdout = std.io.getStdOut();
    const m: u8 = 17;
    var n: u8 = 0;
    var x: u8 = undefined;
    try stdout.writer().print("Guess a integer between 0 and 100 (100 isn't include):", .{});
    while (true) {
        n += 1;
        const bytes_read = try stdin.reader().readUntilDelimiterOrEof(&x, '\n');
        if (bytes_read) |input| {
            const trimmed = std.mem.trim(u8, input, " \r\n");
            const number = std.fmt.parseInt(i32, trimmed, 10) catch {
                try stdout.writer().print("Invalid number!\n", .{});
                return;
            };
            if (number == m) {
                std.debug.print("\nYou won!You guessed {} times.", .{n});
                break;
            } else if (number < m) {
                std.debug.print("\nToo small!Try again:", .{});
            } else {
                std.debug.print("\nToo big!Try again:", .{});
            }
        }
    }
}
