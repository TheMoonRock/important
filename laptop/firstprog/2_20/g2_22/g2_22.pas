program g2_22;
procedure onemore(something: string);
var
	abc: string;
	v, x: integer;
begin
	abc := ParamStr(1);
	for v := 1 to length(abc) do
	begin
		for x := 1 to length(something) do
		begin
			if abc[v] = something[x] then
			begin
				writeln(something);
				exit;
			end;
		end;
	end;
end;
var
	i: integer;
begin
	for i := 2 to ParamCount do
	begin
		onemore(ParamStr(i));
	end;
end.
