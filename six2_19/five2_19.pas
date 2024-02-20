program hello;
var
	c, t: char;
	know, print: boolean;
	b, y: integer;
begin
	y := 0;
	b := 0;
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
		end
		else
		begin
			if c = '(' then
			begin
				read(c);
				if c =	')' then
					y := y + 1;
			end;
		end;
	end;
	writeln(y);
end.
