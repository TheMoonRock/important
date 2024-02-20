program task2_19;
var
	s: string;
	c, t: char;
	i, x, q, w: integer;
	know, print: boolean;
begin
	know := false;
	print := false;
	t := ' ';
	i := 0;
	x := 0;
	q := 0; { чётное}
	w := 0; {нечётное}
	while not eof do
	begin
		q := q + 1;
		read(c);
		if c = #10 then
		begin
			i := i + 1;
			if know and print then
				writeln;
			know := false
		end
		else
		begin
			if (((c = ' ') or (c = #9)) and (c <> t)) then
			begin
				i := i + 1;
				if q / 2 <> 1 then
			end;	
		end;

	t := c;
	end;
	writeln(i);
end.
