program e2_20;
procedure digital_string(abc: string);
var
	h: integer;
	s: string;
begin
	s := '';
	for h := 1 to length(abc) do
	begin
		if (abc[h] = abc[1]) then
		begin
			s := s + abc[h];
		end
		else
		begin
			exit;
		end;
	end;
	writeln(s);
end;
var
	i: integer;
begin
	for i := 0 to ParamCount do
	begin
		digital_string(ParamStr(i));
	end;
end.
