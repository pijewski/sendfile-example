all: sendfile

sendfile: sendfile.c
	gcc -lsendfile -o sendfile sendfile.c

clean:
	rm -f sendfile sendfile.o
