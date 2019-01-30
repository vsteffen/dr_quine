#include <stdio.h>
#define SOURCE "#include <stdio.h>%c#define SOURCE %c%s%c%c#define FPRINTF(fd) fprintf(fd, SOURCE, 10, 34, SOURCE, 34, 10, 10, 34, 34, 34, 34, 10, 10, 10, 10, 10)%c#define GRACE int main(void) {FILE *fd; fd = fopen(%cGrace_kid.c%c,%cw%c); if (fd == NULL) return (1); FPRINTF(fd); fclose(fd); return (0);}%c%c/* I'm useful*/%c%cGRACE%c"
#define FPRINTF(fd) fprintf(fd, SOURCE, 10, 34, SOURCE, 34, 10, 10, 34, 34, 34, 34, 10, 10, 10, 10, 10)
#define GRACE int main(void) {FILE *fd; fd = fopen("Grace_kid.c","w"); if (fd == NULL) return (1); FPRINTF(fd); fclose(fd); return (0);}

/* I'm useful*/

GRACE
