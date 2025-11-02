module print_file_times;

import std.stdio;
import std.file;
import std.datetime;
import std.format;
import std.string;

void printDates(string file) {
    SysTime created, accessed, modified;
    getTimesWin(file, created, accessed, modified);

    string createdStr = created.toLocalTime().toString();
    const lastDot = lastIndexOf(createdStr, '.');

    if (lastDot != -1)
        createdStr = createdStr[0 .. lastDot];


    writefln(file);
    writeln("\tDate created: ", createdStr);
    writeln("\tLast accessed: ", accessed);
    writeln("\tLast modified: ", modified);
    writeln();
}