#include "include.h"

void print_strlen(char* str) {
    printf("C strlen: %ld Libasm strlen: %ld \n", strlen(str), _my_strlen(str));
}

void print_index(char* str) {
    char c = 'e';
    printf("C index: %s Libasm index: %s \n", index(str, c), _my_index(str, c));
}

void print_strcmp(char *str) {
    char src[] = "my_name";
    printf("C strcmp: %d Libasm strcmp: %d \n", strcmp(str, src),  _my_strcmp(str, src));
}

void print_strchr(char* str) {
    char ch = 'e';
    printf("C strchr: %s Libasm strchr: %s \n", strchr(str, ch), _my_strchr(str, ch));
}

void print_read_write() {
    printf("\nRead and write:\n");
    int fd = open("main/test.txt", O_RDONLY),
    libasm_fd = open("main/test.txt", O_RDONLY);

    char return_c[10], return_a[10];

    write(1, "C read: ", strlen("C read: "));
    read(fd, return_c, 10);
    write(1, return_c, 10);
    write(1, "\n", strlen("\n"));


    write(1, "Libasm read: ", strlen("Libasm read: "));
    _my_read(libasm_fd, return_a, 10);
    _my_write(1, return_a, 10);
    _my_write(1, "\n", strlen("\n"));
    _my_write(1, "\n", strlen("\n"));

    close(fd);
    close(libasm_fd);
}

 void print_strcasecmp(char* str1) {
     char str2[] = "string";
     printf("C strcasecmp: %d Libasm strcasecmp: %d \n", strcasecmp(str1, str2),  _my_strcasecmp(str1, str2));
 }

void print_memcpy() {
    char destination[] = "Hello world, How are you?";
    char destination_b[] = "Hello world, How are you?";
    char replace[] = "I'm good";

    printf("\nMemcpy: %s\n", destination_b);
    printf("C memcpy: %s\nLibasm memcpy: %s\n\n", (char*)memcpy(destination, replace, strlen(replace)+1), (char*)_my_memcpy(destination_b, replace, strlen(replace)+1));
}

void print_memset() {
    char str[] = "This is the original string";
    char str2[] = "This is the original string for Libasm";

    printf("C memset: %s\nLibasm memset: %s\n", (char*)memset(str, '$', 4), (char*)_my_memset(str2, '$', 4));
}

void print_memmove() {
    char dest[] = "This is the original string";
    char src[] = "This is the new string";

    printf("\nBefore memmove dest = %s, src = %s\n", dest, src);
    printf("C memmove: %s\nLibasm memmove: %s\n", (char*)memmove(dest, src, 9), (char*)_my_memmove(dest, src, 9));
}

void print_tests() {
    char test_str[] = "this is a test";
    
    print_strlen(test_str);

    print_index(test_str);

    print_strcmp(test_str);

    print_strchr(test_str);

    print_read_write();

    print_strcasecmp(test_str);

    print_memcpy();

    print_memset();

    print_memmove();
}

/*
    Running tests: 
    nasm -fmacho64 your_assembly_file.asm  
    OR
    nasm -f elf64 your_assembly_file.asm -o your_assembly_file.o
    gcc -no-pie -o test_program your_c_code.c your_assembly_file.o
*/

int main() {
    print_tests();
    return 0;
}