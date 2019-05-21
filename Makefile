#Generate DWARF2 debugging information for each assembler line.

ASFLAGS = -c -g --gdwarf-2
LDFLAGS = -static
all: exit
exit: exit.s
         as $(ASFLAGS) -o exit.o -c exit.s
        ld $(LDFLAGS) -o exit exit.o
clean:
        rm exit *.o
