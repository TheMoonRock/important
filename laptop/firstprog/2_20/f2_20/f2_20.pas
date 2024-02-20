program f2_20;
procedure digital_string(abc: string);
var
	h: integer;
	s: string;
	b: integer;
begin
	b := 0;
	s := '';
	for h := 1 to length(abc) do
	begin
		if (((abc[h] >= 'A') and (abc[h] <= 'Z')) or ((abc[h] >= 'a') and (abc[h] <= 'z'))) then
		begin
			b := b + 1;
		end;
	end;
	if b >= 1 then
		writeln(abc);
end;
var
	i: integer;
begin
	for i := 0 to ParamCount do
	begin
		digital_string(ParamStr(i));
	end;
end.
