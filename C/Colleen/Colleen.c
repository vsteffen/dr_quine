#include <stdio.h>

/*
	Very cool function below
*/

void	print_source_code()
{
	char *str = "#include <stdio.h>%c%c/*%c%cVery cool function below%c*/%c%cvoid%cprint_source_code()%c{%c%cchar *str = %c%s%c;%c%cprintf(str, 10, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 10, 10);%c}%c%cint%cmain(void)%c{%c%c/*%c%c%cThis is gonna be amazing%c%c*/%c%cprint_source_code();%c%creturn (0);%c}%c";
	printf(str, 10, 10, 10, 9, 10, 10, 10, 9, 10, 10, 9, 34, str, 34, 10, 9, 10, 10, 10, 9, 10, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 10, 10);
}

int	main(void)
{
	/*
		This is gonna be amazing
	*/
	print_source_code();
	return (0);
}
