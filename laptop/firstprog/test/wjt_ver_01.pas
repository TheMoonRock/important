program gt1;
var
	a, g: string;
	i, b, x: integer;

	r: string;
	tf: boolean;
	q, s, z, u: integer;
begin
	writeln('Write sentence: ');
	readln(a);
	i := length(a);
	x := 1;
	for x := 1 to i-1 do
	begin
	for b := x + 1 to i do
	begin
		if a[x] <> ' ' then
			begin
		if a[x] = a[b] then
			begin
			g := g + a[x];
			continue;
		end;
		end;
	end;
	end;

	{	g[1] := r[1];}
	q := 1;
	s := length(g);

	for z := 1 to s do
	begin
		tf := true;
		for u := 1 to q do
		begin
			if g[z] = r[u] then
				tf := false;
		end;
		if tf then
		begin
			q := q + 1;
			r[q] := g[z];
		end;
	end;

	for z := 0 to q do
	begin
		write(r[z]);
	end;
	writeln;

end.
