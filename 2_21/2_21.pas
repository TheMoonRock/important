program alpha2_21;
var
	abc: string;
	c, t: char;

begin
	t := ' ';
	abc := '';
	while not eof do
	begin
		read(c);
		if ((c <> ' ') and (c <> #10)) then
			abc := abc + c;
		if (((c = ' ') or (c = #9) or (c = #10)) and (c <> t)) then
		begin
			if length(abc) = 2 then
			begin
				write(abc);
				if c = #10 then
					writeln();
			end;
			abc := '';
		end;
		if (((c = ' ') or (c = #9) or (c = #10)) and (c = t)) then
			abc := '';
	t := c;
	end;
end.
