# Set the compiler and flags
CC := $(CROSS_COMPILE)gcc
CFLAGS := -Wall -Werror -g

# Source and object files
SRC := writer.c
OBJ := $(SRC:.c=.o)

# Target executable
TARGET := writer

# Default target
all: $(TARGET)

# Build the writer application
$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJ)

# Rule to create .o files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target to remove the writer application and all .o files
clean:
	rm -f $(TARGET) $(OBJ)

.PHONY: all clean
