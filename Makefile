BASE_DIR=${PWD}
PLUGIN=$(BASE_DIR)/plugins
COMPILER=$(shell root-config --cxx)
FLAGS=$(shell root-config --cflags --libs) -g -O3 -Wall -Wextra -Wpedantic
#INCLUDE=-I $(PLUGIN) -I $(PLUGIN)/blinder/rlib/include

all: install

install:
	@echo "install blinder"
	./blinder/install.sh

clean: clean-blinder clean-artifact

clean-artifact:
	find . \( -name "*.toc" -o -name "*~" -o -name "__*__" -o -name "#*#" \) -print0 | xargs -0 rm -rf

clean-blinder:
	rm -rf blinder/Blinders.o blinder/libBlinders.so blinder/packages blinder/rlib blinder/testBlinding.exe 
