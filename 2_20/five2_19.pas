program hello;
var
	c, t: char;
begin
	t := ' ';
	while not eof do
	begin
		read(c);
			if (((c = ' ') or (c = #9) or (c = #10)) and (c <> t) and (t <> #10)) then
			begin
				write(')', c);
			end
			else
			begin
				if ((t = #10) and ((c = ' ') or (c = #9))) then
				begin
					t := c;
					continue;
				end
				else
				begin
				if (((t = ' ') or (t = #9) or (t = #10)) and (c <> t)) then
				begin
					write('(', c);
				end
				else
				begin
					write(c);
				end;
			end;
			end;
		t := c;
	end;
end.
