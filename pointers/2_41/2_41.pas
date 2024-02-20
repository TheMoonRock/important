program task2_40;
type
	itemptr = ^item;
	item = record
		chislo: longint;
		kolvo: integer;
		strelka: itemptr;
	end;
var
	x: integer;
	n: longint;
	test: boolean;
	numbers, tmp, o, zxc, vb: itemptr;
	pp, dd: ^itemptr;

begin
	x := 0;
	numbers := nil;
	while not SeekEof do
	begin
		test := false;
		read(n);
		if numbers = nil then
		begin
			new(numbers);
			tmp := numbers;
			o := numbers;
			zxc := numbers;
			tmp^.chislo := n;
			tmp^.strelka := nil;
			tmp^.kolvo := 1;
		end
		else
		begin
			vb := o;
			while vb <> nil do
			begin
				if vb^.chislo = n then
				begin
					test := true;
					vb^.kolvo := vb^.kolvo + 1;
					break;
				end;
				vb := vb^.strelka;
			end;
			if test	= true then
				continue;
			if tmp^.kolvo = 1 then
			begin
				new(tmp^.strelka);
				tmp := tmp^.strelka;
				tmp^.chislo := n;
				tmp^.strelka := nil;
				tmp^.kolvo := 1;
			end;
			{new(tmp^.strelka);
			tmp := tmp^.strelka}
		end;
		{tmp^.chislo := n;
		tmp^.strelka := nil;
		tmp^.kolvo := 0;}
		{vb := o;
		while vb <> nil do
		begin
			if vb^.chislo = n then
				tmp^.kolvo := tmp^.kolvo + 1;
			vb := vb^.strelka;
		end;}
	end;

	while o <> nil do
	begin
		if o^.kolvo > x then
		begin
			x := o^.kolvo;
		end;
		o := o^.strelka;
	end;

	while zxc <> nil do
	begin
		if zxc^.kolvo = x then
			writeln(zxc^.chislo);
		zxc := zxc^.strelka;
	end;
end.
