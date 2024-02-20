program b2_20;
procedure equal(abc: string);
var
	a, f, k: integer;
begin
	for a := 1 to (length(abc)-1) do
	begin
		for k := a + 1 to length(abc) do
		begin
			if abc[a] = abc[k] then
				exit;
		end;
	end;
	writeln(abc);
end;
var
	i: integer;
begin
	for i := 1 to ParamCount do
	begin
		equal(ParamStr(i));
	end;
end.
