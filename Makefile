TARGET	= bin/dbview
SRC		= $(wildcard src/*.c)
OBJ		= $(patsubst src/%.c,obj/%.o, $(SRC))

.PHONY: run default clean

run: clean default
	./$(TARGET) -f ./file.db -n
	./$(TARGET) -f ./file.db 
	
default: $(TARGET)

clean:
	rm -f bin/*
	rm -f obj/*.o
	rm -f *.db

$(TARGET): $(OBJ)
	gcc -o $@ $^

obj/%.o: src/%.c
	gcc -c $< -o $@ -Iinclude


