# Compiler
CC = gcc
AS = nasm

# Compiler flags
CFLAGS = -no-pie -Wall -Wextra
ASFLAGS = -f elf64

# Executable name
EXEC = my_libasm

# Source files
# compile all (*.c) and all (*.asm) files into object files (*.o)
SRCS = $(wildcard main/*.c)
ASMS = $(wildcard asm/*.asm)
OBJS = $(SRCS:.c=.o) $(patsubst asm/%.asm,asm/%.o,$(ASMS))

# Targets
all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

main/%.o: main/%.c
	$(CC) $(CFLAGS) -c $< -o $@

asm/%.o: asm/%.asm
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -f $(EXEC) $(OBJS)
