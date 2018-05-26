TARGET:=$(shell basename $(shell pwd))

all:
	g++ $(TARGET).cpp -o $(TARGET)

run:
	./$(TARGET) < test.txt

clean:
	rm $(TARGET)

edit:
	vi $(TARGET).cpp
