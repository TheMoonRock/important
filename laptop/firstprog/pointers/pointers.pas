program pointers;
type
	itemptr = ^item;
	item = record;
		data: char;
		next: itemptr;
	end;
var
	first: itemptr;
	c: char;
begin
	while not eof do
	begin
		read(c);
		if c <> ' ' then

	end;
end.
