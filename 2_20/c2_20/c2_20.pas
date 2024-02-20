program c2_20;
var
	b, f, h, i: integer;
	abc: string;	
begin
	for i := 0 to ParamCount do
	begin
		b := 0;
		f := 0;
		abc := ParamStr(i);
		for h := 0 to length(abc) do
		begin
			if (abc[h] = '@') then
			begin
				b := b + 1;
			end;
			if (abc[h] = '.') then
			begin
				f := f + 1;
			end;
		end;
		if ((b = 1) and (f >= 1)) then
		begin
			writeln(abc);
		end;
	end;
end.
