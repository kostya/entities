CRYSTAL ?= crystal
CRYSTALFLAGS ?= --release

.PHONY: all package spec
all: bin_index bin_walk_tree bin_links bin_texts
package: src/ext/myhtml-c/lib/static_libmyhtml.a

libs:
  crystal deps

bin_index: src/*.cr src/**/*.cr examples/index.cr package
  $(CRYSTAL) build examples/index.cr $(CRYSTALFLAGS) -o $@

bin_walk_tree: src/*.cr src/**/*.cr examples/walk_tree.cr package
  $(CRYSTAL) build examples/walk_tree.cr $(CRYSTALFLAGS) -o $@

bin_links: src/*.cr src/**/*.cr examples/links.cr package
  $(CRYSTAL) build examples/links.cr $(CRYSTALFLAGS) -o $@

bin_texts: src/*.cr src/**/*.cr examples/texts.cr package libs
  $(CRYSTAL) build examples/texts.cr $(CRYSTALFLAGS) -o $@

src/ext/myhtml-c/lib/static_libmyhtml.a:
  cd src/ext && make package

spec:
  crystal spec

.PHONY: clean
clean:
  rm -f bin_* src/ext/myhtml-c/lib/static_libmyhtml.a
