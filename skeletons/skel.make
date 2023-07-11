CC=g++
CFLAGS=-std=c++17 -g -pthread
SOURCES=$(wildcard *.cc)
OBJECTS=$(SOURCES:.cc=.out)

all: $(SOURCES) $(OBJECTS)
.cc.out:
	$(CC) $(CFLAGS) $< -o $@ 

clean:
	$(RM) $(OBJECTS)
	$(RM) *.s *.ii
