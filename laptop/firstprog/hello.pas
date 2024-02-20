program DiamondProc; {Diamond}

procedure PrintSpaces(count: integer);
var
	i: integer;
begin
	for i := 1 to count do
		write(' ')
end;

procedure PrintLineOfDiamond(k, n, a: integer);
var
	t: integer;
begin
	for t := 1 to a do
	begin
	PrintSpaces(n + 1 - k);
	write('*');
	if k > 1 then
	begin
		PrintSpaces(2*k-3);
		write('*');
	end;
	PrintSpaces(n+1-k);
	end;
	writeln()

end;

procedure copydiamond(k, n, a: integer);
begin
	for k := 1 to n + 1 do
		PrintLineOfDiamond(k, n, a);
	for k := n downto 1 do
		PrintLineOfDiamond(k, n, a)
end;

var
	n, k, h: integer;
	a, g: integer;
begin
	repeat
		write('Enter the diamond''s height (positive odd): ');
		readln(h)
	until (h > 0) and (h mod 2 = 1);
	n := h div 2;
	repeat
		write('Enter how much diamonds do you want: ');
		readln(a);
	until (a > 0);
	copydiamond(k, n, a)	
end.
