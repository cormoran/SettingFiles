TARGET  := a.out
CXX	:= clang++
CXXFLAGS:= -std=c++14
LIBS	:=
DEBUG	:= -g -DDEBUG -D_GLIBCXX_DEBUG -fsanitize=address

SRCS := main.cpp
OBJS=$(SRCS:.cpp=.o)

.PHONY:all
all: $(TARGET)

$(TARGET): ${OBJS}
	${CXX} ${CXXFLAGS} ${LIBS} -o $@ ${OBJS}

debug: $(TARGET)
	${CXX} ${CXXFLAGS} ${DEBUG} ${LIBS} -o $@ ${OBJS}

%.o: %.cpp
	$(CXX) $(CPPFLAGS) -o $@ -c $<

.PHONY:clean
clean:
	rm -f $(OBJS) $(TARGET) *~
