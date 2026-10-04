CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra -Iinclude
SRC = $(wildcard src/*.cpp)
smb3recomp: $(SRC) $(wildcard include/*.hpp)
	$(CXX) $(CXXFLAGS) -o $@ $(SRC)
clean:
	rm -f smb3recomp
