program hello;
var
	c, t: char;
	know, print: boolean;
	i, x, y, b, max, min: integer;
begin
	i := 0;
	x := 0;
	y := 0;
	b := 0;
	min := 0;
	max := 0;
	t := ' ';
	know := false;
	print := false;

	while not eof do
	begin
		read(c);
		b := b + 1;
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
		if (((t = ' ') or (t = #9)) and (c <> t)) then
		begin
			b := 0;
		end;
		if (((c = ' ') or (c = #9) or (c = #10)) and (c <> t)) then
		begin
			if min = 0 then
				min := b;
			if max = 0 then
				max := b;
			if b > max then
				max := b
			else
			begin
			if b < min then
				min := b;
			end;
		end;
		x := x + 1;
		t := c;
		if c = ' ' then
			x := 0;
	end;
	writeln(max);
	writeln(min);
	writeln(y);
	writeln(i);	
end.
