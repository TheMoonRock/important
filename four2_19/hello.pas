program hello;
var
	c, t: char;
	know, print: boolean;
	i, x, y: integer;
begin
	i := 0;
	x := 0;
	y := 0;
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
			x := 0;
		end
		else
		begin
			if (((c = ' ') or (c = #9)) and (c <> t)) then
			begin
				i := i + 1;
				x := 0;
			end;
		end;
		if (((t = ' ') or (t = #9)) and (c = 'A')) then
			while ((t <> 'z') and ((c <> ' ') or (c <> #9))) do
			begin
				read(c);
				t := c;
			end;
			if ((t = 'z') and ((c = ' ') or (c = #9) or (c = #10))) then
			begin
				y := y + 1;
			end;
		x := x + 1;
		t := c;
		if c = ' ' then
			x := 0;
	end;
	writeln(y);
	writeln(i);	
end.
