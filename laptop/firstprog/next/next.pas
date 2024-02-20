program next;
var
	i, j: integer;
	c: char;

	z: integer;
	t: integer;
	x: integer;
	f: integer;
begin
	write('   |');
	for z := &0 to &13 do
		write(' ', z, '.');
	writeln;
	write('   |');
	for i := 1 to 16 do
		write('---');
	writeln;
	f := 0;
	for i := 2 to 9 do
	begin
		t := 0;
		x := 2;
		write('.', i, ' |');
		for j := 0 to 11 do
		begin
			t := (8 * j);
			write(' ', chr(x*16 + t+f), ' ');
		end;
		x := x + 1;
		f := f + 1;
		writeln;
	end;
end.
