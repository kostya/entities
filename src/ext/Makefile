.PHONY: package
package: ./entities-c/entities.o

./entities-c:
	git clone --depth 1 https://github.com/ooxi/entities entities-c

./entities-c/entities.o: ./entities-c
	cd entities-c && cc -O3 entities.c -c -std=c99

.PHONY: clean
clean:
	rm -rf entities-c
