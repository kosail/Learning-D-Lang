import std.stdio : writefln;
import std.string : split;
import std.file: exists, isFile, isDir;
import std.path;
import print_file_times;

/*
Escriba un programa de nombre fechas.c que sirva para mostrar por consola las fechas que se almacenan en los nodos-i de un conjunto de ficheros. La forma de invocar al programa será: $ fechas ficheros A continuación se muestran algunos ejemplos de invocación al programa y las salidas que produce:
$ fechas
    ERROR: Forma de uso: fechas ficheros

$ fechas mover.c
    Último acceso: Mon Apr 3 21:00:17 1995
    Última modificación: Mon Apr 12:17:14 1995
    Última modificación del nodo-i: Mon Apr 3 12:17:14 1995

$ fechas /u*
    /users
        Último acceso: Mon Apr 3 21:00:17 1995
        Última modificación: Mon Apr 12:17:14 1995
        Última modificación del nodo-i: Mon Apr 3 12:17:14 1995

    /usr
        Último acceso: Mon Apr 3 21:00:17 1995
        Última modificación: Mon Apr 12:17:14 1995
        Última modificación del nodo-i: Mon Apr 3 12:17:14 1995

*/

int main(string[] args)
{
	if (args.length < 2) {
		string name = baseName(args[0]);
		writefln("ERROR: Forma de uso:\n\t%s ficheros", name);

		return -1;
	}

	foreach(file; args[1 .. $]) {
		if (! exists(file)) {
			writefln("%s does not exists!", file);
			return -1;
		}

		printDates(file);
	}
	
	return 0;
}