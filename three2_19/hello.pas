program hello;
procedure eo(x: integer; var even, odd1: integer);
begin
	if (x > 7) then
	begin
		even := even + 1;
	end
	else
	begin
		if x < 2 then
		begin
			odd1 := odd1 + 1;
		end;
	end;
end;
var
	s: string;
	c, t: char;
	know, print: boolean;
	i, x, p, g: integer;
begin
	i := 0;
	x := 0;
	p := 0;
	g := 0;
	t := ' ';
	know := false;
	print := false;

	while not eof do
	begin
		read(c);
		if c = #10 then
		begin
			if know and print then
				writeln;
			know := false;
			i := i + 1;
			eo(x, p, g);
			x := 0;
		end
		else
		begin
			if (((c = ' ') or (c = #9)) and (c <> t)) then
			begin
				i := i + 1;
				eo(x, p, g);
				x := 0;
			end;
		end;
		x := x + 1;
		t := c;
		if c = ' ' then
			x := 0;
	end;
	writeln('upper: ', p);
	writeln('lower: ', g);
	writeln(i);	
end.
