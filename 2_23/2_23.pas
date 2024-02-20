program beta2_23;
var
	abc: string;
	i, b, t: integer;
begin
	t := 0;
	b := 0;
	if ParamCount <> 1 then
		writeln('Input is wrong!');
	abc := ParamStr(ParamCount);
	for i := 1 to length(abc) do
	begin
	if (((abc[i-1] = ' ') or (abc[i-1] = #9) or (abc[i-1] = #10)) and (abc[i-1] <> abc[i])) then
	begin
		b := b + 1;
	end;
	if t = 0 then
	begin
		b := b + 1;
		t := t + 1;
	end;
	end;
	writeln(b);
end.
