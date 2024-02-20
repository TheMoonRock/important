program pointer2_42;
type
	LinkedListOfCharsPtr = ^LinkedListOfChars;
	LinkedListOfChars = record
		symbol: char;
		next: LinkedListOfCharsPtr;
	end;
	LinkedListOfWordsPtr = ^LinkedListOfWords;
	LinkedListOfWords = record
		NewWord: LinkedListOfCharsPtr;
		NextWord: LinkedListOfWordsPtr;
	end;
var
	OneWord, tmp1, output_test: LinkedListOfCharsPtr;
	OneSentence, tmp2, output_test_sentence: LinkedListOfWordsPtr;
	c: char;
begin
	{Сделать список списков. 
	В одном храняться слова предложенияб а во вложенном списке буквы слов. 
	Первый список выводить в обратном порядкею}
	OneWord := nil;
	OneSentence := nil;
	while not eof do
	begin
		read(c);
		if ((c <> ' ') and (c <> #9) and (c <> #10)) then
		begin
			if OneWord = nil then
			begin
				new(OneWord);
				tmp1 := OneWord;
				output_test := OneWord;
			end
			else
			begin
				new(tmp1^.next);
				tmp1 := tmp1^.next;
			end;
			tmp1^.symbol := c;
			tmp1^.next := nil
		end
		else
		begin
			new(tmp2);
			output_test_sentence := tmp2;
			tmp2^.NewWord := OneWord;
			tmp2^.NextWord := OneSentence;
			OneSentence := tmp2;
			OneWord := nil;
		end;
	end;

	while output_test_sentence <> nil do
	begin
		while (output_test_sentence^.NewWord <> nil) do
		begin
			write(output_test_sentence^.NewWord^.symbol);
			output_test_sentence^.NewWord := output_test_sentence^.NewWord^.Next;
		end;
		if output_test_sentence^.NewWord = nil then
			write(' ');
		output_test_sentence := output_test_sentence^.NextWord;;
	end;
	writeln();
	while OneWord <> nil do
	begin
		tmp1 := OneWord;
		OneWord := OneWord^.next;
		dispose(tmp1)
	end;	
end.
