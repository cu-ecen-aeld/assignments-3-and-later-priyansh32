#include <unistd.h>
#include <syslog.h>
#include <fcntl.h>
#include <string.h>

int main(int argc, char *argv[])
{
    openlog("writer", LOG_USER, LOG_DEBUG);

    if (argc != 3)
    {
        syslog(LOG_ERR, "Usage: %s <filename> <message>", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    char *message = argv[2];

    int fd = open(filename, O_WRONLY | O_CREAT, 0644);
    if (fd == -1)
    {
        syslog(LOG_ERR, "Failed to open file: %s", filename);
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", message, filename);
    if (write(fd, message, strlen(message)) == -1)
    {
        syslog(LOG_ERR, "Failed to write to file: %s", filename);
        return 1;
    }

    close(fd);
    return 0;
}