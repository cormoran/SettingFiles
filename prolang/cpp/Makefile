TARGET := target.out

OBJDIR := ./Object
DEPDIR := ./Dependency

CXX	:= g++
CPPFLAGS:= -O3 -std=c++1y
#DEBUG	:= -g
LIBS	:= 

SRCS := main.cpp

OBJS := $(addprefix $(OBJDIR)/,$(SRCS:%.cpp=%.o))
DEPS := $(addprefix $(DEPDIR)/,$(SRCS:%.cpp=%.d))


.PHONY:all
all: $(TARGET)

$(TARGET): ${OBJS}
	${CXX} ${CPPFLAGS} ${DEBUG} ${LIBS} -o $@ ${OBJS}

$(OBJDIR)/%.o:%.cpp
	@[ -d $(OBJDIR) ] || mkdir -p $(OBJDIR)
	@[ -d $(DEPDIR) ] || mkdir -p $(DEPDIR)
	$(CXX) -MMD -MP -MF $(DEPDIR)/$*.d $(CPPFLAGS)  -o $@ -c $<

-include $(DEPS)


.PHONY:clean
clean:
	rm -f $(OBJS) $(DEPS) $(TARGET) *~
	rmdir $(OBJDIR) $(DEPDIR)
