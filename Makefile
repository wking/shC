CC := cc
CFLAGS := $(shell pkg-config --cflags jansson)
LDFLAGS := $(shell pkg-config --libs-only-L jansson)
LDLIBS := $(shell pkg-config --libs-only-l jansson)

.PHONY: all clean fmt
.PRECIOUS: %.o

all: ccon

%.o: %.c
	$(CC) $(CFLAGS) -c -o "$@" "$<"

ccon: %: %.o
	$(CC) $(LDFLAGS) -o "$@" "$<" $(LDLIBS) 

clean:
	rm -f *.o ccon

fmt:
	indent --ignore-profile --linux-style *.c
