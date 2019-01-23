#include <stdio.h>

/*
	Very cool function below
*/

void	print_source_code()
{
	char *str = "#include <stdio.h>%c%c/*%c%cVery cool function below%c*/%c%cvoid%cprint_source_code()%c{%c%cchar *str = %c%s%c;%c%cprintf(str, 10, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 10);%c}%c%cint%cmain(void)%c{%c%c// I'm a single line comment%c%cprint_source_code();%c%creturn (0);%c}%c";
	printf(str, 10, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 10);
}

int	main(void)
{
	// I'm a single line comment
	print_source_code();
	return (0);
}
