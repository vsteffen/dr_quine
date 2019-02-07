#include <stdio.h>
#include <libgen.h>
#include <stdlib.h>
#include <string.h>

void	free_alloc(char *file, char *file_exec, char *command)
{
	free(file);
	free(file_exec);
	free(command);
}

int	main(void)
{
	int i = 5;
	FILE *fd;
	char *file;
	char *file_exec;
	char *source = "#include <stdio.h>%c#include <libgen.h>%c#include <stdlib.h>%c#include <string.h>%c%cvoid%cfree_alloc(char *file, char *file_exec, char *command)%c{%c%cfree(file);%c%cfree(file_exec);%c%cfree(command);%c}%c%cint%cmain(void)%c{%c%cint i = %d;%c%cFILE *fd;%c%cchar *file;%c%cchar *file_exec;%c%cchar *source = %c%s%c;%c%cchar *command;%c%c%cif (!strstr(getenv(%c_%c), %cSully_%c))%c%c%ci++;%c%cif (i <= 0)%c%c%creturn (1);%c%c%casprintf(&file, %c%%s/Sully_%%d.c%c, dirname(__FILE__), --i);%c%cfd = fopen(file, %cw%c);%c%cif (fd == NULL)%c%c{%c%c%cfree(file);%c%c%creturn (1);%c%c}%c%cfprintf(fd, source, 10, 10, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 10, 10, 9, 10, 10, 9, i, 10, 9, 10, 9, 10, 9, 10, 9, 34, source, 34, 10, 9, 10, 10, 9, 34, 34, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 10, 10, 9, 10, 9, 92, 10, 9, 34, 34, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 10);%c%cfclose(fd);%c%c%cfile_exec = strdup(file);%c%cfile_exec[strlen(file_exec) - 2] = '%c0';%c%casprintf(&command, %cclang -Wall -Wextra -Werror %%s -o Sully_%%d ; %%s%c, file, i, file_exec);%c%cif (i > 0)%c%c%ci = system(command);%c%cfree_alloc(file, file_exec, command);%c%creturn (i);%c}%c";
	char *command;

	if (!strstr(getenv("_"), "Sully_"))
		i++;
	if (i <= 0)
		return (1);

	asprintf(&file, "%s/Sully_%d.c", dirname(__FILE__), --i);

	fd = fopen(file, "w");
	if (fd == NULL)
	{
		free(file);
		return (1);
	}
	fprintf(fd, source, 10, 10, 10, 10, 10, 9, 10, 10, 9, 10, 9, 10, 9, 10, 10, 10, 9, 10, 10, 9, i, 10, 9, 10, 9, 10, 9, 10, 9, 34, source, 34, 10, 9, 10, 10, 9, 34, 34, 34, 34, 10, 9, 9, 10, 9, 10, 9, 9, 10, 10, 9, 34, 34, 10, 9, 34, 34, 10, 9, 10, 9, 10, 9, 9, 10, 9, 9, 10, 9, 10, 9, 10, 9, 10, 10, 9, 10, 9, 92, 10, 9, 34, 34, 10, 9, 10, 9, 9, 10, 9, 10, 9, 10, 10);
	fclose(fd);

	file_exec = strdup(file);
	file_exec[strlen(file_exec) - 2] = '\0';
	asprintf(&command, "clang -Wall -Wextra -Werror %s -o Sully_%d ; %s", file, i, file_exec);
	if (i > 0)
		i = system(command);
	free_alloc(file, file_exec, command);
	return (i);
}
