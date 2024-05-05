#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#ifndef ASM_H
#define ASM_H
    size_t      _my_strlen(char*);
    char*       _my_index(char*, char);
    int         _my_strcmp(char*, char*);
    int         _my_strncmp(char*, char*, size_t);
    int         _my_strcasecmp(char*, char*);
    char*       _my_strchr(char*, char);
    size_t      _my_read(int, char*, int);
    size_t      _my_write(int, char*, int);
    void*       _my_memcpy(char*, char*, size_t); 
    void*       _my_memset(char*, int, size_t);
    void*       _my_memmove(char*, char*, size_t);
#endif