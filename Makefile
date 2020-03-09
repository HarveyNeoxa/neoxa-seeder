CXXFLAGS = -O3 -g0 -march=native
LDFLAGS = $(CXXFLAGS)

dnsseed: dns.o ravencoin.o netbase.o protocol.o db.o main.o util.o
	g++ -pthread $(LDFLAGS) -o dnsseed dns.o ravencoin.o netbase.o protocol.o db.o main.o util.o -L/usr/local/Cellar/openssl@1.1/1.1.1d/lib -lcrypto

%.o: %.cpp *.h
	g++ -std=c++11 -pthread $(CXXFLAGS) -Wall -Wno-unused -Wno-sign-compare -Wno-reorder -Wno-comment -c -o $@ $<
