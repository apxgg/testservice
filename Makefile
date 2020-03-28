all: test

CXX = g++
CFLAGS = -std=c++17 -Wall -O3 -lpistache -lpthread
.PHONY: all

test:
	$(CXX) $(CFLAGS) src/main.cpp -o test