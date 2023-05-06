#include<stdio.h>
#include<syslog.h>
#include<errno.h>
#include<string.h>

int main(int argc, char **argv)
{
	FILE *file;
	int errnum;

	openlog(NULL, 0, LOG_USER);

	if(3 == argc)
	{
		file = fopen(argv[1], "w");
		if(file == NULL)
		{
			errnum = errno;
			syslog(LOG_ERR, "%s", strerror(errnum) );
			closelog();
			return 1;
		}
		else
		{
			fprintf(file, "%s", argv[2]);
			syslog(LOG_DEBUG, "Writing %s to %s", argv[2], argv[1]);
		}



	}
	else
	{
		syslog(LOG_ERR, "Invalid number of arguments.Please insert file path and the string to write.");
		closelog();
		return 1;
	}
	fclose(file);
	closelog();
	return 0;
	
}
