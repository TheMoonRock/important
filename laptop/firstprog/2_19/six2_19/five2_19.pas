program task2_19;
var
	c, t: char;
	i, q, e, max, max_spaces: integer;
begin
	t := ' ';
	i := 0;
	q := 0;
	max := 0;
	max_spaces := 0;
	while not eof do
	begin
		q := q + 1;
		read(c);
		if (((t = ' ') or (t = #9)) and (c <> t)) then
		begin
			q := 0;
		end;
		if (((c = ' ') or (c = #9) or (c = #10)) and (c <> t)) then
		begin
			if max = 0 then
			begin
				max := q;
			end;
			if q > max then
			begin
				max := q;
			end;
		end;
		if (c = ' ') then
		begin
			e := e + 1;
		end
		else
		begin
			if e > max_spaces then
			begin
				max_spaces := e;
			end;
			e := 0
		end;
		t := c;
	end;
	writeln(max);
	writeln(max_spaces);
	writeln(i);
end.
