CFLAGS=-target riscv64-unknown-freebsd -march=rv64imfd
LDFLAGS=-T riscv-test.ld
OBJDUMPFLAGS=-mattr=+f,+d -D

LD=ld.lld
CC=clang

all: test_nmsub

test_nmsub: init.o test_nmsub.o
	$(LD) $(LDFLAGS) -o test_nmsub init.o test_nmsub.o

test_nmsub.o: test_nmsub.s
	$(CC) $(CFLAGS) -c test_nmsub.s

init.o: init.s
	$(CC) $(CFLAGS) -c init.s

